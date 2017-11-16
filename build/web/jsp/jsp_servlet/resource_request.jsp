
<%@page import="crs_hibernate.EmailUtility"%>
<%@page import="crs_hibernate.request_deo"%>
<%@page import="crs_hibernate.request_bean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
        request_deo deo = new request_deo();
        String emp_id=(String)session.getAttribute("in_id");
        request_bean rr= new request_bean();
        rr.setProject_code(Integer.parseInt(request.getParameter("project_code")));
        rr.setProject_name(request.getParameter("project_name"));
        rr.setPosition_name(request.getParameter("position_name"));
        rr.setExisting_emp(Integer.parseInt(request.getParameter("existing_emp")));
        rr.setExperience(Integer.parseInt(request.getParameter("experience")));
        rr.setJob_desc(request.getParameter("job_desc"));
        rr.setPosition_duration(Integer.parseInt(request.getParameter("position_duration")));
        rr.setPosition_id(Integer.parseInt(request.getParameter("position_code")));
        rr.setQualification(request.getParameter("qualification"));
        rr.setRequired_post(Integer.parseInt(request.getParameter("required_post")));
        rr.setSkillset( request.getParameter("skillset"));
        rr.setStream(request.getParameter("stream"));
        rr.setSalary(Long.parseLong(request.getParameter("salary")));
        rr.setEmp_id(emp_id);
                
                   deo.submitRequest(rr);
                   
                String toAddress=rr.getEmp_id();
                String subject="Corporate Recruitment System-No-Reply";
                String mess="Your Request of Resource for "+rr.getProject_name()+" has been posted. You can check the status of your request in Resource Request List Panel Thank you! ";
                EmailUtility.sendEmail(toAddress, subject, mess);
                   
                   request.setAttribute("message", "Your Request has been Submitted!");
                   request.getRequestDispatcher("/jsp/home_indentor.jsp").forward(request, response);
                                %>
