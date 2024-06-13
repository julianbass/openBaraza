package org.baraza.hcm;

import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
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

import org.baraza.utils.BWebUtils;

@MultipartConfig(fileSizeThreshold = 1024 * 1024,
	maxFileSize = 1024 * 1024 * 5,
	maxRequestSize = 1024 * 1024 * 5 * 5)
public class BReadCV extends HttpServlet {
	Logger log = Logger.getLogger(BReadCV.class.getName());

	public void doPost(HttpServletRequest request, HttpServletResponse response)  {
		JSONObject jResp = new JSONObject();

		try {
		System.out.println(BWebUtils.isMultipartContent(request));

			if(BWebUtils.isMultipartContent(request)) {

				for (Part part : request.getParts()) {
				System.out.println(part.getContentType());
				System.out.println(part.getSize());

					if((part.getContentType() != null) && (part.getSize() > 0)) {
						Map<Integer, StringBuilder> cvData = readCV(part.getInputStream());
						for (Integer key : cvData.keySet()) {
							if(key == 0) { jResp.put("cv_content", cvData.get(key)); }
							else if(key == 1) { jResp.put("introduction", cvData.get(key)); }
							else if(key == 2) { jResp.put("summary", cvData.get(key)); }
						}
					}
				}
			}
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

	public Map<Integer, StringBuilder> readCV(InputStream cvFile) {
		StringBuilder cvContent = new StringBuilder();
		Map<Integer, StringBuilder> cvData = new HashMap<Integer, StringBuilder>();
		for(int i = 0; i < 7; i++) cvData.put(i, new StringBuilder());
		
		try {
			Parser parser = new AutoDetectParser();
			ContentHandler handler = new ToXMLContentHandler();
			Metadata metadata = new Metadata();
			ParseContext context = new ParseContext();

			parser.parse(cvFile, handler, metadata, context);

			String[] metadataNames = metadata.names();
			for(String name : metadataNames) System.out.println(name + ": " + metadata.get(name));

			String htmlContent = handler.toString();
			System.out.println("Extracted CV content:\n");
			System.out.println("htmlcontent" + htmlContent);
			
			Document doc = Jsoup.parse(htmlContent);
			Elements elements = doc.body().select("*");
        	Elements paragraphs = doc.body().select("p");
			System.out.println("number" + paragraphs);

			int bodyType = 1;
			boolean isEducationSection = false;
			
			for (Element paragraph : paragraphs) {
				String text = paragraph.text().toLowerCase(); 

				if (text.contains("summary")) { bodyType = 2; }
				if (text.contains("skills")) { bodyType = 3; }
				if (text.contains("experience")) {
					System.out.println("There is EXPERIENCE");
					bodyType = 4;
				}
				if (text.contains("references")  || text.contains("referees")) {
					System.out.println("There is REFERENCES or referees");
					bodyType = 5;
				}
				if (text.contains("education")) {
					System.out.println("There is education");
					bodyType = 6;
				}
				

				cvData.get(bodyType).append(text + "\n");
			}

			for (Element element : elements) {
				cvContent.append(element.ownText() + "\n");
			}

		} catch(SAXException ex) {
			System.out.println("SAXException error : " + ex);
		} catch(IOException  ex) {
			System.out.println("IOException error : " + ex);
		} catch(TikaException  ex) {
			System.out.println("TikaException error : " + ex);
		}

		cvData.get(0).append(cvContent.toString());

		return cvData;
	}
    
}
