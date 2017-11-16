<%@page import="crs_hibernate.upload_picture"%>
<%@page import="crs_hibernate.candidate_education_bean"%>
<%@page import="crs_hibernate.candidate_basic_bean"%>
<%@page import="crs_hibernate.request_deo"%>
<%@page import="crs_hibernate.request_deo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Date"%>
<%@page import="crs_hibernate.EmailUtility"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
                String cand_id=(String)session.getAttribute("cand_id");                
                request_deo deo= new request_deo();
                
                if(cand_id!=null && !(cand_id.equals(deo.candBasicValidateOnLoad(cand_id))))
                {
                candidate_basic_bean cb= new candidate_basic_bean();
                cb.setCandidate_id(cand_id);
                cb.setCand_state(request.getParameter("state"));
                cb.setCaste(request.getParameter("caste"));
                cb.setCorr_add(request.getParameter("caddress"));
                cb.setCountry(request.getParameter("country"));                
                cb.setGender(request.getParameter("gender"));
                if(!(request.getParameter("pincode")==null))
                    cb.setPincode(Integer.parseInt(request.getParameter("pincode")));
                cb.setPermanent_add(request.getParameter("paddress"));
                cb.setNationality(request.getParameter("nationality"));
                cb.setName((request.getParameter("first_name")+" "+request.getParameter("last_name")));
                cb.setMarital_status(request.getParameter("marital"));
                cb.setFather_name(request.getParameter("father_name"));
                cb.setMother_name(request.getParameter("mother_name"));
                cb.setPh(request.getParameter("phc"));
                /*    
                Part photo=request.getPart("photo");
                upload_picture p= new upload_picture();
                p.uploadImage(photo);
                */
                    String temp=request.getParameter("dob");                
                   out.print(temp);
                    cb.setDob(temp);
                deo.candidateBasicDetails(cb);
                ///////////////////////////////education details/////////////////////////////
                
                candidate_education_bean eb= new candidate_education_bean();
                
                eb.setCandidate_id(cand_id);
                if(request.getParameter("ssc_passing_year") != null && request.getParameter("ssc_passing_year") !=null && request.getParameter("gpassing_year")!=null)
                { eb.setSsc_passing_year(Integer.parseInt(request.getParameter("ssc_passing_year")));
                  eb.setHsc_passing_year(Integer.parseInt(request.getParameter("hsc_passing_year")));
                  eb.setGpassing_year(Integer.parseInt(request.getParameter("gpassing_year")));
                }
                if(request.getParameter("ssc_percentage") !=null && request.getParameter("hsc_percentage")!=null && request.getParameter("gmarks")!=null)
                {  eb.setSsc_percentage(Double.parseDouble(request.getParameter("ssc_percentage")));
                   eb.setHsc_percentage(Double.parseDouble(request.getParameter("hsc_percentage")));
                   eb.setGmarks(Double.parseDouble(request.getParameter("gmarks")));
                }
                eb.setSsc_board(request.getParameter("ssc_board"));
                eb.setHsc_board(request.getParameter("hsc_board"));
                eb.setHighest_qualification(request.getParameter("highest_qualification"));
                eb.setSpecialization(request.getParameter("specialization"));
            
                /////////////////////////////Data Base Insertion///////////////////////////
           
                
                deo.submitAllCanDetails(eb);
            
                session.setAttribute("message", "Your registration has been Completed");
                String toAddress=cb.getCandidate_id();
                String subject="Corporate Recruitment System Registration";
                String mess="Welcome Mr. " + cb.getName() + ". Thank you for registering on CRS. Your user id is - "+ cb.getCandidate_id() +". Visit our Website for continuous update on Jobs. Check job advertisements on your Job Portal and apply for job of your choice." + " Happy Job Hunting!!";
                EmailUtility.sendEmail(toAddress, subject, mess);
                response.sendRedirect(request.getContextPath()+"/jsp/home_candidate.jsp");
                }
                else
                {
                   session.setAttribute("message", "Your are already Registered With this Email ID!!");
                   response.sendRedirect(request.getContextPath()+"/jsp/home_candidate.jsp");
                }
                  
           %>
