
<%@page import="crs_hibernate.candidate_basic_bean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="crs_hibernate.candidate_register_bean"
        import="crs_hibernate.request_deo"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Candidate Registration</title>
        <link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet"/>
        <link rel="shortcut icon" href="<%= request.getContextPath()%>/image/title-icon.ico"/>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/bootstrap.css"/>
         <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template-container.css"/>
         <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/home_candidate_reg.css"/>
        <script src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"></script>
        <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/js/home_candidate_reg.js"></script>
    </head>
    <body ng-app="">
   <div class="master-container">
       
       <%
       String id = (String) session.getAttribute("cand_id");
    candidate_basic_bean b = new candidate_basic_bean();
    if (id == null) 
    {
        request.getRequestDispatcher("/jsp/candidate_login.jsp").forward(request, response);
    } 
    else 
    {
        request_deo deo = new request_deo();
        b = deo.fetchCandidateBasicDetails(id);
        if(b.getCandidate_id()==id)
        {
            response.sendRedirect(request.getContextPath()+"/jsp/home_candidate.jsp");
        }
    }
   
       %>
           
       
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
                          <a class="btn-warning dropdown-toggle" data-toggle="dropdown" href="#"><%= id %> <span class="caret"></span></a>
                          <ul class="dropdown-menu">          
                              <!--li><a href="#"><span class="glyphicon glyphicon-user"></span>  Profile</a></li-->
                              <li><a href="<%=request.getContextPath()%>/jsp/candidate_logout.jsp"><span class="glyphicon glyphicon-log-in"></span> LogOut</a></li>
                          </ul>
                        </li>   
                      </ul>
                    </div>
                 </nav>
                  </div>  
       
       <!--wrapper Content---------------------------->
       <div class="wrapper-content">
    <div class="row">
    	<section>
        <div class="wizard">
            <div class="wizard-inner">
                <div class="connecting-line"></div>
                <ul class="nav nav-tabs" role="tablist">

                    <li role="presentation" class="active">
                        <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Step 1">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-folder-open"></i>
                            </span>
                        </a>
                    </li>

                    <li role="presentation" class="disabled">
                        <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Step 2">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-pencil"></i>
                            </span>
                        </a>
                    </li>
                    <li role="presentation" class="disabled">
                        <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Step 3">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-picture"></i>
                            </span>
                        </a>
                    </li>

                    <li role="presentation" class="disabled">
                        <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Complete">
                            <span class="round-tab">
                                <i class="glyphicon glyphicon-ok"></i>
                            </span>
                        </a>
                    </li>
                </ul>
            </div>

            
            <!----------form ----------------->
            <form role="form" class="form-horizontal" name="myform" onsubmit="return confirm('Do you really want to submit?')" method="post" action="../ups" enctype="multipart/form-data" >
                <div class="tab-content">
                    <div class="tab-pane active" role="tabpanel" id="step1">
                       
                        <div class="step1">
                        
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <div class="panel-title">Basic Details</div>
                            </div>     
                        <div class="panel-body">
                            
                            
                            <div class="row mar_ned">
                                    <div class="form-group">
                                        <label class="control-label col-sm-4" for="name">Name :</label>
                                       <div class="col-sm-2">          
                                           <input type="text" class="form-control" id="first_name" pattern="[A-Za-z ]+" placeholder="First Name" name="first_name" ng-model="first_name" required>
                                         <span style="color: red" ng-show="myform.first_name.$touched && myform.first_name.$invalid">*First name is invalid.</span>

                                      </div>
                                     <div class="col-sm-2"> 
                                           <input type="text" class="form-control" id="last_name" pattern="[A-Za-z ]+" placeholder="Last Name" name="last_name" ng-model="last_name" required>
                                           <span style="color:red" ng-show="myform.last_name.$touched && myform.last_name.$invalid">*Last name is invalid.</span>                                         
                                     </div>
                                    </div>
                            </div>
                            
                             <div class="row mar_ned">
                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="father_name">Father's Name :</label>
                                   <div class="col-sm-4">          
                                       <input type="text" class="form-control" id="father_name" placeholder="Father's Name" pattern="[A-Za-z ]+" name="father_name" ng-model="father_name" required/>
                                       <span style="color:red" ng-show="myform.father_name.$touched && myform.father_name.$invalid">*Father's name is invalid.</span>
                                   </div>
                                </div>
                            </div>
                            
                            
                            <div class="row mar_ned">
                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="mother_name">Mother's Name :</label>
                                   <div class="col-sm-4">          
                                        <input type="text" class="form-control" id="mother_name" placeholder="Mother's Name" pattern="[A-Za-z ]+" name="mother_name" ng-model="mother_name" required/>
                                       <span style="color: red" ng-show="myform.mother_name.$touched && myform.mother_name.$invalid">*Mother's name is invalid.</span>
                                  </div>
                                </div>
                            </div>
                           
                            
                            <div class="row mar_ned">
                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="dob">Date of Birth :</label>
                                   <div class="col-sm-4">          
                                      <input type="date" class="form-control" id="dob" name="dob" ng-model="dob" required/>
                                      <span style="color:red" ng-show="myform.dob.$touched && myform.dob.$invalid" >*Date of birth is required.</span>
                                  </div>
                                </div>
                            </div>
                            
                            
                            <div class="row mar_ned">
                                 <div class="form-group">
                                    <label class="control-label col-sm-4"> Gender :</label>
                                    <div class="col-sm-4">
                                        <label class="radio-inline">
                                            <input type="radio" name="gender" id="inlineRadio1" value="Male" checked> Male
                                        </label>
                                        <label class="radio-inline">
                                             <input type="radio" name="gender" id="inlineRadio2" value="Female"> Female
                                        </label>
                                    </div>
                                </div>
                            </div>
                            
                        <div class="row mar_ned">
                            <div class="form-group">
                               <label class="control-label col-sm-4"> Marital Status :</label>
                               <div class="col-sm-4">
                                   <label class="radio-inline">
                                       <input type="radio" name="marital" id="inlineRadio3" value="Single" checked> Single
                                   </label>
                                   <label class="radio-inline">
                                        <input type="radio" name="marital" id="inlineRadio4" value="Married"> Married
                                   </label>
                               </div>
                           </div>
                        </div>
                            
                        <div class="row mar_ned">
                                 <div class="form-group">
                                    <label class="control-label col-sm-4"> Physically Handicapped :</label>
                                    <div class="col-sm-4">
                                        <label class="radio-inline">
                                            <input type="radio" name="phc" id="inlineRadio5" value="Yes" > Yes
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="phc" id="inlineRadio6" value="No" checked> No
                                        </label>
                                    </div>
                                </div>
                        </div>    

                        <div class="row mar_ned">
                                <div class="form-group">                   
                                <label class="control-label col-sm-4" for="caste">Caste:</label>                                      
                                
                                <div class="col-md-4">
                                
                                    <select name="caste" id="caste" name="caste"  ng-model="caste" class="form-control" required="true">
                                        <option value=""> Select Caste</option>
                                        <option value="General">General</option>
                                        <option value="OBC">OBC</option>
                                        <option value="SC/ST">SC/ST</option>
                                    </select>
                                    <span style="color: red" ng-show="myform.caste.$touched && myform.caste.$invalid" >*Caste is required.</span>
                                </div>
                            </div>
                            </div>    
                            
                            <div class="row mar_ned">
                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="nationality">Nationality :</label>
                                   <div class="col-sm-4">          
                                       <input type="text" class="form-control" id="nationality" placeholder="Nationality" pattern="[A-Za-z ]+" name="nationality" ng-model="nationality" required/>
                                       <span style="color: red" ng-show="myform.nationality.$touched && myform.nationality.$invalid">*Nationality is invalid</span>                                             
                                  </div>
                                </div>
                            </div>
                            
                            
                            
                            <div class="row mar_ned">
                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="paddress">Permanent Address :</label>
                                   <div class="col-sm-4">          
                                       <textarea class="form-control" id="paddress" pattern="[A-Za-z0-9., ]+" name="paddress" ng-model="paddress" required="true"></textarea>   
                                        <span style="color: red" ng-show="myform.paddress.$touched && myform.paddress.$invalid" >*Permanent address is invalid.</span>
                                  </div>
                                </div>
                            </div>
                            
                            <div class="row mar_ned">
                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="caddress">Correspondence Address :</label>
                                   <div class="col-sm-4">          
                                       <textarea class="form-control" id="caddress" pattern="[A-Za-z0-9., ]+" name="caddress" ng-model="caddress" required="true"></textarea>  
                                       <span style="color:red" ng-show="myform.caddress.$touched && myform.caddress.$invalid" >*Correspondence address is invalid.</span>
                                  </div>
                                </div>
                            </div>
                            
                             <div class="row mar_ned">
                                <div class="form-group">
                                   <div class="col-sm-offset-4 col-sm-2">          
                                     <input type="text" class="form-control" id="state"  pattern="[A-Za-z ]+" placeholder="State" name="state" ng-model="state" required/>
                                     <span style="color: red" ng-show="myform.state.$touched && myform.state.$invalid">*State name is invalid</span>
                                  </div>
                                    <div class="col-sm-2">          
                                        <input type="text" name="pincode" placeholder="Pincode" class="form-control" ng-model="pincode" ng-minlength="6" ng-maxlength="6" required />
                                      <p style="color:red" ng-show="myform.pincode.$error.minlength" class="help-block">*Minimum length is 6.</p>
                                      <p style="color:red" ng-show="myform.pincode.$error.maxlength" class="help-block">*Maximum length is 6.</p>

                                      <span style="color:red" ng-show="myform.pincode.$touched && myform.pincode.$invalid">*Pincode is required.</span>     
                                  </div>                                 
                                </div>
                            </div>
                            
                            
                            
                            <div class="row mar_ned">
                                <div class="form-group">
                                    <label class="control-label col-sm-4" for="country">Country :</label>
                                   <div class="col-sm-4">          
                                       <input type="text" class="form-control" id="country" pattern="[A-Za-z ]+" placeholder="Country" name="country" ng-model="country" required />
                                       <span style="color: red" ng-show="myform.country.$touched && myform.country.$invalid">*Country is required.</span>
                                  </div>
                                </div>
                            </div>
                           
                            
                                    <!---buttons------>

                                <ul class="list-inline pull-right">
                                    <li><button type="button" class="btn btn-primary next-step">Save and continue</button></li>
                                </ul>
                        </div>
                    </div>
                </div>
            </div>
                    <!--Step 2--------------------------------------------->
                    
                    <div class="tab-pane" role="tabpanel" id="step2">
                        <div class="step2">
                           <div class="panel panel-info">
                            <div class="panel-heading">
                                <div class="panel-title">Education</div>
                            </div>     
                            <div class="panel-body">
                            
                            
                            
                           
                                
                                
                                
                                
                                
                                 <div class="row mar_ned">
                                 <div class="form-group">                   
                                     <label class="control-label col-sm-4" for="ssc">10th :</label> 
                                
                                <div class="col-sm-2">
                                    <input type="number" name="ssc_passing_year" id="ssc_passing_year" pattern="[0-9]+"  ng-maxlength="4" ng-minlength="4" ng-model="ssc_passing_year" placeholder="Passing Year" class="form-control" required />
                                    <span style="color:red" ng-show="myform.ssc_passing_year.$touched && myform.ssc_passing_year.$invalid">*Invalid passing year.</span>
                                </div>
                                     <div class="col-sm-2">
                                         <input type="number" name="ssc_percentage" id="ssc_percentage" pattern="[0-9.]+" min="55" max="99"  ng-model="ssc_percentage" ng-minlength="2" ng-maxlength="5" placeholder="% Marks" class="form-control" required />
                                  <p style="color:red" ng-show="myform.ssc_percentage.$error.min" class="help-block">*Minimum percentage required is 55</p>
                                      <p style="color:red" ng-show="myform.ssc_percentage.$error.max" class="help-block">*Maximum percentage is %99</p>
                                      <span style="color: red" ng-show="myform.ssc_percentage.$touched && myform.ssc_percentage.$invalid">Percentage is Required.</span>
                                        
                                     </div>
                                 </div>
                            </div>
                                
                                 <div class="row mar_ned">
                                 <div class="form-group">                   
                                     <label class="control-label col-sm-4" for="ssc_board">10th Board :</label> 
                                
                                <div class="col-sm-4">
                                    <input type="text" name="ssc_board" id="ssc_board" pattern="[A-Za-z. ]+" placeholder="Board" ng-model="ssc_board" class="form-control" required />
                                    <span style="color: red" ng-show="myform.ssc_board.$touched && myform.ssc_board.$invalid">Board Name is Invalid</span>
                                </div>
                                 </div>
                            </div>
                                
                                
                                <div class="row mar_ned">
                                 <div class="form-group">                   
                                     <label class="control-label col-sm-4" for="ssc">12th :</label> 
                                
                                <div class="col-sm-2">
                                    <input type="number" name="hsc_passing_year" id="hsc_passing_year"  ng-maxlength="4" placeholder="Passing Year" ng-model="hsc_passing_year" class="form-control" required="true">
                               
                                 <span style="color: red" ng-show="myform.hsc_passing_year.$touched && myform.hsc_passing_year.$invalid">Invalid Passing Year.</span>
                                </div>
                                     <div class="col-sm-2">
                                    <input type="number" name="hsc_percentage" id="hsc_percentage" pattern="[0-9.]+" placeholder="% Marks" class="form-control"  ng-minlength="2" ng-maxlength="2" ng-model="hsc_percentage" required />
                                    <p style="color:red" ng-show="myform.hsc_percentage.$error.minlength" class="help-block">Minimum percentage is 40</p>
                                      <p style="color: red" ng-show="myform.hsc_percentage.$error.maxlength" class="help-block">Maximum length is %99</p>
                                        <span style="color:red" ng-show="myform.hsc_percentage.$touched && myform.hsc_percentage.$invalid">Invalid Percentage .</span>
                                    
                                    
                                    
                                    
                                </div>
                                 </div>
                            </div>
                                
                                
                                <div class="row mar_ned">
                                 <div class="form-group">                   
                                     <label class="control-label col-sm-4" for="hsc_board">12th Board :</label> 
                                
                                <div class="col-sm-4">
                                    <input type="text" name="hsc_board" id="hsc_board" pattern="[A-Za-z. ]+" placeholder="Board" class="form-control" ng-model="hsc_board" required="true">
                                    <span style="color: red" ng-show="myform.hsc_board.$touched && myform.hsc_board.$invalid">Invalid Board Name .</span>
                                </div>
                                 </div>
                            </div>
                            
                                
                                
                                
                                
                            <div class="row mar_ned">
                                <div class="form-group">                   
                                <label class="control-label col-sm-4" for="education">Highest Education :</label>                                      
                                
                                <div class="col-sm-4">
                                
                                    <select name="highest_qualification" id="highest_qualification" class="form-control" ng-model="highest_qualification" required="true">
                                        <option value=""> Select Highest Education</option>
                                        <option value="Ph.D">Ph.D</option>
                                        <option value="Masters Degree">Masters Degree</option>
                                        <option value="PG Diploma">PG Diploma</option>
                                        <option value="Bachelors Degree">Bachelors Degree</option>
                                        <option value="Diploma">Diploma</option>
                                        <option value="Intermediate/(10+2)">Intermediate/(10+2)</option>
                                        <option value="Secondary">Secondary</option>
                                        <option value="Others">Others</option>
                                    </select>
                                    <span style="color: red" ng-show="myform.highest_qualification.$touched && myform.highest_qualification.$invalid">Highest Qualification is Required.</span>
                                </div>
                            </div>
                            </div>  
                                
                            <div class="row mar_ned">
                                 <div class="form-group">                   
                                     <label class="control-label col-sm-4" for="specs">Specialization :</label> 
                                
                                <div class="col-sm-4">
                                    <input type="text" name="specialization" id="specialization" pattern="[A-Za-z&. ]+" placeholder="Specialization" class="form-control" autocomplete="off" ng-model="specialization" required />
                                <span style="color: red" ng-show="myform.specialization.$touched && myform.specialization.$invalid"> Invalid Specialization.</span>

                                </div>
                                 </div>
                            </div>
                                
                            <div class="row mar_ned">
                                 <div class="form-group">                   
                                     <label class="control-label col-sm-4" for="gpassing_year">Passing Year :</label> 
                                
                                <div class="col-md-2">
                                    <input type="number" name="gpassing_year" id="gpassing_year" ng-maxlength="4" placeholder="Passing Year" class="form-control" ng-model="gpassing_year" required="true"/>
                                    <span style="color: red" ng-show="myform.gpassing_year.$touched && myform.gpassing_year.$invalid">Invalid Passing year.</span>

                                </div>
                                 <div class="col-sm-2">
                                     <input type="number" name="gmarks" id="gmarks" placeholder="% Marks" pattern="[0-9.]" ng-maxlength="4" ng-minlength="2" class="form-control" ng-model="gmarks" required="true" />
                              <p style="color: red" ng-show="myform.gmarks.$error.minlength" class="help-block">Minimum percentage is 40</p>
                                      <p style="color: red"ng-show="myform.gmarks.$error.maxlength" class="help-block">Maximum length is %99</p>
                                       
                                    
                                 </div>
                                 </div>
                            </div>
                                
                            
                            
                                
                                
                        <ul class="list-inline pull-right">
                            <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
                            <li><button type="button" class="btn btn-primary next-step">Save and continue</button></li>
                        </ul>
                          </div>
                    </div>
                </div>
            </div>
                    <!--Step 3--------------------------------------------->
                    <div class="tab-pane" role="tabpanel" id="step3">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <div class="panel-title">Resume and Profile Picture</div>
                            </div>     
                            <div class="panel-body">
                            
                                
                            <div class="row mar_ned">
                                 <div class="form-group">                   
                                     <label class="control-label col-md-4" for="photo">Upload Profile Picture :</label>
                                <div class="col-md-4">
                                    <input type="file" name="photo" id="photo" placeholder="photo" required />
                                </div>
                                 </div>
                            </div>
                                
                               <!--div class="row mar_ned">
                                 <div class="form-group">                   
                                     <label class="control-label col-md-4" for="resume">Upload Photo :</label>
                                <div class="col-md-4">
                                    <input type="file" name="resume" id="resume" placeholder="Resume"/>
                                </div>
                                 </div>
                            </div-->
                                
                            
                            

                            
                        <ul class="list-inline pull-right">
                            <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
                            <li><button type="submit" class="btn btn-default next-step">Skip</button></li>
                            <li><button type="submit" class="btn btn-primary btn-info-full next-step">Save and Submit</button></li>
                        </ul>
                       </div>
                    </div>
                    </div>
                    <!--Step 4--------------------------------------------->
                    <div class="tab-pane" role="tabpanel" id="complete">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                 <h4 align="center">Registration Completed!</h4>
                            </div>
                          
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </form>
        </div>
    </section>
   </div>
       </div>
</div>
                                  
    <script>
        var x='<%= session.getAttribute("message") %>';
        if(x!='null'){alert(x);}
        <% session.removeAttribute("message"); %>
    </script>                         
    </body>
</html>
