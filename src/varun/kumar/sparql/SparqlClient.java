package varun.kumar.sparql;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class SparqlClient {
    private static final String SPARQL_NS =
            "http://www.w3.org/2005/sparql-results#";

    public static String execute(String endpoint, String query, String username, String password, Boolean isResoningEnable) {
        query = urlencode(query);
        
        String url = "";
        
        if (isResoningEnable)
        	url = endpoint + "?reasoning=true&query=" + query;
        else
        	url = endpoint + "?query=" + query;
        
        
        return getResponse(url, username, password);
    }

    

    private static String getResponse(String url, String username, String password) {
        try {
            URL urlobj = new URL(url);
            HttpURLConnection conn = (HttpURLConnection) urlobj.openConnection();


            // Basic Authorization
            if (username != null && password != null) {

                String userPassword = username + ":" + password;
                String encoding = new sun.misc.BASE64Encoder().encode(userPassword.getBytes());
                conn.setRequestProperty("Authorization", "Basic " + encoding);

            }

            conn.setRequestProperty("Accept", "application/sparql-results+json");
            
            JsonParser jsonParser = new JsonParser();
            JsonObject  jsonObject = (JsonObject)jsonParser.parse(
            	      new InputStreamReader(conn.getInputStream(), "UTF-8"));
           
           
      		 conn.disconnect();
      		  
      		 return jsonObject.toString();
      		  
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private static String urlencode(String url) {
        try {
            return URLEncoder.encode(url, "utf-8");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    
    
    
    public static void main(String[] args){
    	SparqlClient client = new SparqlClient();
    	String jsonString = client.execute("http://localhost:5820/annex/duke/sparql/query", "select * where {?s ?p ?o}", "admin", "admin", false);
    	System.out.println(jsonString);
    }

}