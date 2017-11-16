<%@page import="crs_hibernate.request_bean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="crs_hibernate.request_deo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="crs_jdbc.crs_dbms"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    String userid=(String)session.getAttribute("in_id");
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
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/bootstrap.css"/>
         <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template-container.css"/>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/home_emp.css"/>
        <script src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
        
    </head>
    <body ng-app="">
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
                          <li class="btn-warning active"><a href="<%=request.getContextPath()%>/jsp/home_indentor.jsp">Home</a></li>
                      </ul>
                       <div class="col-md-offset-1 col-lg-6 text-center">
                        <h1 style="color: white "><strong>Corporate Recruitment System</strong></h1>
                    </div>
                      <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                          <a class="btn-warning dropdown-toggle" data-toggle="dropdown" href="#"><%=name%> <span class="caret"></span></a>
                          <ul class="dropdown-menu">          
                              <!--li><a href="#"><span class="glyphicon glyphicon-user"></span>  Profile</a></li-->
                              <li><a href="<%=request.getContextPath()%>/jsp/indentor_logout.jsp"><span class="glyphicon glyphicon-log-in"></span> LogOut</a></li>
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
                            <li><a rel="panel1" role="tab" class="btn btn-info btn-block active" data-toggle="tab">Resource Request List</a></li>
                            <li><button role="tab" class="btn btn-info btn-block" type="button" data-toggle="modal" data-target="#myModal">Resource</button></li>
                        </ul>
                    </div>
                    <div class="col-lg-10">
                        <div class="tab-content">
                            
                            
                            
        <!--////panel1//////////-->     <div class="tab-pane active" id="panel1">
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
                                    List list= deo.showRequests();
                                    Iterator it= list.iterator();
                                    request_bean r= new request_bean();
                                    while(it.hasNext())
                                    {   r=(request_bean)it.next();
                                      %>
                                      <tr>
                                          <td><%= r.getReq_id() %></td>
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
                            
                            <div class="tab-pane" id="panel2">Notification</div>
                            <div class="tab-pane" id="panel2"><iframe class="myFrame" width="100%" height="100%" frameborder="0" ></iframe></div>   
            
                         </div>
                    </div>
                </div>
            </div>
         
                            
                            
         
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Resource Request</h4>
        </div>
        <div class="modal-body">
            <form name="myform" class="form-horizontal" method="post" action="<%= request.getContextPath()%>/jsp/jsp_servlet/resource_request.jsp">
                        <div class="form-group">
                          <label class="control-label col-sm-4" for="project_name">Project:</label>
                          <div class="col-sm-3">          
                            <input type="text" class="form-control" id="project_code" placeholder="Code" name="project_code" pattern="[0-9]+" ng-model="project_code" required/>
                          <div style="color:red;" ng-show="myform.project_code.$touched && myform.project_code.$invalid">Enter valid code</div>
                          </div>
                          <div class="col-sm-4"> 
                              <input type="text" class="form-control" id="project_name" placeholder="Project Name" name="project_name"  pattern="[A-Za-z ]+" ng-model="project_name" required>
                              <div style="color:red" ng-show="myform.project_name.$touched && myform.project_name.$invalid">Enter valid project name</div>
                          </div>
                        </div>
                
                        <div class="form-group">
                            <label class="control-label col-sm-4" for="required_post">Required Posts:</label>
                          <div class="col-sm-7">
                            <input type="text" class="form-control" id="required_post" placeholder="Enter the Required Posts" name="required_post" pattern="[0-9]+" ng-model="required_post" required >
                          <div style="color:red" ng-show="myform.required_post.$touched && myform.required_post.$invalid">Enter valid number of required posts</div>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4" for="existing_emp">No of Existing Employees</label>
                          <div class="col-sm-7">          
                              <input type="text" class="form-control" id="existing_emp" placeholder="Enter No of Existing Employees" pattern="[0-9]+" name="existing_emp" ng-model="existing_emp" required>
                           <div style="color:red" ng-show="myform.existing_emp.$touched && myform.existing_emp.$invalid">Enter valid number </div>
                          </div>
                        </div>
                        
                        <div class="form-group">
                          <label class="control-label col-sm-4" for="position_duration">Position Duration:</label>
                          <div class="col-sm-7">          
                              <input type="text" class="form-control" id="position_duration" placeholder="Position Duration(in Months)" pattern="[0-9]+" name="position_duration" ng-model="position_duration" required>
                            <div style="color:red" ng-show="myform.position_duration.$touched && myform.position_duration.$invalid">Enter valid number </div>
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4" for="position">Position:</label>
                          <div class="col-sm-3">          
                            <input type="text" class="form-control" id="position_code" placeholder="Code" name="position_code" pattern="[0-9]+" ng-model="position_code" required>
                          <div style="color:red" ng-show="myform.position_code.$touched && myform.position_code.$invalid">Enter valid code</div>
                            
                            
                            
                          </div>
                          <div class="col-sm-4"> 
                            <input type="text" class="form-control" id="position_name" placeholder="Position Name" name="position_name" pattern="[A-Za-z. ]+" ng-model="position_name" required>

                              <div style="color:red" ng-show="myform.position_name.$touched && myform.position_name.$invalid">Enter valid position name</div>
                          </div>
                        </div>
                    <div class="form-group">
                          <label class="control-label col-sm-4" for="experience">Experience:</label>
                          <div class="col-sm-7">          
                            <input type="text" class="form-control" id="experience" placeholder="Enter Experience(In Years)" name="experience"pattern="[0-9]+" ng-model="experience" required>
                            <div style="color:red" ng-show="myform.experience.$touched && myform.experience.$invalid">Enter valid number </div>
                          </div>
                        </div>
                    
                        <div class="form-group">
                          <label class="control-label col-sm-4" for="skillset">Skillset Required:</label>
                          <div class="col-sm-7">          
                            <input type="text" class="form-control" id="skillset" placeholder="Enter Skillset" name="skillset" pattern="[A-Za-z,. ]+" ng-model="skillset" required>
                    <div style="color:red" ng-show="myform.skillset.$touched && myform.skillset.$invalid">Enter valid skills</div>
                            
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4" for="qualification">Qualifications:</label>
                          <div class="col-sm-3">          
                              <select class="form-control" id="qualification" name="qualification" value="Select" ng-model="qualification" required>
                                   
                                <option>BE/BTech</option>
                                  <option>MTech</option>
                                  <option>MCA</option>
                                  <option>BCA</option>
                                  
                              </select>
                               <div style="color:red" ng-show="myform.qualification.$touched && myform.qualification.$invalid">Select valid options </div>
                          </div>
                             <div class="col-sm-4">          
                              <select class="form-control" id="stream" name="stream" ng-model="stream"  required>
                                 
                                  <option>Electrical</option>
                                  <option>Electronics & Communication</option>
                                  <option>Computer Science</option>
                                  <option>Information Technology</option>
                                  <option>Mechanical</option>
                                  <option>Other</option>
                              </select>
                                 <div style="color:red" ng-show="myform.stream.$touched && myform.stream.$invalid">Select valid options </div>        
                          </div>
                        </div>
                        <div class="form-group">
                          <label class="control-label col-sm-4" for="job_desc">Job Description:</label>
                          <div class="col-sm-7">          
                              <input type="text" class="form-control" id="job_desc" placeholder="Enter Job Profile" name="job_desc" pattern="[A-Za-z,. ]+" ng-model="job_desc" required>
                             <div style="color:red" ng-show="myform.job_desc.$touched && myform.job_desc.$invalid">Enter valid job profile</div>
                            
                          </div>
                        </div>
                        
                        <div class="form-group">
                          <label class="control-label col-sm-4" for="salary">Salary:</label>
                          <div class="col-sm-7">          
                              <input type="number" class="form-control" id="salary" placeholder="Enter Salary" name="salary" pattern="[0-9]+" ng-model="salary" required>
                            <div style="color:red" ng-show="myform.salary.$touched && myform.salary.$invalid">Enter valid salary </div>
                          
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
                                     <script>
                                      var x='<%= request.getAttribute("message") %>';
                                      if(x!='null'){alert(x);}
                                  </script> 
    </body>
</html>
