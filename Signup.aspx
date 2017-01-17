<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="StudentServices.Signup" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="mj_transprentbg">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="row">
                        <div class="mj_signup_section mj_yellow_bg">
                            <div class="mj_mainheading mj_toppadder80 mj_bottompadder30">
                                <h1>I<span>'m</span> <span>employer look-ing to hire</span></h1>
                            </div>
                            <div class="mj_blog_btn">
                                <a href="#" class="mj_mainbtn mj_btnblack" data-text="hire" data-toggle="modal" data-target="#myModal"><span>hire</span></a>
                            </div>
                            <div class="mj_signup_section_img">
                                <img src="images/signup_bg1.png" class="img-responsive" alt="hire">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="row">
                        <div class="mj_signup_section mj_blue_bg">
                            <div class="mj_mainheading mj_toppadder80 mj_bottompadder30">
                                <h1>I<span>'m</span> <span>candidate looking for a job</span></h1>
                            </div>
                            <div class="mj_blog_btn">
                                <a href="#" class="mj_mainbtn mj_btnblack" data-text="work" data-toggle="modal" data-target="#myModal1"><span>work</span></a>
                            </div>
                            <div class="mj_signup_section_img">
                                <img src="images/signup_bg2.png" class="img-responsive" alt="job">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade mj_popupdesign" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">c<span>ompany</span> A<span>ccount</span></h4>
                </div>
                <div class="modal-body">
                    <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">
                        <div class="row">
                            <div class="mj_pricingtable mj_yellowtable mj_createaccount_form_wrapper">

                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane fade in active" id="company">
                                        <div class="mj_createaccount_form">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtCompanyNameEn" runat="server" placeholder="Name" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Company Name" CssClass="validator" ValidationGroup="SignupCompany" ControlToValidate="txtCompanyNameEn"></asp:RequiredFieldValidator>
                                            </div>

                                            <div class="form-group">
                                                <asp:TextBox ID="txtCompanyNameAr" runat="server" placeholder="Name" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Enter Company Name Arabic" CssClass="validator" ValidationGroup="SignupCompany" ControlToValidate="txtCompanyNameAr"></asp:RequiredFieldValidator>
                                            </div>

                                            <div class="form-group">
                                                <asp:TextBox ID="txtCompanyUserName" runat="server" placeholder="Company Name" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Username (Email)" CssClass="validator" ValidationGroup="SignupCompany" ControlToValidate="txtCompanyUserName"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group">
                                                <asp:TextBox ID="txtCompanyPassword" runat="server" placeholder="Password" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Enter Password" CssClass="validator" ValidationGroup="SignupCompany" ControlToValidate="txtCompanyPassword"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group" style="margin-bottom:20px">
                                                <asp:TextBox ID="txtCompanyOfficialCommunication" runat="server" placeholder="Company Official Communication" CssClass="form-control"></asp:TextBox>
                                            </div>

                                            <div class="form-group" style="margin-bottom:20px">
                                                <asp:TextBox ID="txtCompanyEmailOfficialCommunication" runat="server" placeholder="Company Name" CssClass="form-control"></asp:TextBox>
                                            </div>

                                             <div class="form-group" style="margin-bottom:20px">
                                                <asp:TextBox ID="txtCompanyMobileOfficialCommunication" runat="server" placeholder="Company Name" CssClass="form-control"></asp:TextBox>
                                            </div>

                                            <div class="form-group" style="margin-bottom:20px">
                                                <asp:TextBox ID="txtSocialMediaLinkedin" runat="server" placeholder="Social Media Linkedin" CssClass="form-control"></asp:TextBox>
                                            </div>

                                            <div class="form-group" style="margin-bottom:20px">
                                                <asp:TextBox ID="txtSocialMediaTwitter" runat="server" placeholder="Social Media Twitter" CssClass="form-control"></asp:TextBox>
                                            </div>

                                            <div class="form-group" style="margin-bottom:20px">
                                                <asp:TextBox ID="txtSocialMediaFacebook" runat="server" placeholder="Social Media Facebook" CssClass="form-control"></asp:TextBox>
                                            </div>

                                            <div class="form-group" style="margin-bottom:20px">
                                                <asp:TextBox ID="txtCompanyWebsit" runat="server" placeholder="Social Media Websit" CssClass="form-control"></asp:TextBox>
                                            </div>

                                            <div class="form-group" style="margin-bottom:20px">
                                                <asp:TextBox ID="txtCompanyAbout" runat="server" placeholder="Company About" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                            </div>

                                            <div class="form-group" style="margin-bottom:20px">
                                                <asp:FileUpload ID="fuCompanyLogo" runat="server" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter upload Logo" CssClass="validator" ValidationGroup="SignupCompany" ControlToValidate="fuCompanyLogo"></asp:RequiredFieldValidator>
                                            </div>




                                            <div class="clearfix"></div>
                                            <div class="form-group mj_toppadder20">
                                                <div class="mj_checkbox">
                                                    <input type="checkbox" value="1" id="check1" name="checkbox">
                                                    <label for="check1"></label>
                                                </div>
                                                <span>I have read, understand and agree to the meshjobs Terms of Service, including the <a href="#">User Agreement</a> and <a href="#">Privacy Policy</a>.</span>
                                            </div>
                                        </div>
                                        <div class="mj_pricing_footer">
                                            <%--<a href="#">Get Started Now!</a>--%>
                                            <asp:LinkButton ID="btnAddCompany" runat="server" ValidationGroup="SignupCompany" OnClick="btnAddCompany_Click">Get Started Now</asp:LinkButton>
                                        </div>
                                    </div>

                                </div>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <img src="images/close.png" alt="">
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade mj_popupdesign" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel1">s<span>tudent </span>A<span>ccount</span></h4>
                </div>

                <div class="modal-body">
                    <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">
                        <div class="row">
                            <div class="mj_pricingtable mj_bluetable mj_freelancer_form_wrapper">


                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane fade in active" id="freelancer">
                                        <div class="mj_freelancer_form">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtStudentName" runat="server" placeholder="Name" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvStudentName" runat="server" ErrorMessage="Please Enter Name" CssClass="validator" ValidationGroup="Signup" ControlToValidate="txtStudentName"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group">
                                                <asp:TextBox ID="txtStudentMobile" runat="server" placeholder="Mobile" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvStudentMobile" runat="server" ErrorMessage="Please Enter Mobile" CssClass="validator" ValidationGroup="Signup" ControlToValidate="txtStudentMobile"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group topUp">
                                                <asp:TextBox ID="txtStudentEmail" runat="server" placeholder="Username or email" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvStudentEmail" runat="server" ErrorMessage="Please Enter Email" CssClass="validator" ValidationGroup="Signup" ControlToValidate="txtStudentEmail"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Email is incorrect" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtStudentEmail" CssClass="validator"></asp:RegularExpressionValidator>
                                            </div>
                                            <div class="form-group">
                                                <asp:TextBox ID="txtStudentPassword" runat="server" placeholder="Password" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Please Enter Password" CssClass="validator" ValidationGroup="Signup" ControlToValidate="txtStudentPassword"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="form-group mj_toppadder20">
                                                <div class="mj_checkbox">
                                                    <input type="checkbox" value="1" id="check3" name="checkbox">
                                                    <label for="check3"></label>
                                                </div>
                                                <span>I have read, understand and agree to the meshjobs Terms of Service, including the <a href="#">User Agreement</a> and <a href="#">Privacy Policy</a>.</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="mj_pricing_footer">
                                    <asp:LinkButton ID="btnAddStudent" runat="server" ValidationGroup="Signup" OnClick="btnAddStudent_Click">Get Started Now!</asp:LinkButton>
                                </div>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <img src="images/close.png" alt="">
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--Model End-->
</asp:Content>
