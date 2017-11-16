/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package crs_hibernate;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;

/**
 *
 * @author gohan
 */
@Entity
@Table(name="advertise")
public class advertise_bean implements Serializable {

    
   @Id
   @GeneratedValue(strategy=GenerationType.AUTO)
   int adv_id;
   @Column
   int req_id;
   @Temporal(javax.persistence.TemporalType.DATE)
    Date start_date, end_date,admit_card_date;
   double app_fee,female_exemption,sc_exemption,ph_exemption,salary_scale;

    public int getAdv_id() {
        return adv_id;
    }

   public double getSalary_scale() {
        return salary_scale;
    }

    public void setSalary_scale(double salary_scale) {
        this.salary_scale = salary_scale;
    }
   
   
    public int getReq_id() {
        return req_id;
    }

    public void setReq_id(int req_id) {
        this.req_id = req_id;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }

    public Date getAdmit_card_date() {
        return admit_card_date;
    }

    public void setAdmit_card_date(Date admit_card_date) {
        this.admit_card_date = admit_card_date;
    }

    public double getApp_fee() {
        return app_fee;
    }

    public void setApp_fee(double app_fee) {
        this.app_fee = app_fee;
    }

    public double getFemale_exemption() {
        return female_exemption;
    }

    public void setFemale_exemption(double female_exemption) {
        this.female_exemption = female_exemption;
    }

    public double getSc_exemption() {
        return sc_exemption;
    }

    public void setSc_exemption(double sc_exemption) {
        this.sc_exemption = sc_exemption;
    }

    public double getPh_exemption() {
        return ph_exemption;
    }

    public void setPh_exemption(double ph_exemption) {
        this.ph_exemption = ph_exemption;
    }
    
    
}
