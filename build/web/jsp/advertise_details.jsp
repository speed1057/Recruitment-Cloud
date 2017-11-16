<%@page import="crs_hibernate.request_bean"%>
<%@page import="crs_hibernate.advertise_bean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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
    String id=(String)session.getAttribute("cand_id");
    candidate_basic_bean b=null;
    if(id==null)
        request.getRequestDispatcher("/jsp/candidate_login.jsp").forward(request, response);
    else
    {
        request_deo deo= new request_deo();
        b=deo.fetchCandidateBasicDetails(id);
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
                          <a class="btn-warning dropdown-toggle" data-toggle="dropdown" href="#"><%=b.getName()%> <span class="caret"></span></a>
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
           	
            <div class="wrapper-content">
                
                <div class="row">
                    <div class="col-md-2">
                        <ul class="nav nav-stacked" role="tablist">
                            <li><a href="home_candidate.jsp"  class="btn btn-info btn-block">Go Back</a></li>
                        </ul>
                    </div>
                    
                    <div class="col-lg-10">
                    
                        <div class="tab-content">
    
   <!-----panel1------->     <div class="tab-pane active" id="panel1">
          
       <%
           String req_id= request.getParameter("req_id");
           request_deo deo= new request_deo();
           List l1=null;
           List l2=null;
           if(!(req_id==null))
            {
                int sid= Integer.parseInt(req_id);
                l1=deo.showAdvertise(sid);
                l2=deo.showIndentorReqDetails(sid);
            }
           Iterator it1= l1.iterator();
           Iterator it2= l2.iterator();
           advertise_bean adv=null;
           request_bean re=null;
           while(it1.hasNext() && it2.hasNext())
           {
               adv=(advertise_bean)it1.next();
               re=(request_bean)it2.next();
           }
           
       %>
       
                 <div class="table-responsive">
                                    <table class="table table-striped">
                                        <caption><h1><strong> Advertisement Details</strong></h1></caption>
                                        
                                        <tr><td><strong>Posted Date :</strong></td><td><%= adv.getStart_date()%></td></tr>
                                        <tr><td><strong>Job Profile :</strong></td><td><%= re.getPosition_name()%></td></tr>                                        
                                        <tr><td><strong>Qualification :</strong></td><td><%= re.getQualification()%></td></tr>
                                        <tr><td><strong>Stream :</strong></td><td><%= re.getStream()%></td></tr>
                                        <tr><td><strong>Skill Set :</strong></td><td><%= re.getSkillset()%></td></tr>
                                        <tr><td><strong>Experience :</strong></td><td><%= re.getExperience()%> years</td></tr>
                                        <tr><td><strong>Job Description :</strong></td><td><%= re.getJob_desc()%></td></tr>
                                        <tr><td><strong>Salary :</strong></td><td><%= re.getSalary()%></td></tr>
                                        <tr><td><strong>Required Post :</strong></td><td><%= re.getRequired_post()%></td></tr>
                                        <tr><td><strong>Fee :</strong></td><td><%=adv.getApp_fee() %> Rs</td></tr>
                                        <tr><td><strong>Fee Exemption for Female :</strong></td><td><%= adv.getFemale_exemption() %> Rs</td></tr>
                                        <tr><td><strong>Fee Exemption for SC/ST :</strong></td><td><%= adv.getSc_exemption() %> Rs</td></tr>
                                        <tr><td><strong>Fee Exemption for PH :</strong></td><td><%= adv.getPh_exemption() %> Rs</td></tr>
                                        <tr><td><strong>Last To Apply :</strong></td><td style="color:red;" ><%= adv.getEnd_date() %></td></tr>

                                        <tr><td align="center" colspan="2"><a href="./jsp_servlet/job_apply.jsp?candidate_id=<%= b.getCandidate_id()%>&adv_id=<%= adv.getAdv_id() %>&req_id=<%= re.getReq_id()%>" class="btn btn-info" >Apply Now</a></td></tr>



                                      </tbody>
                                </table>
                                  
                                </div>
  
       
       
       
                                
</div><!------panel 1 end--------->
   <!-----panel2------->       <div class="tab-pane" id="panel2">Job Applied</div>
                            <div class="tab-pane" id="panel3">yoooooo </div>               
                         </div>
                    </div>
                </div>
            </div>  <!------wrapper content-------------->
                         
            
            
            
            
            
        </div><!--master Container-->
                 
             <script>
        var x='<%= request.getAttribute("message") %>';
        if(x!='null'){alert(x);}
    </script>                         

    </body>
</html>
