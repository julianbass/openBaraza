package org.baraza.hcm;

import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.tika.exception.TikaException;
import org.apache.tika.metadata.Metadata;
import org.apache.tika.parser.AutoDetectParser;
import org.apache.tika.parser.ParseContext;
import org.apache.tika.parser.Parser;
import org.apache.tika.sax.BodyContentHandler;
import org.apache.tika.sax.ToXMLContentHandler;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.parser.Tag;
import org.jsoup.select.Elements;

import org.xml.sax.ContentHandler;
import org.xml.sax.SAXException;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;

import org.json.JSONObject;

import org.baraza.xml.BXML;
import org.baraza.xml.BElement;
import org.baraza.DB.BDB;
import org.baraza.DB.BQuery;
import org.baraza.DB.BUser;
import org.baraza.utils.BWebUtils;
import org.baraza.utils.BWebdav;

@MultipartConfig(fileSizeThreshold = 1024 * 1024,
	maxFileSize = 1024 * 1024 * 5,
	maxRequestSize = 1024 * 1024 * 5 * 5)
public class BApplication extends HttpServlet {
	Logger log = Logger.getLogger(BApplication.class.getName());

	BDB db = null;
	BElement root = null;
	BElement view = null;
	BUser user = null;
	long maxfs = 0;
	BWebdav webdav = null;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);

		ServletContext context = config.getServletContext();
		String xmlCnf = config.getInitParameter("xmlfile");
		String projectDir = context.getInitParameter("projectDir");
		String ps = System.getProperty("file.separator");
		String xmlFile = context.getRealPath("WEB-INF") + ps + "configs" + ps + xmlCnf;
		if(projectDir != null) xmlFile = projectDir + ps + "configs" + ps + xmlCnf;

		BXML xml = new BXML(xmlFile, false);

		if(xml.getDocument() != null) {
			root = xml.getRoot();

			String dbConfig = "java:/comp/env/jdbc/database";
			db = new BDB(dbConfig);
			db.setOrgID(root.getAttribute("org"));
		}

		String webPath = context.getInitParameter("repository_base");
		String repositoryFolder = context.getInitParameter("repository_folder");
		if(repositoryFolder == null) repositoryFolder = "";
		else repositoryFolder +=  "/";
		String repository = webPath + root.getAttribute("repository") + repositoryFolder;
		System.out.println("BASE 1020 : " + repository);

		String username = context.getInitParameter("rep_username");
		String password = context.getInitParameter("rep_password");

		maxfs = (Long.valueOf(root.getAttribute("maxfilesize", "16777216"))).longValue();

		if(repository != null) webdav = new BWebdav(repository, username, password);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)  {
		JSONObject jResp = new JSONObject();

		if(!db.isValid()) db.reconnect("java:/comp/env/jdbc/database");

		String viewKey = request.getParameter("view");
		view = root.getView(viewKey);
		// System.out.println(view.toString());

		user = new BUser(db, request.getRemoteAddr(), "root", true);

		try {
			System.out.println(BWebUtils.isMultipartContent(request));

			String[] wdfn = null;
			String cvData = null;
			Map<String, String[]> reqParams = new HashMap<String, String[]>();
			reqParams.putAll(request.getParameterMap());

			if(BWebUtils.isMultipartContent(request)) {
				for (Part part : request.getParts()) {
					if((part.getContentType() != null) && (part.getSize() > 0)) {
						wdfn = saveFile(part);

						cvData = readCV(part.getInputStream());
					}
				}
			}

			jResp = updateFormData(request, reqParams, wdfn, cvData);
		} catch(IOException  ex) {
			log.severe("IOException error : " + ex);
		} catch(ServletException ex) {
			log.severe("ServletException Error : " + ex);
		}

		try {
			response.setContentType("application/json;charset=\"utf-8\"");
			PrintWriter out = response.getWriter();
			out.println(jResp.toString());
		} catch(IOException ex) {}

	}

    public JSONObject updateFormData(HttpServletRequest request, Map<String, String[]> reqParams, String[] wdfn, String cvData) {
		String saveMsg = "";
		JSONObject jResp = new JSONObject();

		String formlink = view.getAttribute("keyfield") + " = null";
		List<String> viewData = new ArrayList<String>();

		BQuery qForm = new BQuery(db, view, formlink, null, user, false);

		qForm.recAdd();
		if(wdfn[1] != null) qForm.updateField("cv_file", wdfn[1]);
		if(cvData != null) qForm.updateField("cv_data", cvData);
		saveMsg = qForm.updateFields(reqParams, viewData, request.getRemoteAddr(), null);

		if("".equals(saveMsg)) {
			String upd = "UPDATE sys_files SET table_id = " + qForm.getKeyField()
				+ " WHERE sys_file_id = " + wdfn[0];
			db.executeUpdate(upd);

			BElement fView = view.getElementByName("FORMVIEW");
			formlink = fView.getAttribute("linkfield") + " = " + qForm.getKeyField();

			BQuery qfView = new BQuery(db, fView, formlink, null, user, true);
			if(qfView.moveFirst()) jResp.put("data", qfView.getRowJSON());
			qfView.close();

			jResp.put("error", "0");
			jResp.put("msg", saveMsg);
		} else {
			jResp.put("error", "1");
			jResp.put("msg", saveMsg);
		}
		qForm.close();

		return jResp;
	}

	public String[] saveFile(Part part) {
		String[] aResp = new String[2];

		try {
			String contentType = part.getContentType();
			String fieldName = part.getName();
			String fileName = BWebUtils.getFileName(part.getHeader("content-disposition"));
			long fs = part.getSize();

			if((part.getSize() > 0) && (fs < maxfs)) {
System.out.println("BASE 1410 : " + fileName);
				String orgID = db.getOrgID();
				String userOrg = user.getUserOrg();
				String userID = user.getUserID();
				String narrative = "Applicant CV";
System.out.println("BASE 1420 : " + orgID + " : " + userOrg + " : " + userID);

				String ext = ".dat";
				if(fileName.lastIndexOf(".") > 0) ext = fileName.substring(fileName.lastIndexOf("."));
				if(ext == null) ext = ".dat";
				if(ext.equals(".jsp")) return null;

				BElement flView = view.getElementByName("FILES");
				String fileTable = flView.getAttribute("filetable");
				BQuery flrs = new BQuery(db, flView, null, null, user, false);
				flrs.recAdd();
				flrs.updateField("file_name", fileName);
				if(fileTable != null) flrs.updateField("table_name", fileTable);
				if(contentType != null) flrs.updateField("file_type", contentType);
				if(narrative != null) flrs.updateField("narrative", narrative);
				if(orgID != null) flrs.updateField(orgID, userOrg);
				flrs.updateField("file_size", String.valueOf(fs));

				flrs.recSave();

				aResp[0] = flrs.getKeyField();
				aResp[1] = flrs.getKeyField() + "ob" + ext;
System.out.println("BASE 1440 : " + aResp[1]);

				webdav.saveFile(part.getInputStream(), aResp[1]);
			}

		} catch(IOException ex) {
			log.severe("IO Error : " + ex);
		}

		return aResp;
	}

	public String readCV(InputStream cvFile) {
		String htmlContent = null;

		try {
			Parser parser = new AutoDetectParser();
			ContentHandler handler = new ToXMLContentHandler();
			Metadata metadata = new Metadata();
			ParseContext context = new ParseContext();

			parser.parse(cvFile, handler, metadata, context);

			htmlContent = handler.toString();
		} catch(SAXException ex) {
			System.out.println("SAXException error : " + ex);
		} catch(IOException  ex) {
			System.out.println("IOException error : " + ex);
		} catch(TikaException  ex) {
			System.out.println("TikaException error : " + ex);
		}

		return htmlContent;
	}

}
