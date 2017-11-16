
package crs_hibernate;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="candidate_education_details")
public class candidate_education_bean implements Serializable {

    @Id
    String candidate_id;

    int ssc_passing_year;
    int hsc_passing_year;
    int gpassing_year;
    double ssc_percentage;
    double hsc_percentage;
    double gmarks;
    String ssc_board;
    String hsc_board;
    String highest_qualification;
    String specialization;


    public String getCandidate_id() {
        return candidate_id;
    }

    public void setCandidate_id(String candidate_id) {
        this.candidate_id = candidate_id;
    }

    public int getSsc_passing_year() {
        return ssc_passing_year;
    }

    public void setSsc_passing_year(int ssc_passing_year) {
        this.ssc_passing_year = ssc_passing_year;
    }

    public int getHsc_passing_year() {
        return hsc_passing_year;
    }

    public void setHsc_passing_year(int hsc_passing_year) {
        this.hsc_passing_year = hsc_passing_year;
    }

    public int getGpassing_year() {
        return gpassing_year;
    }

    public void setGpassing_year(int gpassing_year) {
        this.gpassing_year = gpassing_year;
    }

    public double getSsc_percentage() {
        return ssc_percentage;
    }

    public void setSsc_percentage(double ssc_percentage) {
        this.ssc_percentage = ssc_percentage;
    }

    public double getHsc_percentage() {
        return hsc_percentage;
    }

    public void setHsc_percentage(double hsc_percentage) {
        this.hsc_percentage = hsc_percentage;
    }

    public double getGmarks() {
        return gmarks;
    }

    public void setGmarks(double gmarks) {
        this.gmarks = gmarks;
    }

    public String getSsc_board() {
        return ssc_board;
    }

    public void setSsc_board(String ssc_board) {
        this.ssc_board = ssc_board;
    }

    public String getHsc_board() {
        return hsc_board;
    }

    public void setHsc_board(String hsc_board) {
        this.hsc_board = hsc_board;
    }

    public String getHighest_qualification() {
        return highest_qualification;
    }

    public void setHighest_qualification(String highest_qualification) {
        this.highest_qualification = highest_qualification;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    
    
}
