<%@page import="crs_hibernate.request_bean"%>
<%@page import="java.util.Iterator"%>
<%@page import="crs_hibernate.EmailUtility"%>
<%@page import="crs_hibernate.request_deo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   String res= request.getParameter("status");
   String id=request.getParameter("id");
   int iid= Integer.parseInt(id);
   
   request_deo deo= new request_deo();
     Iterator tt=  deo.showIndentorReqDetails(iid).iterator();
              request_bean be= new request_bean();
              while(tt.hasNext())
                  be=(request_bean)tt.next();
    deo.validateApprovalRequest(res, iid);
    if(res.equals("yes") || res.equals("no"))
    {
         String toAddress=be.getEmp_id();
                String subject="Corporate Recruitment System No-Reply";
                String mess="Your request has been approved by HR for the request ID " +be.getReq_id() + " !";
                EmailUtility.sendEmail(toAddress, subject, mess);
        response.sendRedirect(request.getContextPath()+"/jsp/home_hr.jsp");
    }
    if(res.equals("y") || res.equals("n"))
    {
         String toAddress=be.getEmp_id();
                String subject="Corporate Recruitment System No-Reply";
                String mess="Your request has been approved by Finance for the request ID " +be.getReq_id() + " !";
                EmailUtility.sendEmail(toAddress, subject, mess);
        response.sendRedirect(request.getContextPath()+"/jsp/home_finance.jsp");
    }

%>
