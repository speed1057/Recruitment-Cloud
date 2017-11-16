/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*package crs_utilities;

import com.orps.data.DAO.DataDAO;
import com.cdac.ORM.PostAdvtDetails;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.TemporalType;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.json.JSONException;
import org.json.JSONObject;


public class GoogleHandler {
    private  String scope;
    private  String redirectUri;
    private  String responseType;
    private  String clientId;
    private  String approval;
    private  String  clientsec="2uY5q18f2l_odWSPAi0yQPIs";
   public GoogleHandler()
   {
       
   }
  
    
    private DataDAO gooDAO;

    public DataDAO getGooDAO() {
        return gooDAO;
    }

    public void setGooDAO(DataDAO gooDAO) {
        this.gooDAO = gooDAO;
    }
    
    
    
    
  
    public  String getUrl()
    {
        scope="email";
        redirectUri="http://localhost:9999/recruit/gooLogin";
        responseType="code";
        clientId="1045409419999-oo26iqmgdhetuck1k7e734m9cj9thvam.apps.googleusercontent.com";
        approval="auto";
       
        
        return "https://accounts.google.com/o/oauth2/auth?scope="+scope+"&redirect_uri="+redirectUri+"&response_type="+responseType+"&client_id="+clientId+"&approval_prompt="+approval;
    }
    
    public  List<PostAdvtDetails> getAdvt()
    {
        try
        {
         
            System.out.println("getAdvt()-----+Google Handler+-----req code>");    
            
        Date d=new Date();
        System.out.println("current sys date*********-->"+d);
        
        
        
        
            System.out.println("hibernateTemplate*********-->"+gooDAO);    

List<PostAdvtDetails> padvt =  gooDAO.getAdvtByDate(d); // hibernateTemplate.findByNamedParam("FROM PostAdvtDetails o where o.startDate < :dt and o.endDate > :dt", "dt", d);
System.out.println("sess--->****"+padvt);
                List<PostAdvtDetails> l=padvt;
                if(l.size()>0)
                {
                    return l;
                    //pk=l.get(0).getId();
                }
                return l;
                // System.out.println(pk+"......................................");
        }catch(Exception e)
        {
            e.printStackTrace();
            return null;
        }
        
    }
    
   
    
    public  User getUser(String code)
    {
        User u=null;
        try {
            // format parameters to post
            String urlParameters = "code="
                    + code
                    + "&client_id="+clientId
                    + "&client_secret="+clientsec
                    + "&redirect_uri="+redirectUri
                    + "&grant_type=authorization_code";
            
            //post parameters
            URL url = new URL("https://accounts.google.com/o/oauth2/token");
            URLConnection urlConn = url.openConnection();
            urlConn.setDoOutput(true);
            OutputStreamWriter writer = new OutputStreamWriter(
                    urlConn.getOutputStream());
            writer.write(urlParameters);
            writer.flush();
            
            //get output in outputString 
            String line, outputString = "";
            BufferedReader reader = new BufferedReader(new InputStreamReader(
                    urlConn.getInputStream()));
            while ((line = reader.readLine()) != null) {
                outputString += line;
            }
            System.out.println(outputString);
            
            //get Access Token 
            String access_token=null;
            try{
            JSONObject json = new JSONObject(outputString);
            access_token = json.get("access_token").toString();
            System.out.println(access_token);
            }catch(Exception e){e.printStackTrace();}
            //get User Info 
            url = new URL(
                    "https://www.googleapis.com/oauth2/v1/userinfo?access_token="
                            + access_token);
            urlConn = url.openConnection();
            outputString = "";
            reader = new BufferedReader(new InputStreamReader(
                    urlConn.getInputStream()));
            while ((line = reader.readLine()) != null) {
                outputString += line;
            }
            System.out.println(outputString);
            
            JSONObject obj=null;
            try{
                    obj=new JSONObject(outputString);}catch(Exception e){e.printStackTrace();}
            Iterator i=obj.keys();
            u=new User();
            while(i.hasNext())
            {
                String k=(String)i.next();
                
                if(k.equals("email"))
                {
                    try {
                        
                        System.out.println("**********Email---->"+obj.getString(k));
                        u.setEmail(obj.getString(k));
                        
                    } catch (JSONException ex) {
                        Logger.getLogger(GoogleHandler.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                
            }
            System.out.println("bhut");
            writer.close();
            reader.close();
            
        } catch (MalformedURLException e) {
            System.out.println( e);
        } catch (ProtocolException e) {
            System.out.println( e);
        } catch (IOException e) {
            System.out.println( e);
        }
        return u;
    }
}*/