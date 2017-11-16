/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package crs_hibernate;

import java.util.Iterator;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.*;

public class request_deo implements crs_deo{
    
    
    @Override
    public Session getDBMSSession()
    {
        Session ss= new AnnotationConfiguration().configure().buildSessionFactory().openSession();
        return ss;
    }
    
    @Override
    public void submitRequest(Object req)
    {
        Session ss= getDBMSSession();
        Transaction tt= ss.beginTransaction();      
        ss.save(req);
        tt.commit();
        ss.close();
    }
    
    @Override
    public void submitAdvertise(advertise_bean req)
    {
        Session ss= getDBMSSession();
        Transaction tt= ss.beginTransaction();
        ss.save(req);
        tt.commit();
        ss.close();
    }
    
    
    @Override
    public List showAdvertise(int req_id)
    {
        Session ss= getDBMSSession();
        Query query=ss.createQuery("from advertise_bean where req_id=:param");
        query.setInteger("param", req_id);
        List list=query.list();
        return list;
    }
    
    
    @Override
    public List showRequests()
    {
        Session ss= getDBMSSession();
        Query query= ss.createQuery("from request_bean");
        List list= query.list();
        ss.close();
        return list;
    }
    
    
    @Override
    public List showRequestsToFinance()
    {
        Session ss= getDBMSSession();
        Query query= ss.createQuery("from request_bean where status_hr='Approved'");
        List list= query.list();
        ss.close();
        return list;
    }
    
    
    @Override
    public List showAdvertise()
    {
        Session ss= getDBMSSession();
        Query query= ss.createQuery("from advertise_bean");
        List list= query.list();
        ss.close();
        return list;
    }
    
    
    @Override
    public List showCandidateEducationDetails()
    {
        Session ss= getDBMSSession();
        Query query= ss.createQuery("from candidate_education_bean");
        List list= query.list();
        ss.close();
        return list;
    }
    
    @Override
    public List showCandidateBasicDetails()
    {
        Session ss= getDBMSSession();
        Query query= ss.createQuery("from candidate_basic_bean");
        List list= query.list();
        ss.close();
        return list;
    }
    
    
    @Override
    public List showCandidateFullDetails()
    {
        Session ss= getDBMSSession();
        Query query= ss.createQuery("from candidate_register_bean as c1,candidate_basic_bean as c2,candidate_education_bean as c3 where c1.candidate_id=c2.candidate_id and c2.candidate_id=c3.candidate_id");
        List list= query.list();
        ss.close();
        return list;
    }
    
    
    
    
    
    
    
    
    
    
    @Override
     public void registerCandidate(candidate_register_bean req)
    {
        Session ss= getDBMSSession();
        Transaction tt= ss.beginTransaction();
        ss.save(req);
        tt.commit();
        ss.close();
    }
    
    @Override
     public String validateCandOnRegister(String cand_id)
     {
        Session ss= getDBMSSession();
         candidate_register_bean c;
        Query query= ss.createQuery("from candidate_register_bean");
        List list= query.list();
         Iterator it = list.iterator();
         String temp=null;
         while(it.hasNext())
         {
             c=(candidate_register_bean)it.next();
             if(cand_id.equals(c.getCandidate_id()))
                    temp=c.getCandidate_id();
         }
         return temp;
     }
     
     
    @Override
     public void candidateBasicDetails(candidate_basic_bean req)
    {
        Session ss= getDBMSSession();
        Transaction tt= ss.beginTransaction();
        ss.save(req);
        tt.commit();
        ss.close();
    }
     
    @Override
     public String candBasicValidateOnLoad(String cand_id)
     {
        Session ss= getDBMSSession();
         candidate_basic_bean c;
        Query query= ss.createQuery("from candidate_basic_bean");
        List list= query.list();
         Iterator it = list.iterator();
         String temp=null;
         while(it.hasNext())
         {
             c=(candidate_basic_bean)it.next();
             if(cand_id.equals(c.getCandidate_id()))  
             {      
                    temp=c.getCandidate_id();
                    break;
             }
             
         }
         ss.close();
         return temp;
     }
     
    @Override
     public int validateAdvertiseOnLoad(int req_id)
     {
        Session ss= getDBMSSession();
        advertise_bean c;
        Query query= ss.createQuery("from advertise_bean");
        List list= query.list();
         Iterator it = list.iterator();
         int temp=0;
         while(it.hasNext())
         {
             c=(advertise_bean)it.next();
             if(req_id==c.getReq_id())
             {
                    temp=c.getReq_id();
                    break;
             }
             
         }
         if(req_id==temp)
         {
             return temp;
         }
         else
         {
             return 0;
         }
     }
     
    @Override
     public void submitAllCanDetails(candidate_education_bean be)
     {
          Session ss= getDBMSSession();
        Transaction tt= ss.beginTransaction();
        ss.save(be);
        tt.commit();
        ss.close();
     }
     
     
    @Override
     public candidate_basic_bean fetchCandidateBasicDetails(String can_id)
     {
        Session ss= getDBMSSession();
        candidate_basic_bean b= new candidate_basic_bean();
        Query query= ss.createQuery("from candidate_basic_bean where candidate_id=:param");
        query.setString("param", can_id);
        List list= query.list();
         Iterator it = list.iterator();
         while(it.hasNext())
         {
             b=(candidate_basic_bean)it.next();
         }
         return b;
     }
     
     @Override
     public candidate_education_bean fetchCandidateEducationDetails(String can_id)
     {
        Session ss= getDBMSSession();
        candidate_education_bean b= new candidate_education_bean();
        Query query= ss.createQuery("from candidate_education_bean where candidate_id=:param");
        query.setString("param", can_id);
        Iterator it= query.list().iterator();
         while(it.hasNext())
         {
             b=(candidate_education_bean)it.next();
         }
         return b;
     }
     
     
     @Override
     public candidate_register_bean fetchCandidateRegistrationDetails(String can_id)
     {
        Session ss= getDBMSSession();
        candidate_register_bean b= new candidate_register_bean();
        Query query= ss.createQuery("from candidate_register_bean where candidate_id=:param");
        query.setString("param", can_id);
        Iterator it= query.list().iterator();
         while(it.hasNext())
         {
             b=(candidate_register_bean)it.next();
         }
         return b;
     }
     
     
    @Override
     public String candidateLoginValidation(String userid, String pass)
     {
         Session ss= getDBMSSession();
         candidate_register_bean b;
        Query query= ss.createQuery("from candidate_register_bean");
        List list= query.list();
         Iterator it = list.iterator();
         String pwd=null;
         while(it.hasNext())
         {
             b=(candidate_register_bean)it.next();
             if(userid.equals(b.candidate_id))
             {
                  pwd=b.getPassword();
                  break;
             }
         }
         if(pass.equals(pwd))
             return "True";
         else 
             return "False";
     }
     
     
    @Override
     public List showIndentorReqDetails(int id)
     {
         
         Session ss= getDBMSSession();
        request_bean c=null;
        Query query= ss.createQuery("from request_bean where req_id=:param");
        query.setInteger("param", id);
        List list= query.list();
         return list;
     }
     
   
     
     
     
     
     public void validateApprovalRequest(String val,int id)
     {
          Session ss= getDBMSSession();
      Transaction tt = ss.beginTransaction();
        
      if(val.equals("yes") || val.equals("no") )
      {
       if(val.equals("yes"))
        {   Query query= ss.createQuery("update request_bean set status_hr='Approved' where req_id=:param");
            query.setInteger("param", id);
            query.executeUpdate();
            tt.commit();
        }
        if(val.equals("no"))
        {
            Query query= ss.createQuery("update request_bean set status_hr='Rejected' where req_id=:param");
            query.setInteger("param", id);
            query.executeUpdate();
            tt.commit();
        }
        
      }
      else
      {
         if(val.equals("y"))
        {   Query query= ss.createQuery("update request_bean set status_finance='Approved' where req_id=:param");
            query.setInteger("param", id);
            query.executeUpdate();
            tt.commit();
        }
        if(val.equals("n"))
        {
            Query query= ss.createQuery("update request_bean set status_finance='Rejected' where req_id=:param");
            query.setInteger("param", id);
            query.executeUpdate();
            tt.commit();
        } 
      }
      ss.close();
     
     }
     
     
    @Override
     public void applyForJob(job_applied_bean j)
     {
         Session ss =getDBMSSession();
         Transaction tt= ss.beginTransaction();
         
         ss.save(j);
         tt.commit();
         ss.close();
     }
     
     
     
     
     public boolean jobapplicationvalidation(job_applied_bean jab)
     {
         Session ss=getDBMSSession();
         Query query= ss.createQuery("from job_applied_bean where adv_id=:param");
         query.setInteger("param", jab.getAdv_id());
         
         List list= query.list();
         job_applied_bean b;
         Iterator it= list.iterator();
         while(it.hasNext())
         {
             b= (job_applied_bean)it.next();
             if((jab.getCandidate_id()).equals(b.getCandidate_id()))
             {
                 return true;
             }
         }
         return false;
     }

    @Override
     public boolean isvalidEmailandAnswer(String id,String ans)
     {
         Session ss=getDBMSSession();
         Query query=ss.createQuery("from employee_bean where emp_id=:param");
         query.setString("param", id);
         
         Iterator it= query.list().iterator();
         employee_bean b= new employee_bean();
         while(it.hasNext())
         {
             b= (employee_bean)it.next();
         }
        return ans.equals(b.getSecurity_question());
     }
     
     
    @Override
     public int changeEmpPassword(String id,String pass)
     {
         Session ss=getDBMSSession();
         Transaction tt= ss.beginTransaction();
         Query query=ss.createQuery("update employee_bean set password=:param1 where emp_id=:param2");
         query.setString("param1", pass);
         query.setString("param2", id);
         
         int i=query.executeUpdate();
         
         tt.commit();
         ss.close();
         return i;
     }
     
     
    @Override
     public boolean isvalidCandidateandAnswer(String id, String ans)
     {
         Session ss=getDBMSSession();
         Query query=ss.createQuery("from candidate_register_bean where candidate_id=:param");
         query.setString("param", id);
         
         Iterator it= query.list().iterator();
         candidate_register_bean b= new candidate_register_bean();
         while(it.hasNext())
         {
             b= (candidate_register_bean)it.next();
         }
        return ans.equals(b.getSecurity_question());
     }
   
     
     @Override
     public int changeCandidatePassword(String id,String pass)
     {
         Session ss=getDBMSSession();
         Transaction tt= ss.beginTransaction();
         Query query=ss.createQuery("update candidate_register_bean set password=:param1 where candidate_id=:param2");
         query.setString("param1", pass);
         query.setString("param2", id);
         
         int i=query.executeUpdate();
         
         tt.commit();
         ss.close();   
         return i;
     }
     
}
