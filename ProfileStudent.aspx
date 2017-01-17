<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProfileStudent.aspx.cs" Inherits="StudentServices.ProfileStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="mj_lightgraytbg mj_resumepreview mj_toppadder80 mj_bottompadder80">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-lg-offset-3 col-md-offset-3">
                    <div class="mj_resume_heading">
                        <img src="images/info.jpg" class="img-responsive" alt="" width="180" height="180">
                        <h1 id="StudentName" runat="server"></h1>
                        <ul>
                            <li>
                                <label>
                                    <i class="fa fa-map-marker"></i>
                                </label>
                                Riyadh</li>
                            <li>
                                <label>Classification:</label><a href="#">web Designer</a>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mj_toppadder80 ">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="row">
                            <div class="mj_resume_changeing mj_yellowbg">
                                <a href="PostResume.aspx"><i class="fa fa-angle-left"></i>Edit Resume</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="row">
                            <div class="mj_resume_changeing mj_bluebg">
                                <a href="choose_package.html">Search Jobs<i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="mj_postdiv mj_jobdetail mj_toppadder50 mj_bottompadder50">
                        <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                    <label>Overview</label>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
                                    <div class="mj_detaildiv">
                                        <p runat="server" id="StudentOverview"></p>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mj_toppadder30 mj_bottompadder30">
                                    <div class="mj_divider"></div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                    <label>skills</label>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
                                    <div class="mj_detaildiv">
                                        <ul class="mj_selected_content" id="StudentsSkills" runat="server">
                                            
                                        </ul>

                                    </div>
                                </div>

                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mj_toppadder30 mj_bottompadder30">
                                    <div class="mj_divider"></div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                    <label>Interests</label>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
                                    <div class="mj_detaildiv">
                                        <ul class="mj_selected_content" id="StudentsInterests" runat="server">
                                            
                                        </ul>

                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mj_toppadder30 mj_bottompadder30">
                                    <div class="mj_divider"></div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                    <label>Education</label>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
                                    <div class="mj_detaildiv">
                                        <span>University of science and technology yemen</span>
                                        <blockquote class="mj_blueblockquote">
                                            <span><i class="fa fa-calendar"></i>Dec 2010 - Sep 2011</span>
                                            <h5>Computer Science</h5>
                                            <p>Development</p>
                                        </blockquote>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mj_toppadder30 mj_bottompadder30">
                                    <div class="mj_divider"></div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                    <label>Experience</label>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
                                    <div class="mj_detaildiv mj_bottompadder30">
                                        <span>Programmer</span>
                                        <blockquote class="mj_yellowblockquote">
                                            <span><i class="fa fa-calendar"></i>Jul 2012 - Dec 2013</span>
                                            <h5>Software Developer</h5>
                                            <p>
                                                •	Gather requirements by interviewing business owners and developing prototypes.
                                                •	Design the solution.
                                                •	Develop the system modules.
                                                •	Provide the user interface and look-and-feel requirements to the graphics designer.
                                                •	Deploy the website to a public hosting service.
                                                •	Conduct training for the administration team.
                                                •	Support administrators and troubleshoot technical issues.
                                            </p>
                                        </blockquote>
                                    </div>
                                    <div class="mj_detaildiv mj_bottompadder30">
                                        <span>Project Manager</span>
                                        <blockquote class="mj_yellowblockquote">
                                            <span><i class="fa fa-calendar"></i>Jul 2013 - Dec 2014</span>
                                            <h5>CRM</h5>
                                            <p>
                                                •	Developing office automation applications for different sectors using Microsoft technologies .
                                                •	Database developer, designer and Administrator using MS SQL Server .
                                                •	Managing and Administration for the main archiving system of  Hala company.
                                                •	Developing  Official Website of AVIS rent Car.
                                            </p>
                                        </blockquote>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="mj_about_section ">
                        <div class="row">
                            <ul>
                                <li><a href="#"><i class="fa fa-twitter"></i>Twitter</a>
                                </li>
                                <li><a href="#"><i class="fa fa-facebook"></i>facebook</a>
                                </li>
                                <li><a href="#"><i class="fa fa-dribbble"></i>Bayt</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="mj_resumepreview_footer">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="row">
                                <div class="mj_resume_changeing mj_yellowbg">
                                    <a href="PostResume.aspx"><i class="fa fa-angle-left"></i>Edit Resume</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="row">
                                <div class="mj_resume_changeing mj_bluebg">
                                    <a href="choose_package.html">Choose a Package<i class="fa fa-angle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
