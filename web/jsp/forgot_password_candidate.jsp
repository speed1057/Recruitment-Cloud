<%-- 
    Document   : forgot_password
    Created on : 21 Jul, 2017, 12:13:46 AM
    Author     : gohan
--%>

<%@page import="crs_hibernate.request_deo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet"/>
  <link rel="shortcut icon" href="<%= request.getContextPath()%>/image/title-icon.ico"/>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template-container.css"/>
        <script src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
</head>
<body>
 <%
       String id= request.getParameter("email");
       String answer= request.getParameter("place");
       
       request_deo deo= new request_deo();
       if(!deo.isvalidCandidateandAnswer(id, answer))
       {
           session.setAttribute("message", "Invalid Credentials! Please enter the correct Credentials!");
           response.sendRedirect(request.getContextPath()+"/jsp/candidate_login.jsp");
       }
       session.setAttribute("cand_id", id);
   
   %>
<div class="master-container">
    
    <!--Menu bar------------------------------------------------------------------------>
            
                  <div class="menu-bar">
                   <nav>
                      <div class="navbar-header">
                        <a class="navbar-brand btn-warning" href="<%=request.getContextPath()%>/index.html">CR <i><b>System</b></i></a>
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                      <ul class="nav navbar-nav">
                          <li class="btn-warning active"><a href="<%=request.getContextPath()%>/jsp/home_candidate.jsp">Home</a></li>
                      </ul>
                       <div class="col-md-offset-1 col-lg-6 text-center">
                        <h1 style="color: white "><strong>Corporate Recruitment System</strong></h1>
                    </div>
                      <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a class="btn-warning" href="<%=request.getContextPath()%>/jsp/candidate_login.jsp">LogIn</a>
                        </li>   
                      </ul>
                    </div>
                 </nav>
                  </div>
               
            <!--wrapper content------------------------------------------------>
           
    <div class="wrapper-content">
                <div class="panel panel-info" style="width:50%; height: 60%; margin: 10% 25%;">
                    <div class="panel-heading">
                        <div class="panel-title">Update Password</div>
                    </div>                     
                    <div class="panel-body">
                        <form id="signupform" class="form-horizontal" role="form" onsubmit="return validate()" action="jsp_servlet/change_cand_password.jsp">                     
                            <div class="form-group">
                                <label for="email" class=" control-label col-sm-5">New password</label>
                                <div class="col-sm-4">
                                    <input type="password" id="password" class="form-control" name="password" placeholder="Password" required />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email" class=" control-label col-sm-5">Confirm password</label>
                                <div class="col-sm-4">
                                    <input type="password" id="confirm_password" class="form-control" name="confirm_password" placeholder="Confirm Password" required />
                                </div>
                            </div>
                            <span style="color:red;" id="message"></span>
                            <div class="form-group">
                                <!-- Button -->                                 
                                <div class="  col-sm-offset-4 col-sm-9">
                                    <button id="btn-signup" type="submit" class="btn btn-info col-lg-2">Submit</button>
				<button id="btn-reset" type="reset" class="btn btn-default col-lg-offset-1 col-lg-2 ">Reset</button>
                                </div>
                            </div>                             
                      </form>
                     </div>
                     </div>
                </div>             
           </div>
                        <script>
                            function validate()
                            {
                                    var pass1=document.getElementById("password").value;
                                    var pass2=document.getElementById("confirm_password").value;
                                    if(pass1===pass2)
                                    {
                                        return true;
                                    }
                                    else
                                    {
                                        document.getElementById("message").innerHTML="*Password Mismatch! Please Enter the Correct Password!";
                                        return false;
                                    }       
                            }
                        </script>
</body>
</html>
