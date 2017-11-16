<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Candidate Login</title>
        <link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet"/>
        <link rel="shortcut icon" href="<%= request.getContextPath()%>/image/title-icon.ico"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template-container.css"/>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/candidate-login.css" />
            <script src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    </head>
    <body>
     <div class="master-container">
            <div class="header">
                <div class="row">
                    <div class="col-md-offset-0 col-lg-1">
                        <a href="<%=request.getContextPath()%>/index.html"><img class="img-thumbnail" style="width:70px; height:20%; padding-bottom:0;" src="<%=request.getContextPath()%>/image/cdac.jpg" alt="cdac"/></a>
                    </div>
                    <div class="col-lg-9 text-center">
                        <h1 style="color: white; font-family:'Quicksand', sans-serif;"><strong>Corporate Recruitment System</strong></h1>
                    </div>
                </div>
            </div>            
           
            <div class="wrapper-content">   
                <div class="img-panel">
                <img id="candidate-login-panel-image" class="img-responsive" src="<%= request.getContextPath()%>/image/hiring-candidate-login-image.png" alt="candidate Login"/>
                </div>
            
            <div class="card card-container">
                  
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin" action="<%= request.getContextPath()%>/jsp/jsp_servlet/cand_login.jsp">
                <h1 id="emp-title">Candidate Login</h1> 
                <span id="reauth-email" class="reauth-email"></span>
                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span><input type=email id="inputEmail" name="userid" class="form-control" placeholder="Candidate Id" autofocus required/>
                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span><input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required/>
                <span style="color:red"><% String err=(String)request.getAttribute("error"); if(err!=null){out.print("*"+err);}%></span>
                <a class="forgot-password" data-toggle="modal" data-target="#fpModal" style="float:right; margin-bottom: 15px;">Forgot the password?</a>
               
                <button class="btn btn-lg btn-info btn-block btn-signin" type="submit">Login</button>
                
                <!--div class="row">
                <div class="col-lg-6">
                <button class="btn btn-default btn-signin" type="submit"><span class="fa fa-facebook"> Facebook </span></button>
                </div>
                <div class="col-lg-6">
                <button class="btn btn-default btn-signin" type="submit"><span class="fa fa-google"> Gmail</span></button>
                </div>
                </div-->
            </form>            
      <button type="button" class="btn btn-info btn-block btn-signin" data-toggle="modal" data-target="#myModal">Register</button>           
            
        </div><!-- /card-container -->
        </div><!-- /container -->

        
        <!--Forgot pass model Modal -->
  <div class="modal fade" id="fpModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 class="modal-title">Forgot Password</h3>
        </div>
        <div class="modal-body">
            <form class="form-horizontal" action="<%=request.getContextPath()%>/jsp/forgot_password_candidate.jsp">
                        <div class="form-group">
                          <label class="control-label col-sm-5" for="email">Email:</label>
                          <div class="col-sm-6">          
                              <input type="email" class="form-control" id="email" placeholder="Candidate ID" name="email" required />
                          </div>
                        </div>
                        
                      <div class="form-group">
                          <label class="control-label col-sm-5" for="location">Which is your Favorite Place?</label>
                          <div class="col-sm-6">          
                            <input type="text" class="form-control" id="place" placeholder="Answer" name="place" required />
                          </div>
                        </div>
                       <div class="form-group">        
                          <div class="col-sm-offset-4">
                            <button type="submit" class="btn btn-info col-sm-3">Submit</button>                
                            <button type="reset" class="btn btn-info col-sm-offset-1 col-sm-3">Reset</button>
                          </div>
                        </div>
                </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
        
        
        <!--Registration model Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 align="center" class="modal-title">Candidate Registration</h3>
        </div>
        <div class="modal-body">
            <form class="form-horizontal" method="post" onsubmit="return validate()" action="<%= request.getContextPath()%>/jsp/jsp_servlet/candidate_register.jsp">
                        <div class="form-group">
                          <label class="control-label col-sm-4" for="email">Email:</label>
                          <div class="col-sm-6">          
                            <input type="email" class="form-control" id="email" placeholder="Enter Email" name="email" required />
                          </div>
                        </div>
                        
                        <div class="form-group">
                          <label class="control-label col-sm-4" for="pwd">Password:</label>
                          <div class="col-sm-6">          
                            <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd" required />
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4" for="confirmpwd">Confirm Password:</label>
                          <div class="col-sm-6">          
                            <input type="password" class="form-control" id="confirmpwd" placeholder="Enter password" name="confirmpwd" required />
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4" for="pwd">Mobile number</label>
                          <div class="col-sm-2">          
                              <input type="text" class="form-control" id="code" placeholder="Code" value="+91" name="code" required />
                          </div>
                          <div class="col-sm-4"> 
                            <input type="text" class="form-control" id="number" placeholder="Enter Number" name="number" required />
                          </div>
                        </div>
                        
                        <div class="form-group">
                          <label class="control-label col-sm-4" for="security_que">What is your favorite Place?</label>
                          <div class="col-sm-6">          
                            <input type="text" class="form-control" id="security_que" placeholder="Answer" name="security_que" required />
                          </div>
                        </div>
                        <span style="color: red;" id="message"></span>
                        <div class="form-group">        
                          <div class="col-sm-offset-4">
                            <button type="submit" class="btn btn-info col-sm-3">Submit</button>                
                            <button type="reset" class="btn btn-info col-sm-offset-1 col-sm-3">Reset</button>
                          </div>
                        </div>
                </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
        </div>
                        <script>
                            function validate()
                            {
                            var pass1=document.getElementById("pwd").value;
                            var pass2=document.getElementById("confirmpwd").value;
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
                        
                         <script>
                                                var x = '<%= session.getAttribute("message")%>';
                                                if (x != 'null') {
                                                    alert(x);
                                                <% session.removeAttribute("message"); %>
                                                }
                                                

                        </script>
                        
    </body>
</html>
