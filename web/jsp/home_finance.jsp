<%@page import="crs_hibernate.request_bean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="crs_hibernate.request_deo"%>
<%@page import="crs_hibernate.request_deo"%>
<%@page import="crs_hibernate.request_deo"%>
<%@page import="crs_hibernate.request_deo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="crs_jdbc.crs_dbms"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
    String userid=(String)session.getAttribute("fi_id");
    String name=null;
    if(userid==null)
        request.getRequestDispatcher("/jsp/employee_login.jsp").forward(request, response);
    else
    {
        crs_dbms cd= new crs_dbms();
       ResultSet rs = cd.fethchDetails(userid);
       while(rs.next())
       {
        name=rs.getString("emp_name");
       }
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Indenter Request Form</title>
        <link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet"/>
        <link rel="shortcut icon" href="<%= request.getContextPath()%>/image/title-icon.ico"/>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/bootstrap.css"/>
         <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template-container.css"/>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/home_emp.css"/>
        <script src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
        
    </head>
    <body>
        <div class="master-container">
            <!--div class="header"></div--> 
            <!--Menu bar------------------------------------------------------------------------>
            
                  <div class="menu-bar">
                   <nav>
                      <div class="navbar-header">
                        <a class="navbar-brand btn-info" href="<%=request.getContextPath()%>/index.html">CR <i><b>System</b></i></a>
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                      <ul class="nav navbar-nav">
                          <li class="btn-warning active"><a href="<%=request.getContextPath()%>/jsp/home_finance.jsp">Home</a></li>
                      </ul>
                       <div class="col-md-offset-1 col-lg-6 text-center">
                        <h1 style="color: white "><strong>Corporate Recruitment System</strong></h1>
                    </div>
                      <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                          <a class="btn-warning dropdown-toggle" data-toggle="dropdown" href="#">Finance - <%=name%> <span class="caret"></span></a>
                          <ul class="dropdown-menu">          
                             <!--li><a href="#"><span class="glyphicon glyphicon-user"></span>  Profile</a></li-->
                              <li><a href="<%=request.getContextPath()%>/jsp/finance_logout.jsp"><span class="glyphicon glyphicon-log-in"></span> LogOut</a></li>
                          </ul>
                        </li>   
                      </ul>
                    </div>
                 </nav>
                  </div>
               
            <!--wrapper content------------------------------------------------>
           	
            <div class="wrapper-content">
                
                <div class="row">
                    <div class="col-md-2">
                        <ul class="nav nav-stacked" role="tablist">
                            <li><a rel="panel1" role="tab" class="btn btn-info btn-block active" data-toggle="tab">Budget</a></li>
                            <li><a rel="panel2" role="tab" class="btn btn-info btn-block" data-toggle="tab">Indentor Request List</a></li>                           
                        </ul>
                    </div>
                    <div class="col-lg-10">
                        <div class="tab-content">
                            
                            
     <!---panel 1--->         <div class="tab-pane active" id="panel1">
                                       Budget
                                   </div>   
                            
                            
                            
                            
<!--////panel2//////////-->     <div class="tab-pane" id="panel2">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <caption><h1><strong> Indentor Request</strong></h1></caption>
                                        <thead>
                                        <tr>
                                          <th>Request ID</th>
                                          <th>Project Name</th>
                                          <th>Position Name</th>
                                          <th>Experience</th>
                                          <th>Job Description</th>
                                          <th>Required Post</th>
                                          <th>Post Duration</th>
                                          <th>Existing Employee</th>
                                          <th>Salary</th>
                                          <th>Qualification</th>
                                          <th>Stream</th>
                                          <th>Skill Set</th>
                                          <th>HR Approval</th>
                                          <th>Finance Approval</th>
                                        </tr>
                                      </thead>
                                      <tbody>
                                      <% 
                                   try{
                                    request_deo deo = new request_deo();
                                    List list= deo.showRequestsToFinance();
                                    Iterator it= list.iterator();
                                    request_bean r= new request_bean();
                                    while(it.hasNext())
                                    {   r=(request_bean)it.next();
                                      %>
                                      <tr>
                                          <td><a class="btn btn-info" href="request_details_finance.jsp?req_id=<%= r.getReq_id() %>"><%= r.getReq_id() %></a></td>
                                          <td><%= r.getProject_name() %></td>
                                          <td><%= r.getPosition_name() %></td>
                                          <td><%= r.getExperience() %></td>
                                          <td><%= r.getJob_desc() %></td>
                                          <td><%= r.getRequired_post() %></td>
                                          <td><%= r.getPosition_duration() %></td>
                                          <td><%= r.getExisting_emp() %></td>
                                          <td><%= r.getSalary() %></td>
                                          <td><%= r.getQualification() %></td>
                                          <td><%= r.getStream() %></td>
                                          <td><%= r.getSkillset() %></td>
                                          <td id="status_hr"><%= r.getStatus_hr() %></td>
                                          <td id="status_fi"><%= r.getStatus_finance() %></td>
                                      </tr>
                                  <%  }
                                    }catch(Exception e){out.print(e);}
                                   %>
                                    
                                      
                                      </tbody>
                                </table>
                                  
                                </div>
                            </div>
                                   
                                   
                                  
            
                         </div>
                    </div>
                </div>
            </div>
         
                            
                            
         
                          
            
        </div>
            <script src="<%=request.getContextPath()%>/js/dashboard.js"></script>         
         
    </body>
</html>
