<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JobDetail.aspx.cs" Inherits="StudentServices.JobDetail" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="mj_pagetitle2">
        <div class="mj_pagetitleimg">
            <img src="images/page_title1.jpg" alt="">
            <div class="mj_mainheading_overlay"></div>
        </div>
        <div class="mj_pagetitle_inner">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="mj_mainheading">
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                    <div class="mj_joblogo">
                                        <img id="CompanyLogo" runat="server"  class="img-responsive" alt="" style="width:263px; height:263px">
                                    </div>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                    <div class="mj_pageheading mj_toppadder50">
                                        <h1 runat="server" id="JobTitle"></h1>
                                        <ul>
                                            <li>
                                                <label>
                                                    <i class="fa fa-map-marker"></i>
                                                </label>
                                                <a href="#" id="CityName" runat="server"></a>
                                            </li>
                                            <li>
                                                <asp:LinkButton ID="linkTypesJobsDescription" runat="server"></asp:LinkButton>
                                            </li>
                                            <li>
                                                <label>Company:</label><a href="#" id="CompanyName" runat="server">SABC.</a>
                                            </li>
                                            <li>
                                                <label>Classification:</label><a href="#" id="JobTitleDet" runat="server">Financial Manager</a>
                                            </li>

                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="mj_lightgraytbg mj_bottompadder80">
        <div class="container">
            <div class="row">
                <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 col-lg-offset-3 col-md-offset-3">
                    <div class="mj_social_media_section mj_toppadder40 mj_bottompadder40">
                        <ul>
                            <li>
                                <asp:LinkButton ID="linkApplyNow" runat="server" CssClass="mj_mainbtn mj_btnblue" data-text="Apply Now" OnClick="linkApplyNow_Click" >Apply Now</asp:LinkButton>
                            </li>
                            <li><asp:Label ID="lblMsg" runat="server" Text="" CssClass="validator"></asp:Label></li>

                        </ul>

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
                                    <div class="mj_detaildiv" >
                                        <p id="JobOpportunitiesDescription" runat="server"></p>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mj_toppadder30 mj_bottompadder30">
                                    <div class="mj_divider"></div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                    <label>Requirements</label>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
                                    <div class="mj_detaildiv">
                                        <p id="JobOpportunitiesRequirements" runat="server"></p>
                                    </div>
                                </div>

                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mj_toppadder30 mj_bottompadder30">
                                    <div class="mj_divider"></div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                    <label>Special Features</label>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
                                    <div class="mj_detaildiv">
                                      <p id="JobOpportunitiesSpecialFeatures" runat="server"></p>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mj_toppadder30 mj_bottompadder30">
                                    <div class="mj_divider"></div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                    <label>Skills</label>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
                                    <div class="mj_detaildiv">
                                        <ul id="JobOpportunitiesSkills" runat="server">
                                           
                                        </ul>
                                    </div>
                                </div>

                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mj_toppadder30 mj_bottompadder30">
                                    <div class="mj_divider"></div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                    <label>Gender required</label>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
                                    <div class="mj_detaildiv">
                                        <p id="JobOpportunitiesGender" runat="server"></p>
                                       
                                    </div>
                                </div>

                                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mj_toppadder30 mj_bottompadder30">
                                    <div class="mj_divider"></div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                    <label>Working Hours</label>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
                                    <div class="mj_detaildiv">
                                        <p id="WorkingHours" runat="server"></p>
                                    </div>
                                </div>


                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mj_toppadder30 mj_bottompadder30">
                                    <div class="mj_divider"></div>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                                    <label>Expected Salary</label>
                                </div>
                                <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
                                    <div class="mj_detaildiv">
                                        <p id="ExpectedSalary" runat="server"></p>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mj_bottompadder30">
                    <div class="mj_about_section mj_toppadder80 mj_bottompadder80">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-lg-offset-3 col-md-offset-3">
                                <h1>A<span>bout</span> <span id="CoName" runat="server"></span></h1>
                                <p id="CompanyAbout" runat="server"></p>
                                <ul>
                                    <li><a id="Website" runat="server" href=""><i class="fa fa-link"></i>Website</a>
                                    </li>
                                    <li><a id="Twitter" runat="server" href="#"><i class="fa fa-twitter"></i>Twitter</a>
                                    </li>
                                    <li><a id="Facebook" runat="server" href="#"><i class="fa fa-facebook"></i>facebook</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
