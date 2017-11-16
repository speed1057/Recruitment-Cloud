<%@page import="crs_hibernate.advertise_bean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="crs_jdbc.crs_dbms"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="crs_hibernate.request_deo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="crs_hibernate.request_bean"
        import="crs_hibernate.request_deo"%>
<%
    
    String userid=(String)session.getAttribute("hr_id");
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
                          <li class="btn-warning active"><a href="<%=request.getContextPath()%>/jsp/home_hr.jsp">Home</a></li>
                      </ul>
                 <div class="col-md-offset-1 col-lg-6 text-center">
                        <h1 style="color: white "><strong>Corporate Recruitment System</strong></h1>
                    </div>
                      <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                          <a class="btn-warning dropdown-toggle" data-toggle="dropdown" href="#"><%= name%> <span class="caret"></span></a>
                          <ul class="dropdown-menu">          
                              <!--li><a href="#"><span class="glyphicon glyphicon-user"></span>  Profile</a></li-->
                              <li><a href="<%=request.getContextPath()%>/jsp/hr_logout.jsp"><span class="glyphicon glyphicon-log-in"></span> LogOut</a></li>
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
                            <li><a href="home_hr.jsp" class="btn btn-info btn-block" >Go Back</a></li>
                            
                        </ul>
                    </div>
                    
                    
                      <% 
                      
                          
                          String id= request.getParameter("req_id");
                           request_bean r=null;
                          int iid=Integer.parseInt(id);
                                   try{
                                    request_deo deo = new request_deo();
                                    List list= deo.showIndentorReqDetails(iid);
                                    Iterator it= list.iterator();
                                   
                                    while(it.hasNext())
                                    { 
                                        r=(request_bean)it.next();
                                    }
                                    
                                    }catch(Exception e){out.print(e);}
                                   %>
                    
                    <div class="col-lg-10">
                        <div class="tab-content">
     <!--////panel1//////////-->     <div class="tab-pane active" id="panel1">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <caption><h1><strong>Indentor Request Details</strong></h1></caption>
                                   
                                        <tr><td>Request ID :</td><td><%= r.getReq_id() %></td></tr>
                                        <tr><td>Project Name :</td><td><%= r.getProject_name() %></td></tr>
                                        <tr><td>Position Name :</td><td><%= r.getPosition_name() %></td></tr>
                                         <tr><td>Experience :</td><td><%= r.getExperience() %></td></tr>
                                          <tr><td>Job Description :</td><td><%= r.getJob_desc() %></td></tr>
                                           <tr><td>Required Post :</td><td><%= r.getRequired_post() %></td></tr>
                                            <tr><td>Post Duration :</td><td><%= r.getPosition_duration() %></td></tr>
                                             <tr><td>Existing Employee :</td><td><%= r.getExisting_emp() %></td></tr>
                                              <tr><td>Salary :</td><td><%= r.getSalary() %></td></tr>
                                              <tr><td>Qualification :</td><td><%= r.getQualification() %></td></tr>
                                              <tr><td>Stream :</td><td><%= r.getStream() %></td></tr>
                                              <tr><td>Skill Set :</td><td><%= r.getSkillset() %></td></tr>
                                               
                                              <tr><td align="right"><a href="jsp_servlet/validate_request.jsp?status=yes&id=<%= r.getReq_id() %>" class="btn btn-info" >Approve</a></td><td><a href="jsp_servlet/validate_request.jsp?status=no&id=<%= r.getReq_id() %>" class="btn btn-danger" >Reject</a></td></tr>
                                        
                                      
                                                                    
                                      </tbody>
                                </table>
                                  
                                </div>
                            </div>
  <!--////panel2////// --><div class="tab-pane" id="panel2">
                                          
                                          
                             </div>
                                      
                            
                            
         
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><b>Advertisement</b></h4>
        </div>
        <div class="modal-body">
            <form class="form-horizontal" method="post" action="<%= request.getContextPath()%>/jsp/jsp_servlet/post_advertise.jsp">
                        
                        <div class="form-group">
                            <label class="control-label col-sm-4" for="req_id">Indentor Request Id :</label>
                          <div class="col-sm-6">
                              <input type="number" class="form-control" id="req_id" name="req_id">
                          </div>
                        </div>
                
                        <div class="form-group">
                            <label class="control-label col-sm-4" for="start_date">Start Date :</label>
                          <div class="col-sm-6">
                              <input type="date" class="form-control" id="start_date" name="start_date">
                          </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4" for="end_date">End Date :</label>
                          <div class="col-sm-6">
                              <input type="date" class="form-control" id="end_date" name="end_date">
                          </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4" for="admit_card_date">Admit Card Date :</label>
                          <div class="col-sm-6">
                              <input type="date" class="form-control" id="admit_card_date" name="admit_card_date"/>
                          </div>
                        </div>
                        
                    <div class="form-group">
                          <label class="control-label col-sm-4" for="salary_scale">Salary Scale :</label>
                          <div class="col-sm-6">          
                            <input type="number" class="form-control" id="salary_scale"  name="salary_scale"/>
                          </div>
                        </div>
                    <div class="form-group">
                          <label class="control-label col-sm-4" for="app_fee">Application Fee :</label>
                          <div class="col-sm-6">          
                            <input type="number" class="form-control" id="app_fee" value="2000"  name="app_fee"/>
                          </div>
                        </div>
                    
                     <div class="form-group">
                          <label class="control-label col-sm-4" for="app_female_fee"> Fee Exempted For Female :</label>
                          <div class="col-sm-6">          
                              <input type="number" class="form-control" id="app_female_fee" value="1000"  name="app_female_fee"/>
                          </div>
                        </div>
              
                     <div class="form-group">
                          <label class="control-label col-sm-4" for="app_sc_fee"> Fee Exempted For SC/ST :</label>
                          <div class="col-sm-6">          
                            <input type="number" class="form-control" id="app_sc_fee" value="800" name="app_sc_fee"/>
                          </div>
                        </div>
                     
                        <div class="form-group">
                          <label class="control-label col-sm-4" for="app_ph_fee"> Fee Exempted For PH :</label>
                          <div class="col-sm-6">          
                            <input type="number" class="form-control" id="app_ph_fee" value="800" name="app_ph_fee"/>
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
            <script src="<%=request.getContextPath()%>/js/dashboard.js"></script>
    </body>
</html>
