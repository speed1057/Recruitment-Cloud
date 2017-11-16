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
    if (id == null) {
        request.getRequestDispatcher("/jsp/candidate_login.jsp").forward(request, response);
    } 
    else
    {
        
        request_deo deo = new request_deo();
        
        cb = deo.fetchCandidateBasicDetails(id);
        ce = deo.fetchCandidateEducationDetails(id);
        
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
                                    <li><a href="#"><span class="glyphicon glyphicon-user"></span>  Profile</a></li>
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
                            <li><a href="candidate_profile.jsp" class="btn btn-info btn-block">Go Back </a></li>
                        </ul>
                    </div>

                    <div class="col-lg-10">

                        <div class="tab-content">

                            <!-----panel1------->     <div class="tab-pane active" id="panel1">

                                
                                
  <h1 class="page-header">Candidate Profile</h1>
  <div class="row">
    <!-- left column -->
    <div class="col-md-4 col-sm-6 col-xs-12">
      <div class="text-center">
          <img src="../image/hiring-candidate-login-image.png" class="avatar img-circle img-thumbnail" alt="avatar">
        <h6>Upload a different photo...</h6>
        <input type="file" class="text-center center-block well well-sm">
      </div>
    </div>
    <!-- edit form column -->
    <div class="col-md-8 col-sm-6 col-xs-12 personal-info">
      <!--div class="alert alert-info alert-dismissable">
        <a class="panel-close close" data-dismiss="alert">×</a> 
        <i class="fa fa-coffee"></i>
        This is an <strong>.alert</strong>. Use this to show important messages to the user.
      </div-->
      <h2>Personal info</h2>
      
      <form class="form-horizontal" id="myform" name="myform" role="form">
               
                                    
                            
        <div class="form-group">
          <label class="col-md-3 control-label"></label>
          <div class="col-md-8">
            <input type="hidden" class="btn btn-primary" value="Save Changes" type="button">
            <span></span>
            <input type="hidden" class="btn btn-default" value="Cancel" type="reset">
          </div>
        </div>
      </form>
    </div>
  </div>
    
                                                      </div><!------panel 1 end--------->
                                         
                        </div>
                    </div>
                </div>
            </div>  <!------wrapper content-------------->






        </div><!--master Container-->
<script>
    
        
    </script>    
        <script>
            var x = '<%= (String)session.getAttribute("message")%>';
            if (x != 'null') {
                alert(x);
            <% session.removeAttribute("message"); %>
            }
        </script>                         

    </body>
</html>
