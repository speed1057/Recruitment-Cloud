<%@page import="crs_hibernate.candidate_education_bean"%>
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
    candidate_basic_bean cb = new candidate_basic_bean();
    candidate_education_bean ce=new candidate_education_bean();
    candidate_register_bean cr= new candidate_register_bean();
    String fileName=null;
    String path=null;
    if (id == null) {
        request.getRequestDispatcher("/jsp/candidate_login.jsp").forward(request, response);
    } 
    else
    {
        
        request_deo deo = new request_deo();
        
        cb = deo.fetchCandidateBasicDetails(id);
        ce = deo.fetchCandidateEducationDetails(id);
        cr = deo.fetchCandidateRegistrationDetails(id);
        
        crs_dbms cd= new crs_dbms();
        
        fileName= cd.PhotofileName(cb.getCandidate_id());
        
        if(cb.getCandidate_id()==null)
        {
            response.sendRedirect(request.getContextPath()+"/jsp/candidate_complete_registration.jsp");
        }
        else if(cb.getCand_state()==null)
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
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
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
                            <li class="btn-warning active"><a href="<%=request.getContextPath()%>/jsp/home_candidate.jsp">Home</a></li>
                        </ul>
                 <div class="col-md-offset-1 col-lg-6 text-center">
                        <h1 style="color: white "><strong>Corporate Recruitment System</strong></h1>
                    </div>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a class="btn-warning dropdown-toggle" data-toggle="dropdown" href="#"><%= cb.getName()%> <span class="caret"></span></a>
                                <ul class="dropdown-menu">          
                                    <!--li><a href="<%=request.getContextPath()%>/jsp/candidate_profile.jsp"><span class="glyphicon glyphicon-user"></span>  Profile</a></li-->
                                    <li><a href="<%=request.getContextPath()%>/jsp/candidate_logout.jsp"><span class="glyphicon glyphicon-log-in"></span> LogOut</a></li>
                                </ul>
                            </li>   
                        </ul>
                    </div>
                </nav>
            </div>

                                
                                
<div class="wrapper-content">

                <div class="row">
                    <div class="col-md-2">
                        <ul class="nav nav-stacked" role="tablist">
                            <li><a href="home_candidate.jsp" class="btn btn-info btn-block">Go Back </a></li>
                            <!--li><a href="candidate_edit_profile.jsp" class="btn btn-info text-right">Edit Profile</a></li-->
                        </ul>
                    </div>

                    <div class="col-lg-10">

                        <div class="tab-content">

                            <!-----panel1------->     <div class="tab-pane active" id="panel1">

                                
 
                                 
  <h1 class="page-header">Candidate Profile</h1>
 
  <div class="row">
    <!-- left column -->
    <div style="margin-top:30px;" class="col-md-4">
      <div class="text-left">
        
          <img src="<%=request.getContextPath()%>/profile_pics/<%= fileName %>" class="avatar img-circle img-thumbnail" style="width:200px; height:200px; margin-left: 100px;" alt="avatar">
        </div>
    </div>

    <div class=" col-xs-1" >
        
        <div style="width:5px; height: 280px; background: grey;">
        </div>
            
    </div>
    
    <div   class="col-md-5 personal-info">

      <h2>Personal info</h2>
                
        <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>Name:</td><td><%= cb.getName() %></td>
                      </tr>
                      <tr>
                        <td>Date of Birth:</td><td><%= cb.getDob() %></td>
                      </tr>
                      <tr>
                        <td>Gender</td><td><%= cb.getGender() %></td>
                      </tr>
                        <tr>
                        <td>Phone Number</td><td><%= cr.getMobile() %></td>
                      </tr>
                      <tr>
                        <td>Marital Status:</td><td><%= cb.getMarital_status() %></td>
                      </tr>
                      
                      <tr>
                        <td>Email</td><td><%= cb.getCandidate_id() %></td>     
                      </tr>
                    </tbody>
                  </table>

    </div>
    <hr style="width:100%; height: 5px; background: grey;">
    <div class="col-sm-offset-1 col-sm-8">
    <h2>Basic Details</h2>
        <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>Father's Name:</td><td><%= cb.getFather_name() %></td>
                      </tr>
                      <tr>
                        <td>Mother's Name:</td><td><%= cb.getMother_name() %></td>
                      </tr>
                      <tr>
                        <td>Nationality:</td><td><%= cb.getNationality() %></td>
                      </tr>
                      <tr>
                        <td>Permanent Address:</td><td><%= cb.getPermanent_add() %></td>
                      </tr>
                        <tr>
                        <td>Correspondence Address:</td><td><%= cb.getCorr_add() %></td>
                      </tr>
                      <tr>
                        <td>State:</td><td><%= cb.getCand_state() %></td>     
                      </tr>
                      <tr>
                        <td>Country:</td><td><%= cb.getCountry() %></td>     
                      </tr>
                    </tbody>
                  </table>

    </div>
    
    <div class="col-sm-offset-1 col-sm-8">
        <h2>Education Details</h2>
        
        <table class="table table-user-information">
                    <tbody>
                      <tr>
                          <td>10th Board:</td><td><%= ce.getSsc_board() %></td>
                      </tr>
                      <tr>
                        <td>10th Passing Year:</td><td><%= ce.getSsc_passing_year() %></td>
                      </tr>
                      <tr>
                        <td>10th Percentage:</td><td><%= ce.getSsc_percentage() %></td>
                      </tr>
                      <tr>
                        <td>12th Board:</td><td><%= ce.getHsc_board() %></td>
                      </tr>
                      <tr>
                        <td>12th Passing Year:</td><td><%= ce.getHsc_passing_year() %></td>
                      </tr>
                      <tr>
                        <td>12th Percentage:</td><td><%= ce.getHsc_percentage() %></td>
                      </tr>
                      <tr>
                        <td>Highest Qualification:</td><td><%= ce.getHighest_qualification() %></td>
                      </tr>
                      <tr>
                        <td>Specialization:</td><td><%= ce.getSpecialization() %></td>
                      </tr>
                      <tr>
                        <td>Passing Year:</td><td><%= ce.getGpassing_year() %></td>
                      </tr>
                      <tr>
                        <td>Percentage:</td><td><%= ce.getGmarks() %></td>
                      </tr>
                    </tbody>
                  </table>
        
    </div>
    
  </div>
    
   </div><!------panel 1 end--------->
                                         
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
