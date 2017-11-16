<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <title>Contact Us</title>
        <link rel="shortcut icon" href="image/title-icon.ico"/>
        <meta charset="UTF-8">
        <!--for mobile responsive design-->
        <link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet"/>
        <link rel="shortcut icon" href="<%= request.getContextPath()%>/image/title-icon.ico"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template-container.css"/>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/home-style.css"/>
            <script src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script>
      function initMap() {
        var cdac = {lat: 17.3394285, lng: 78.3215482};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 12,
          center: cdac
        });
        var marker = new google.maps.Marker({
          position: cdac,
          map: map
        });
      }
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyChXlRp4VIm8FxHQypzmFwHaRBW-mVHfzA&callback=initMap">
    </script>  
</head>
  <body>
   
    
     <div class="master-container">
            <div class="header">
                <div class="row">
                    <div class="col-md-offset-0 col-lg-1">
                        <a href="<%=request.getContextPath()%>/index.html"><img class="img-thumbnail" style="width:70px; height:20%; padding-bottom:0;" src="<%=request.getContextPath()%>/image/cdac.jpg" alt="cdac"/></a>
                    </div>
                    <div class="col-lg-9 text-center">
                        <h1 style="color: white "><strong>Corporate Recruitment System</strong></h1>
                    </div>
                </div>
            </div>            
        

        
 <div class="wrapper-content" style="padding-left: 5%; padding-right:2%; padding-bottom: 0px; padding-top:2%; ">
     
     <div id="about_us" class="home-login-btn" style="float:left; padding-left: 1.5%;">
                    <a href="<%=request.getContextPath()%>/jsp/about_us.jsp" class="btn btn-info">About Us</a>
                </div>
                
                <div id="contact_us" class="home-login-btn" style="float:left;">
                    <a href="<%=request.getContextPath()%>/jsp/contact_us.jsp" class="btn btn-info">Contact Us</a>
                </div>
                
                <div id="employee-login" class="home-login-btn">
                    <a href="<%=request.getContextPath()%>/jsp/employee_login.jsp" class="btn btn-info">Employee Login</a>
                </div> 
                <div id="candidate-login" class="home-login-btn">
                    <a href="<%=request.getContextPath()%>/jsp/candidate_login.jsp" class="btn btn-info">Candidate Login</a>
                </div>
     
     
   <br>
   <br>
   <br>
   <br>
   <div class="col-md-6">
     <address style="margin-left: 10%;">
         <h3>Contact Us</h3>
         <br>
         <strong>C-DAC</strong>
           </br>
  <strong>Centre for Development of Advanced Computing</strong><br>
   Plot No. 6 & 7, Hardware Park,</br>
   Sy No. 1/1, Srisailam Highway,</br>
   Pahadi Shareef Via (Keshavagiri Post)</br> 
   Hyderabad - 500005</br>
   Telangana(India)</br>
   Phone:+91-9100034446/3447/3448</br>
   Fax: +91-9100034450</br>
<br>
  <strong>Web-site:</strong><br>
  <a href="mailto:#">https://www.cdac.in</a>
</address>
   </div>
   <div class="col-md-6">
   <div style="height:300px; width:500px;" id="map"></div>
</div>
 </div>
    </div>
    </body>
</html>


