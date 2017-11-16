<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Login</title>
        <link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet"/>
        <link rel="shortcut icon" href="<%= request.getContextPath()%>/image/title-icon.ico"/>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template-container.css"/>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/emp-login.css"/>
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
                <img class="img-responsive" src="<%= request.getContextPath()%>/image/emp-login-image.jpg" alt="Employee Login"/>
                <div class="card card-container">
           
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin" method="post" action="<%= request.getContextPath() %>/jsp/jsp_servlet/emp_login.jsp">
                <h1 id="emp-title">Employee Login</h1> 
                <span id="reauth-email" class="reauth-email"></span>
                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span><input type="text" id="inputEmail" name="emp_id" class="form-control" placeholder="Employee Id" autofocus required/>
                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span><input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required/>
                <a class="forgot-password" data-toggle="modal" data-target="#fpModal" style="float:right; margin-bottom: 15px;">Forgot the password?</a>
                
                <button class="btn btn-lg btn-info btn-block btn-signin" type="submit">Login</button>
                <span style="color:red"><% String err=(String)request.getAttribute("error"); if(err!=null){out.print("*"+err);}%></span>
            </form>
          
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
          <form class="form-horizontal" action="<%=request.getContextPath()%>/jsp/forgot_password_employee.jsp">
                        <div class="form-group">
                          <label class="control-label col-sm-5" for="email">Email:</label>
                          <div class="col-sm-6">          
                            <input type="text" class="form-control" id="email" placeholder="Employee ID" name="email">
                          </div>
                        </div>
                        
                      <div class="form-group">
                          <label class="control-label col-sm-5" for="location">Which is your Favorite Place?</label>
                          <div class="col-sm-6">          
                            <input type="text" class="form-control" id="place" placeholder="Answer" name="place">
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
       
    
    
        </div>

          <script>
                                                var x = '<%= session.getAttribute("message")%>';
                                                if (x != 'null') {
                                                    alert(x);
                                                <% session.removeAttribute("message"); %>
                                                }
                                                

          </script>
                        
                        
    </body>
</html>
