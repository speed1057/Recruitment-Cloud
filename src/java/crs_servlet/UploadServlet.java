package crs_servlet;

import crs_hibernate.EmailUtility;
import crs_hibernate.candidate_basic_bean;
import crs_hibernate.candidate_education_bean;
import crs_hibernate.request_deo;
import crs_jdbc.crs_dbms;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)

public class UploadServlet extends HttpServlet {

    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");

        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        ///////////////////////////////////////////////////////////////////////////
        HttpSession session = request.getSession(true);

        String cand_id = (String) session.getAttribute("cand_id");
        request_deo deo = new request_deo();

        if (cand_id != null && !(cand_id.equals(deo.candBasicValidateOnLoad(cand_id)))) {
            try {
                candidate_basic_bean cb = new candidate_basic_bean();
                cb.setCandidate_id(cand_id);
                cb.setCand_state(request.getParameter("state"));
                cb.setCaste(request.getParameter("caste"));
                cb.setCorr_add(request.getParameter("caddress"));
                cb.setCountry(request.getParameter("country"));
                cb.setGender(request.getParameter("gender"));
                if (!(request.getParameter("pincode") == null)) {
                    cb.setPincode(Integer.parseInt(request.getParameter("pincode")));
                }
                cb.setPermanent_add(request.getParameter("paddress"));
                cb.setNationality(request.getParameter("nationality"));
                cb.setName((request.getParameter("first_name") + " " + request.getParameter("last_name")));
                cb.setMarital_status(request.getParameter("marital"));
                cb.setFather_name(request.getParameter("father_name"));
                cb.setMother_name(request.getParameter("mother_name"));
                cb.setPh(request.getParameter("phc"));
                
                String temp = request.getParameter("dob");
                out.print(temp);
                cb.setDob(temp);
                
                deo.candidateBasicDetails(cb);
                ///////////////////////////////education details/////////////////////////////
                
                candidate_education_bean eb = new candidate_education_bean();
                
                eb.setCandidate_id(cand_id);
                if (request.getParameter("ssc_passing_year") != null && request.getParameter("ssc_passing_year") != null && request.getParameter("gpassing_year") != null) {
                    eb.setSsc_passing_year(Integer.parseInt(request.getParameter("ssc_passing_year")));
                    eb.setHsc_passing_year(Integer.parseInt(request.getParameter("hsc_passing_year")));
                    eb.setGpassing_year(Integer.parseInt(request.getParameter("gpassing_year")));
                }
                if (request.getParameter("ssc_percentage") != null && request.getParameter("hsc_percentage") != null && request.getParameter("gmarks") != null) {
                    eb.setSsc_percentage(Double.parseDouble(request.getParameter("ssc_percentage")));
                    eb.setHsc_percentage(Double.parseDouble(request.getParameter("hsc_percentage")));
                    eb.setGmarks(Double.parseDouble(request.getParameter("gmarks")));
                }
                eb.setSsc_board(request.getParameter("ssc_board"));
                eb.setHsc_board(request.getParameter("hsc_board"));
                eb.setHighest_qualification(request.getParameter("highest_qualification"));
                eb.setSpecialization(request.getParameter("specialization"));
                
                /////////////////////////////Data Base Insertion///////////////////////////
                deo.submitAllCanDetails(eb);
                
                
                ///////////pic upload/////////////////////////////////////////////////
                Part filePart = request.getPart("photo");
                
                String photo = "";
                String path = "C:\\Users\\gohan\\Desktop\\Project Data\\Recruitment Software\\web\\profile_pics";
                
                File file = new File(path);
                file.mkdir();
                String fileName = getFileName(filePart);
                
                OutputStream out = null;
                
                InputStream filecontent = null;
                
                PrintWriter writer = response.getWriter();
                out = new FileOutputStream(new File(path + File.separator + fileName));
                
                filecontent = filePart.getInputStream();
                
                int read = 0;
                final byte[] bytes = new byte[1024];
                
                while ((read = filecontent.read(bytes)) != -1) {
                    out.write(bytes, 0, read);
                    photo = fileName;
                }
                
                crs_dbms cd = new crs_dbms();
                cd.UploadPhoto(cand_id, photo);
                
                session.setAttribute("message", "Your registration has been Completed ! Please Login!.");
                String toAddress = cb.getCandidate_id();
                String subject = "Corporate Recruitment System Registration";
                String mess = "Welcome Mr. " + cb.getName() + ". Thank you for registering on CRS. Your user id is - " + cb.getCandidate_id() + ". Visit our Website for continuous update on Jobs. Check job advertisements on your Job Portal and apply for job of your choice." + " Happy Job Hunting!!";
                try {
                    EmailUtility.sendEmail(toAddress, subject, mess);
                } catch (MessagingException ex) {
                    Logger.getLogger(UploadServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                
                response.sendRedirect(request.getContextPath() + "/jsp/candidate_login.jsp");
            } catch (Exception ex) {Logger.getLogger(UploadServlet.class.getName()).log(Level.SEVERE, null, ex);}
        } 
        else 
        {
            session.setAttribute("message", "Your are already Registered With this Email ID!. Please login!");
            response.sendRedirect(request.getContextPath() + "/jsp/candidate_login.jsp");
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
