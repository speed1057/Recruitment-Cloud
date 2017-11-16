
package crs_hibernate;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="resource_request")
public class request_bean implements Serializable {
@Id
@GeneratedValue(strategy=GenerationType.AUTO)        
int req_id;
@Column
int project_code,position_duration,experience,required_post,existing_emp,position_id;
String project_name,position_name,skillset,qualification,stream,job_desc;
long salary;
String emp_id;
String status_hr;
String status_finance;

    public String getEmp_id() {
        return emp_id;
    }

    public void setEmp_id(String emp_id) {
        this.emp_id = emp_id;
    }

    public String getStatus_hr() {
        return status_hr;
    }

    public void setStatus_hr(String status_hr) {
        this.status_hr = status_hr;
    }

    public String getStatus_finance() {
        return status_finance;
    }

    public void setStatus_finance(String status_finance) {
        this.status_finance = status_finance;
    }

    public int getReq_id() {
        return req_id;
    }

    public void setReq_id(int req_id) {
        this.req_id = req_id;
    }

    public int getProject_code() {
        return project_code;
    }

    public void setProject_code(int project_code) {
        this.project_code = project_code;
    }

    public String getProject_name() {
        return project_name;
    }

    public void setProject_name(String project_name) {
        this.project_name = project_name;
    }

    public int getRequired_post() {
        return required_post;
    }

    public void setRequired_post(int required_post) {
        this.required_post = required_post;
    }

    public int getExisting_emp() {
        return existing_emp;
    }

    public void setExisting_emp(int existing_emp) {
        this.existing_emp = existing_emp;
    }

    public int getPosition_id() {
        return position_id;
    }

    public void setPosition_id(int position_id) {
        this.position_id = position_id;
    }

    public String getPosition_name() {
        return position_name;
    }

    public void setPosition_name(String position_name) {
        this.position_name = position_name;
    }

    public int getPosition_duration() {
        return position_duration;
    }

    public void setPosition_duration(int position_duration) {
        this.position_duration = position_duration;
    }

    public int getExperience() {
        return experience;
    }

    public void setExperience(int experience) {
        this.experience = experience;
    }

    public String getSkillset() {
        return skillset;
    }

    public void setSkillset(String skillset) {
        this.skillset = skillset;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getStream() {
        return stream;
    }

    public void setStream(String stream) {
        this.stream = stream;
    }

    public String getJob_desc() {
        return job_desc;
    }

    public void setJob_desc(String job_desc) {
        this.job_desc = job_desc;
    }

    public long getSalary() {
        return salary;
    }

    public void setSalary(long salary) {
        this.salary = salary;
    }

}
