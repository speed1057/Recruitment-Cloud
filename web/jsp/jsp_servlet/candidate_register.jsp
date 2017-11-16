
<%@page import="crs_hibernate.EmailUtility"%>
<%@page import="crs_hibernate.candidate_register_bean"%>
<%@page import="crs_hibernate.request_deo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
      <%
                     request_deo deo = new request_deo();
                     String cand_id=request.getParameter("email");
                     session.setAttribute("cand_id", cand_id);
              if(cand_id!=null && !(cand_id.equals(deo.validateCandOnRegister(cand_id))))
              {
                candidate_register_bean cc = new candidate_register_bean();
                cc.setCandidate_id(request.getParameter("email"));
                cc.setPassword(request.getParameter("pwd"));
                String cod=request.getParameter("code")+request.getParameter("number");
                cc.setMobile(Long.parseLong(cod));
                cc.setSecurity_question(request.getParameter("security_que"));
                    
                    deo.registerCandidate(cc);
                String toAddress=cand_id;
                String subject="Corporate Recruitment System Registration";
                String mess="Welcome " + cand_id + ". Thank you for registring on CRS. Your user id is - "+ cand_id +". Please login and Complete your Registration if not.";
                EmailUtility.sendEmail(toAddress, subject, mess);
                    session.setAttribute("message", "You Are Registered Successfully! Please Complete Your Profile Details!");                    
                    response.sendRedirect(request.getContextPath()+"/jsp/candidate_complete_registration.jsp");
              }
              else
              {                
                    session.setAttribute("message", "You Have Already Register with this Email ID! Please Login.");
                    response.sendRedirect(request.getContextPath()+"/jsp/candidate_login.jsp");
              }
             
            %>
