<%@page import="crs_hibernate.request_deo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String pass= request.getParameter("password");
    String emp_id= (String)session.getAttribute("cand_id");
    
    request_deo deo= new request_deo();
    int i=deo.changeCandidatePassword(emp_id, pass);
    if(i>0)
    {
        session.setAttribute("message", "Your new password has been updated!");
    }
    else
        session.setAttribute("message", "Your password updation Failed!");
     
     response.sendRedirect(request.getContextPath()+"/jsp/candidate_login.jsp");

%>