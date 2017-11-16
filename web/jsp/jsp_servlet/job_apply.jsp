<%@page import="crs_hibernate.request_bean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="crs_hibernate.EmailUtility"%>
<%@page import="crs_hibernate.job_applied_bean"%>
<%@page import="crs_hibernate.request_deo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   String cand_id= request.getParameter("candidate_id");
   String id1=request.getParameter("adv_id");
   String id2=request.getParameter("req_id");
   int adv_id= Integer.parseInt(id1);
   int req_id= Integer.parseInt(id2); 
   
   job_applied_bean jab= new job_applied_bean();
   
   jab.setCandidate_id(cand_id);
   jab.setAdv_id(adv_id);
   jab.setReq_id(req_id);
   
   
   
   request_deo deo= new request_deo();
   if(deo.jobapplicationvalidation(jab))
   {
       String messsage="You have already Applied for this job!";
    session.setAttribute("message", messsage);
    response.sendRedirect(request.getContextPath()+"/jsp/home_candidate.jsp");

   }
    else
   {
       List l=deo.showIndentorReqDetails(req_id);
       Iterator tt= l.iterator();
       request_bean b=null;
       while(tt.hasNext())
       {
           b=(request_bean)tt.next();
       }
       
       deo.applyForJob(jab);
           String toAddress = jab.getCandidate_id();
           String subject = "Corporate Recruitment System- No-Reply";
           String mess = "You Application for "+b.getPosition_name()+" job han been submitted. Please visit our website for more updates!";
           EmailUtility.sendEmail(toAddress, subject, mess);

           String messsage = "Succesfully Apllied!";
           session.setAttribute("message", messsage);
           response.sendRedirect(request.getContextPath()+"/jsp/home_candidate.jsp");
   }  
   
   
%>
