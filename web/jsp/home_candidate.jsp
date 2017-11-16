<%@page import="java.sql.ResultSet"%>
<%@page import="crs_jdbc.crs_dbms"%>
<%@page import="crs_hibernate.request_deo"%>
<%@page import="crs_hibernate.candidate_register_bean"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="crs_hibernate.candidate_basic_bean"%>
<%
    String id = (String) session.getAttribute("cand_id");
    candidate_basic_bean b = null;
    if (id == null) {
        request.getRequestDispatcher("/jsp/candidate_login.jsp").forward(request, response);
    } 
    else
    {
        request_deo deo = new request_deo();
        b = deo.fetchCandidateBasicDetails(id);
       
        if(b.getCandidate_id()==null)
        {
            response.sendRedirect(request.getContextPath()+"/jsp/candidate_complete_registration.jsp");
        }  
}
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Candidate Home</title>
        <link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet"/>
        <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
        <link rel="shortcut icon" href="<%= request.getContextPath()%>/image/title-icon.ico"/>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template-container.css"/>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/home_emp.css"/>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/home_cand.css"/>
        <script src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/dashboard.js"></script>
        <script src="<%=request.getContextPath()%>/js/home_cand.js"></script>



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
                            <li class="btn-warning active"><a href="<%=request.getContextPath()%>/jsp/home_candidate.jsp">Home</a></li>
                        </ul>
                 <div class="col-md-offset-1 col-lg-6 text-center">
                        <h1 style="color: white "><strong>Corporate Recruitment System</strong></h1>
                    </div>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a class="btn-warning dropdown-toggle" data-toggle="dropdown" href="#"><%= b.getName()%> <span class="caret"></span></a>
                                <ul class="dropdown-menu">          
                                    <li><a href="<%=request.getContextPath()%>/jsp/candidate_profile.jsp"><span class="glyphicon glyphicon-user"></span>  Profile</a></li>
                                    <li><a href="<%=request.getContextPath()%>/jsp/candidate_logout.jsp"><span class="glyphicon glyphicon-log-in"></span> LogOut</a></li>
                                </ul>
                            </li>   
                        </ul>
                    </div>
                </nav>
            </div>

            <!--wrapper content------------------------------------------------>

                                <%
                                    crs_dbms c = new crs_dbms();
                                    ResultSet rs = c.fetchAdvertiseData();
                                    ResultSet count = c.countAdvertise();
                                    int cc = 0;
                                                        while (count.next()) {
                                                            cc = count.getInt("cc");
                                                        }
                                %>
            <div class="wrapper-content">

                <div class="row">
                    <div class="col-md-2">
                        <ul class="nav nav-stacked" role="tablist">
                            <li><a rel="panel1" role="tab" class="btn btn-info btn-block active" data-toggle="tab">Job Portal   <span class="badge"><%=cc%></span></a></li>
                            <li><a rel="panel2" role="tab" class="btn btn-info btn-block" data-toggle="tab">Job Applied</a></li>
                        </ul>
                    </div>

                    <div class="col-lg-10">

                        <div class="tab-content">

                            <!-----panel1------->     <div class="tab-pane active" id="panel1">







                                <div class="row">
                                    <div class='col-md-offset-2 col-md-8 text-center'>
                                        <h2>JOBS</h2>
                                    </div>
                                </div>
                                <div class='row'>
                                    <div class='col-md-offset-2 col-md-8'>
                                        <div class="carousel slide" data-ride="carousel" id="quote-carousel">
                                            <!-- Bottom Carousel Indicators -->
                                            <ol class="carousel-indicators">
                                                <li data-target="#quote-carousel" data-slide-to="0" class="active"></li>
                                                    <% 
                                                        for (int i = 1; i <= cc; i++) {%>
                                                <li data-target="#quote-carousel" data-slide-to="<%= i%>"></li>
                                                    <%} %>
                                            </ol>

                                            <!-- Carousel Slides / Quotes -->
                                            <div class="carousel-inner">

                                                <!-- Quote 1 -->
                                                <div class="item active">

                                                    <div class="row">

                                                        <div class="col-sm-offset-1 col-sm-10 text-center">
                                                            <p>
                                                            <h2> Apply For the Job Best Fitted to You!!..</h2>
                                                            </p>

                                                        </div>
                                                    </div>

                                                </div>

                                                <!-- Quote 2 -->
                                                <% while (rs.next()) {%>
                                                <div class="item">
                                                    <div class="row">
                                                        <div class="col-sm-3 text-center">
                                                            Job @ Cdac
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <p>
                                                            <ul>
                                                                <li><h5><b>Job Profile-<%= rs.getString("position_name")%></b></h5></li>
                                                                <li><h5><b>Minimum Qualification-<%= rs.getString("qualification")%></b></h5></li>
                                                                <li><h5><b>Salary-<%= rs.getString("salary")%></b></h5></li>
                                                                <li><h5><b>Last Date to apply-<span style="color:red"><%= rs.getString("end_date")%></span></b></h5></li>
                                                            </ul>
                                                            <a href="advertise_details.jsp?req_id=<%= rs.getInt("req_id")%>" class="btn btn-default">Apply Now</a>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>

                                                <% }%>
                                            </div>
                                            <!-- Carousel Buttons Next/Prev -->
                                            <a data-slide="prev" href="#quote-carousel" class="left carousel-control"><i class="fa fa-chevron-left"></i></a>
                                            <a data-slide="next" href="#quote-carousel" class="right carousel-control"><i class="fa fa-chevron-right"></i></a>
                                        </div>                          
                                    </div>
                                </div>



                            </div><!------panel 1 end--------->
                            <!-----panel2------->       <div class="tab-pane" id="panel2">
                            
                            <div class="table-responsive">
                                    <table class="table table-striped">
                                        <caption><h1><strong>Job Applied</strong></h1></caption>
                                        <thead>
                                        <tr>
                                          <th>Start Date</th>
                                          <th>Job Profile</th>
                                          <th>End Date</th>
                                          <th>Admit Card Date</th>
                                          <th>Salary</th>
                                        </tr>
                                      </thead>
                                      <tbody>
                            <%
                                crs_dbms db= new crs_dbms();
                               ResultSet sh= db.showAppliedJobByCandidate(b.getCandidate_id());
                              while(sh.next())
                                      {
                            %>
                                      <tr>
                                          <td><%= sh.getString("start_date") %></td>
                                          <td><%= sh.getString("position_name") %></td>
                                          <td><%= sh.getString("end_date") %></td>
                                          <td><%= sh.getString("admit_card_date")%></td>
                                          <td><%= sh.getString("salary") %></td>                                  
                                      </tr>
                                  <%  }
                                  
                                    %>  
                                      </tbody>
                                </table>
                                </div>   
                            
                            
                            
                            
                            </div><!------panel2----------->
                            <div class="tab-pane" id="panel3">yoooooo </div>               
                        </div>
                    </div>
                </div>
            </div>  <!------wrapper content-------------->






        </div><!--master Container-->

        <script>
            var x = '<%= (String)session.getAttribute("message")%>';
            if (x != 'null') {
                alert(x);
            <% session.removeAttribute("message"); %>
            }
        </script>                         

    </body>
</html>
