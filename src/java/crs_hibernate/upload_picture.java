/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package crs_hibernate;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.http.Part;


public class upload_picture {    
InputStream iprofile=null;
String pathP="C:\\Users\\gohan\\Desktop\\Project Data\\Recruitment Software\\web\\profile";
            
public String getFileName(final Part part) {
    for (String content : part.getHeader("content-disposition").split(";")) {
        if (content.trim().startsWith("filename")) {
            return content.substring(
                    content.indexOf('=') + 1).trim().replace("\"", "");
        }
    }
    return null;
}

public void uploadImage(Part filePart1)throws Exception
    {
            File fileP=new File(pathP);
            fileP.mkdir();
           
              OutputStream  out1 = new FileOutputStream(new File(pathP + File.separator+ "name.jpg"));
               InputStream filecontent1 = filePart1.getInputStream();//profile
                int read1;
                final byte[] bytes1 = new byte[1024*1024];
                
                while ((read1 = filecontent1.read(bytes1)) != -1) 
                {
                    out1.write(bytes1, 0, read1);
           
                }
               
    }
  
}
