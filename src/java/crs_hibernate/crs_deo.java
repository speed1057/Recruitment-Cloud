/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package crs_hibernate;

import java.util.List;
import org.hibernate.*;

public interface crs_deo {

public Session getDBMSSession();
public void submitRequest(Object req);
public void submitAdvertise(advertise_bean req);
public List showRequests();
public void registerCandidate(candidate_register_bean req);
public String validateCandOnRegister(String cand_id);
public void candidateBasicDetails(candidate_basic_bean req);
public String candBasicValidateOnLoad(String cand_id);
public int validateAdvertiseOnLoad(int req_id);
public void submitAllCanDetails(candidate_education_bean be);
public candidate_basic_bean fetchCandidateBasicDetails(String can_id);
public String candidateLoginValidation(String userid, String pass);
public List showAdvertise();
public List showCandidateBasicDetails();
public List showCandidateEducationDetails();
public List showIndentorReqDetails(int id);
public List showRequestsToFinance();
public List showCandidateFullDetails();
public List showAdvertise(int req_id);
public void applyForJob(job_applied_bean j);
public boolean isvalidEmailandAnswer(String id,String ans);
public int changeEmpPassword(String id,String pass);
public boolean isvalidCandidateandAnswer(String id, String ans);
public int changeCandidatePassword(String id,String pass);
public candidate_education_bean fetchCandidateEducationDetails(String can_id);
public candidate_register_bean fetchCandidateRegistrationDetails(String can_id);
}
