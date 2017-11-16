<%@page import="java.sql.ResultSet"%>
<%@page import="crs_jdbc.crs_dbms"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="crs_hibernate.request_deo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="crs_hibernate.request_bean"
        import="crs_hibernate.request_deo"%>
<%
    session.invalidate();    
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
                        <a class="navbar-brand btn-warning" href="<%=request.getContextPath()%>/index.html">CR <i><b>System</b></i></a>
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                      <ul class="nav navbar-nav">
                          <li class="btn-warning active"><a href="<%=request.getContextPath()%>/jsp/home_finance.jsp">Home</a></li>
                      </ul>
                   <div class="col-md-offset-1 col-lg-6 text-center">
                        <h1 style="color: white "><strong>Corporate Recruitment System</strong></h1>
                    </div>
                      <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a class="btn-warning" href="employee_login.jsp">Log In</a>
                        </li>   
                      </ul>
                    </div>
                 </nav>
                  </div>
               
            <!--wrapper content------------------------------------------------>
           	
     <div class="wrapper-content" style="overflow-y:hidden;">
         <center>
         <h1 style="margin-top: 15%;font-size: 400%;">You Have Been Successfully Logged Out!!</h1>
         </center> 
     </div>
      
    </div>
  </div>
  
                
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            <!--footer---------------------------------------------->           
            <!--div class="footer">   
                <h4>Copyright @ All right Reserved </h4>
            </div-->
        </div>
            <script src="<%=request.getContextPath()%>/js/dashboard.js"></script>
            
    </body>
</html>
