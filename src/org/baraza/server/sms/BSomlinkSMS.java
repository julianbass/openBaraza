/**
 * @author      Dennis W. Gichangi <dennis@openbaraza.org>
 * @version     2023.0329
 * @since       2.6
 * website		www.openbaraza.org
 * The contents of this file are subject to the GNU Lesser General Public License
 * Version 3.0 ; you may use this file in compliance with the License.
 */
package org.baraza.server.sms;

import java.util.concurrent.TimeUnit;
import java.util.Base64;
import java.util.Date;
import java.util.Iterator;
import java.text.SimpleDateFormat;

import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.io.File;
import java.io.InputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;

import okhttp3.HttpUrl;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class BSomlinkSMS {

	String sURL = "http://102.38.50.124:500/send";
	String callerID = null;

	/* message construct
		http://102.38.50.124:500/send?apikey=2295ee&secretkey=c8a0
		&content=[{"callerID":"SOMLINK HR","toUser":"252640000000","messageContent":"Test New HR system"}]
	*/

	public BSomlinkSMS(String apiKey, String secretKey, String callerID) {
		sURL += "?apikey=" + apiKey + "&secretkey=" + secretKey;
		this.callerID = callerID;
	}

	public String sendSMS(String number, String message) {
		String resp = "";

		if(callerID == null) return resp;

		// Reset email
		JSONObject jData = new JSONObject();
		jData.put("callerID", callerID);
		jData.put("toUser", number);
		jData.put("messageContent", message);
		JSONArray jaData = new JSONArray();
		jaData.put(jData);

		String sResp = sendData(jaData.toString());

		return resp;
	}

	public String sendData(String data) {
		String resp = null;

		try {
			HttpUrl.Builder urlBuilder = HttpUrl.parse(sURL).newBuilder();
			urlBuilder.addQueryParameter("content", data);
			String url = urlBuilder.build().toString();

			OkHttpClient client = new OkHttpClient();
			Request request = new Request.Builder()
				.url(url)
				.build();
			Response response = client.newCall(request).execute();
			resp = response.body().string();
System.out.println(resp);

		} catch(IOException ex) {
			System.out.println("IO Error : " + ex);
		}

		return resp;
	}

	
}
