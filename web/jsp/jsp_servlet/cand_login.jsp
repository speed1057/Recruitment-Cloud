<%@page import="crs_hibernate.candidate_basic_bean"%>
<%@page import="crs_hibernate.request_deo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
String userid=request.getParameter("userid");
    String pass=request.getParameter("password");
    
    request_deo deo= new request_deo();
    candidate_basic_bean b= new candidate_basic_bean();
    
    if((deo.candidateLoginValidation(userid, pass)).equals("True"))
    {
        session.setAttribute("cand_id", userid);
        response.sendRedirect(request.getContextPath()+"/jsp/home_candidate.jsp");
    }
    else
    {
            request.setAttribute("error", "Enter a Valid Email or Password!");
            request.getRequestDispatcher("/jsp/candidate_login.jsp").forward(request, response);
    }

%>
