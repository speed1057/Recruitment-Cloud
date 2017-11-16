
package crs_jdbc;

import java.sql.*;

public class crs_dbms {
    
    String host;
    String user;
    String password;
    String db;

    public crs_dbms()
    {
        db="cr_system";
        host="jdbc:mysql://localhost/cr_system";
        user="root";
        password="";
    }
    
    
    
        public Connection getJdbcConnection() throws Exception
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con= DriverManager.getConnection(host, user, password);
            return con;
        }
    
        public String empLoginValidation(String userid , String password) throws Exception
        {
            Connection con= getJdbcConnection();
            String query="select * from employee where emp_id=?";
            
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, userid);
            
            ResultSet rs= stmt.executeQuery();
            String temp=null,pass=null;
             
               while(rs.next())
                {
                    pass= rs.getString("password");
                    temp=rs.getString("job");
                }
               con.close();
            
               if(password!=null && password.equals(pass))
                {
                    System.out.println("Valid User!");
                    return temp;
                }
                else
                {
                    System.out.println("Invalid User!");
                    return null;
                }
        }
        
        
        
        
        
        
        public ResultSet fethchDetails(String userid)throws Exception
        {
            Connection con= getJdbcConnection();
            String query="select * from employee where emp_id=?";
            
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, userid);
            
            ResultSet rs= stmt.executeQuery();
            
            return rs;
        
        }
         
        public ResultSet fetchAllCandidateData() throws Exception
        {
            Connection con= getJdbcConnection();
            String query="select * from candidate_basic_details c1,candidate_education_details c2 where c1.candidate_id=c2.candidate_id";
            
            PreparedStatement stmt = con.prepareStatement(query);
            
            ResultSet rs= stmt.executeQuery(); 
            
            return rs;
        }
        
        public ResultSet fetchAdvertiseData() throws Exception
        {
            Connection con= getJdbcConnection();
            String query="select * from advertise b1,resource_request b2 where b1.req_id=b2.req_id";
            
            PreparedStatement stmt = con.prepareStatement(query);
            
            ResultSet rs= stmt.executeQuery(); 
            
            return rs;
        } 
        
        public ResultSet countAdvertise()throws Exception
        {
            Connection con= getJdbcConnection();
            String query="select count(*) cc from advertise b1,resource_request b2 where b1.req_id=b2.req_id";
            
            PreparedStatement stmt = con.prepareStatement(query);
           ResultSet rs= stmt.executeQuery();
           return rs;
        }
        
        public ResultSet showAppliedJobByCandidate(String cand_id)throws Exception
        {
            Connection con=getJdbcConnection();
            PreparedStatement p= con.prepareStatement("select * from job_applied j,resource_request r,advertise a where j.req_id=r.req_id and j.req_id=a.req_id and j.candidate_id=?");
            p.setString(1, cand_id);
            ResultSet rs= p.executeQuery();
            return rs;
        }
        
        public void UploadPhoto(String cand_id,String photo) throws Exception
        {
            Connection con=getJdbcConnection();
            PreparedStatement p= con.prepareStatement("insert into file_storage values (?,?)");
            p.setString(1, cand_id);
            p.setString(2, photo);
            p.executeUpdate();
            con.close();
        }
        
        
        public String PhotofileName(String cand_id)throws Exception
        {
            Connection con=getJdbcConnection();
            PreparedStatement p= con.prepareStatement("select * from file_storage where candidate_id=?");
            p.setString(1, cand_id);
            ResultSet rs= p.executeQuery();
            String fname=null;
            while(rs.next())
            {
                fname=rs.getString("photo_id");
            }
            return fname;
        }
        
          
}
