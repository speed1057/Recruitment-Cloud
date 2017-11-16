<%@page import="crs_hibernate.EmailUtility"%>
<%@page import="crs_hibernate.request_bean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="crs_hibernate.advertise_bean"%>
<%@page import="crs_hibernate.request_deo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int request_id=Integer.parseInt(request.getParameter("req_id"));
    request_deo deo = new request_deo();
   if(request_id!=0 && deo.validateAdvertiseOnLoad(request_id)==0)
   {
    String start_d = request.getParameter("start_date");
   String end_d = request.getParameter("end_date");
   String admit_d = request.getParameter("admit_card_date");
    DateFormat df = new SimpleDateFormat("yyyy-mm-dd");
    Date date1 = null,date2=null,date3=null;
    try {
        date1 = df.parse(start_d);
        date2 = df.parse(end_d);
        date3 = df.parse(admit_d);
    } catch (Exception e1) {
        System.out.println("Exception occurred in parsing date : "+e1);
    }   
    advertise_bean ad= new advertise_bean();
    ad.setAdmit_card_date(date3);
    ad.setApp_fee(Double.parseDouble(request.getParameter("app_fee")));
    ad.setEnd_date(date2);
    ad.setFemale_exemption(Double.parseDouble(request.getParameter("app_female_fee")));
    ad.setPh_exemption(Double.parseDouble(request.getParameter("app_ph_fee")));
    ad.setReq_id(request_id);
    ad.setSc_exemption(Double.parseDouble(request.getParameter("app_sc_fee")));
    ad.setStart_date(date1);
    ad.setSalary_scale(Double.parseDouble(request.getParameter("salary_scale")));
              Iterator tt=  deo.showIndentorReqDetails(ad.getReq_id()).iterator();
              request_bean be= new request_bean();
              while(tt.hasNext())
                  be=(request_bean)tt.next();
              
                String toAddress=be.getEmp_id();
                String subject="Corporate Recruitment System No-Reply";
                String mess="The Advertisement of the resource recruitment for the " +be.getProject_name() + " has been posted!";
                EmailUtility.sendEmail(toAddress, subject, mess); 
               
               deo.submitAdvertise(ad);
       request.setAttribute("message","Your Advertise has been Posted!");
               request.getRequestDispatcher("/jsp/home_hr.jsp").forward(request, response);
   }
   else
   {
       request.setAttribute("message","Your have already Posted the advertisement this Request ID");
       request.getRequestDispatcher("/jsp/home_hr.jsp").forward(request, response);
   }
               
               
 %>
 
