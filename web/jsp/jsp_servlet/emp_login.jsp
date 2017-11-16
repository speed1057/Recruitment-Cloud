
<%@page import="crs_jdbc.crs_dbms"%>
<%@page import="crs_hibernate.request_deo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        String userid=request.getParameter("emp_id");
        String pass=request.getParameter("password");
        
        crs_dbms cd= new crs_dbms();
        
            String rs= cd.empLoginValidation(userid, pass);
            
            System.out.println("Designation: " + rs);
            if(rs!=null && rs.equals("HR"))
            {
                session.setAttribute("hr_id", userid);
                response.sendRedirect(request.getContextPath()+"/jsp/home_hr.jsp");
            }
            else if(rs!=null && rs.equals("TL"))
            {
                session.setAttribute("in_id", userid);
                response.sendRedirect(request.getContextPath()+"/jsp/home_indentor.jsp");
            }
            else if(rs!=null && rs.equals("FINANCE"))
            {
                session.setAttribute("fi_id", userid);
                response.sendRedirect(request.getContextPath()+"/jsp/home_finance.jsp");
            }
            else
            {   
                request.setAttribute("error","Enter a Valid Email or Password!");
                request.getRequestDispatcher("/jsp/employee_login.jsp").include(request, response);
            }            
   %>
