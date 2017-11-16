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

    String userid = (String) session.getAttribute("hr_id");
    String name = null;
    if (userid == null) {
        request.getRequestDispatcher("/jsp/employee_login.jsp").forward(request, response);
    } else {
        crs_dbms cd = new crs_dbms();
        ResultSet rs = cd.fethchDetails(userid);
        while (rs.next()) {
            name = rs.getString("emp_name");
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
                            <li class="btn-warning active"><a href="<%=request.getContextPath()%>/jsp/home_hr.jsp">Home</a></li>
                        </ul>
                        <div class="col-md-offset-1 col-lg-6 text-center">
                        <h1 style="color: white "><strong>Corporate Recruitment System</strong></h1>
                    </div>
                        <ul class="nav navbar-nav navbar-right">
                            
                            <li class="dropdown">
                                <a class="btn-warning dropdown-toggle" data-toggle="dropdown" href="#">HR - <%= name%> <span class="caret"></span></a>
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
                            <li><a rel="panel2" role="tab" class="btn btn-info btn-block" data-toggle="tab">Posted Advertisement</a></li>
                            <li><a rel="panel1" role="tab" class="btn btn-info btn-block" data-toggle="tab">Indentors Request List</a></li>
                            <li><a rel="panel3" role="tab" class="btn btn-info btn-block" data-toggle="tab">Candidate List</a></li>
                            <!--li><a rel="panel4" role="tab" class="btn btn-info btn-block" data-toggle="tab">Status</a></li-->
                            <li><button role="tab" class="btn btn-info btn-block" type="button" data-toggle="modal" data-target="#myModal">Post Advertisement</button></li>
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
                                                <th>Required Post</th>
                                                <th>Existing Employee</th>
                                                <th>Salary</th>
                                                <th>Skill Set</th>
                                                <th>HR Approval</th>
                                                <th>Finance Approval</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                try {
                                                    request_deo deo = new request_deo();
                                                    List list = deo.showRequests();
                                                    Iterator it = list.iterator();
                                                    request_bean r = new request_bean();
                                                    while (it.hasNext()) {
                                                        r = (request_bean) it.next();
                                            %>
                                            <tr>
                                                <td><a class="btn btn-info" href="request_details.jsp?req_id=<%= r.getReq_id()%>"><span class="badge"><%= r.getReq_id()%></span></a></td>
                                                <td><%= r.getProject_name()%></td>
                                                <td><%= r.getRequired_post()%></td>
                                                <td><%= r.getExisting_emp()%></td>
                                                <td><%= r.getSalary()%></td>
                                                <td><%= r.getSkillset()%></td>
                                                <td id="status_hr"><%= r.getStatus_hr()%></td>
                                                <td id="status_fi"><%= r.getStatus_finance()%></td>
                                            </tr>
                                            <%  }
                                                } catch (Exception e) {
                                                    out.print(e);
                                                }
                                            %>


                                        </tbody>
                                    </table>

                                </div>
                            </div>
                            <!--////panel2////// --><div class="tab-pane" id="panel2">

                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <caption><h1><strong> Posted Advertisement</strong></h1></caption>
                                        <thead>
                                            <tr>
                                                <th>Request ID</th>
                                                <th>Start Date</th>
                                                <th>End Date</th>
                                                <th>Admit Card Date</th>
                                                <th>Application Fee</th>
                                                <th>Female Exemption</th>
                                                <th>SC/ST Exemption</th>
                                                <th>PH Exemption</th>
                                                <th>Salary</th>                                         
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                request_deo deo = new request_deo();
                                                try {

                                                    Iterator it = deo.showAdvertise().iterator();
                                                    advertise_bean r = new advertise_bean();
                                                    while (it.hasNext()) {
                                                        r = (advertise_bean) it.next();
                                            %>
                                            <tr>
                                                <td><%= r.getReq_id()%></td>
                                                <td><%= r.getStart_date()%></td>
                                                <td><%= r.getEnd_date()%></td>
                                                <td><%= r.getAdmit_card_date()%></td>
                                                <td><%= r.getApp_fee()%></td>
                                                <td><%= r.getFemale_exemption()%></td>
                                                <td><%= r.getSc_exemption()%></td>
                                                <td><%= r.getPh_exemption()%></td>
                                                <td><%= r.getSalary_scale()%></td>                                  
                                            </tr>
                                            <%  }
                                                } catch (Exception e) {
                                                    out.print(e);
                                                }
                                            %>  
                                        </tbody>
                                    </table>
                                </div>                



                            </div>

                            <!--////Panel3-->  <div class="tab-pane" id="panel3">

                                <div class="table-responsive">
                                    <table class="table table-striped" id="myTable">
                                        <caption><h1><strong>Candidate List</strong></h1></caption>
                                        <div class="form-group col-sm-2">
                                            <label class="label-control">Filter by 12th % Throughout</label>
                                            <input type="text" id="myInput" class="form-control" onkeyup="myFunction()" placeholder="Search. . ." />
                                        </div>
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th>Gender</th>
                                                <th>10th %</th>
                                                <th>12th %</th> 
                                                <th>Highest Education</th>
                                                <th>Specialization</th>
                                                <th>Graduation %</th>
                                                <th>Passing Year</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                try {
                                                    crs_dbms cd = new crs_dbms();
                                                    ResultSet rs = cd.fetchAllCandidateData();
                                                    while (rs.next()) {
                                            %>
                                            <tr>
                                                <td><%= rs.getString("name")%></td>
                                                <td><%= rs.getString("candidate_id")%></td>
                                                <td><%= rs.getString("gender")%></td>
                                                <td><%= rs.getString("ssc_percentage")%></td>
                                                <td><%= rs.getString("hsc_percentage")%></td>
                                                <td><%= rs.getString("highest_qualification")%></td>
                                                <td><%= rs.getString("specialization")%></td>
                                                <td><%= rs.getString("gmarks")%></td>
                                                <td><%= rs.getString("gpassing_year")%></td>
                                            </tr>
                                            <%  }
                                                } catch (Exception e) {
                                                    out.print(e);
                                                }
                                            %>  
                                        </tbody>
                                    </table>
                                </div>                



                            </div>                                     

                            <!--panel4--->         <div class="tab-pane" id="panel4">
                                Status     
                            </div>

                            <!--panel6--->         <div class="tab-pane" id="panel6">

                            </div>

                            <!--panel7--->         <div class="tab-pane" id="panel7">

                            </div>



                            <!--////panel10////////---><div class="tab-pane" id="panel10"><iframe class="myFrame" width="100%" height="100%" frameborder="0" ></iframe></div>   

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
                            <h4 class="modal-title"><b>Advertisement</b></h4>
                        </div>
                        <div class="modal-body">
                            <form class="form-horizontal" method="get" name="myform" action="<%= request.getContextPath()%>/jsp/jsp_servlet/post_advertise.jsp">

                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="req_id">Indentor Request Id :</label>
                                    <div class="col-sm-6">
                                        <select class="form-control" id="req_id" name="req_id">
                                            <% Iterator tt= deo.showRequests().iterator();
                                             request_bean b2= new request_bean();
                                            while(tt.hasNext())
                                            {
                                              b2=(request_bean)tt.next();
                                            
                                            %>
                                            <option value="<%= b2.getReq_id() %>"><%= b2.getReq_id() %></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                            <label class="control-label col-sm-4" for="start_date">Start Date :</label>
                          <div class="col-sm-6">
                              <input type="date" class="form-control" id="start_date" name="start_date" ng-model="start_date" required="true"/>
                              <span style="color: red" ng-show="myform.start_date.$touched && myform.start_date.$invalid" >Start Date Is Required.</span>                      
                          </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4" for="end_date">End Date :</label>
                          <div class="col-sm-6">
                              <input type="date" class="form-control" id="end_date" name="end_date" ng-model="end_date" required="true"/>  
                              <span style="color:red" ng-show="myform.end_date.$touched && myform.end_date.$invalid" >End Date Is Required</span>
                            
                          </div>
                            
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-4" for="admit_card_date">Admit Card Date :</label>
                          <div class="col-sm-6">
                              <input type="date" class="form-control" id="admit_card_date" name="admit_card_date" ng-model="admit_card_date" required="true"/>
                              <span style="color: red" ng-show="myform.admit_card_date.$touched && myform.admit_card_date.$invalid" >Admit Card Date Is Required.</span>
                          </div>
                        </div>
                        
                    <div class="form-group">
                          <label class="control-label col-sm-4" for="salary_scale">Salary Scale :</label>
                          <div class="col-sm-6">          
                              <input type="text" class="form-control" id="salary_scale" pattern="[0-9]+"   name="salary_scale" ng-model="salary_scale" required="true"/>
                              <span style="color:red" ng-show="myform.salary_scale.$touched && myform.salary_scale.$invalid">Invalid Salary Scale</span>
                             
                          </div>
                        </div>
                    <div class="form-group">
                          <label class="control-label col-sm-4" for="app_fee">Application Fee :</label>
                          <div class="col-sm-6">          
                              <input type="text" class="form-control" id="app_fee" pattern="[0-9]+" value="2000"  name="app_fee" ng-model="app_fee" required="true"/>
                              <span style="color:red" ng-show="myform.app_fee.$touched && myform.app_fee.$invalid" >Invalid Application Fees.</span>
                          </div>
                        </div>
                    
                     <div class="form-group">
                          <label class="control-label col-sm-4" for="app_female_fee"> Fee Exempted For Female :</label>
                          <div class="col-sm-6">          
                              <input type="text" class="form-control" id="app_female_fee"  pattern="[0-9]+"value="1000"  name="app_female_fee" ng-model="app_female_fee" required/>
                              <span style="color:red" ng-show="myform.app_female_fee.$touched && myform.app_female_fee.$invalid" >Invalid Application Fee.</span>
                          </div>
                        </div>
              
                     <div class="form-group">
                          <label class="control-label col-sm-4" for="app_sc_fee"> Fee Exempted For SC/ST :</label>
                          <div class="col-sm-6">          
                              <input type="text" class="form-control" id="app_sc_fee" pattern="[0-9]+" value="800" name="app_sc_fee" ng-model="app_sc_fee" required/>
                              <span style="color:red" ng-show="myform.app_sc_fee.$touched && myform.app_sc_fee.$invalid">Invalid Application Fee</span>
                               
                              
                          </div>
                        </div>
                     
                        <div class="form-group">
                          <label class="control-label col-sm-4" for="app_ph_fee"> Fee Exempted For PH :</label>
                          <div class="col-sm-6">          
                              <input type="text" class="form-control" id="app_ph_fee" pattern="[0-9]+" value="800" name="app_ph_fee" ng-model="app_ph_fee" required="true"/>
                              <span style="color:red" ng-show="myform.app_ph_fee.$touched && myform.app_ph_fee.$invalid">Application Fees For Physically Handicap Is Required</span>
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
                                                var x = '<%= request.getAttribute("message")%>';
                                                if (x != 'null') {
                                                    alert(x);
                                                    
                                                }
                                                

        </script>

        <script><!--For Filtering tablel data            -->
    function myFunction() {
        var input, filter, table, tr, td,i;
        input = document.getElementById("myInput");
        filter = input.value;
        table = document.getElementById("myTable");
        tr = table.getElementsByTagName("tr");
        for (i=0; i < tr.length; i++)
          {
            td1 = tr[i].getElementsByTagName("td")[4];
            td2 = tr[i].getElementsByTagName("td")[3];
            if (td1 && td2)
              {
                if (td1.innerHTML >= filter && td2.innerHTML >= filter)
                {
                    tr[i].style.display ="";
                } 
               else
                {
                tr[i].style.display = "none";
                }
              }
           }
         }
</script>
            <script>
                var stat1 = document.getElementById("status_hr").innerText;
                var stat2 = document.getElementById("status_fi").innerText;
                if (stat1 === 'Pending')
                    document.getElementById("status_hr").style.color = "blue";
                else if (stat1 === 'Rejected')
                    document.getElementById("status_hr").style.color = "red";
                else
                    document.getElementById("status_hr").style.color = "light-green";

                if (stat2 === 'Pending')
                    document.getElementById("status_fi").style.color = "blue";
                else if (stat2 === 'Rejected')
                    document.getElementById("status_fi").style.color = "red";
                else
                    document.getElementById("status_fi").style.color = "green";

                </script>
    </body>
</html>
