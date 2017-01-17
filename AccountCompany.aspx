<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AccountCompany.aspx.cs" Inherits="StudentServices.AccountCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mj_lightgraytbg mj_bottompadder80">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0">
                   <div class="mj_resume_heading" style="margin-top:50px">
                        <img id="CompanyLogo" runat="server" src="" class="img-responsive" alt="" width="180" height="180">
                        <h1><span id="name" runat="server"></span> c<span>ompany</span></h1>

                    </div>
                </div>
            </div>

            

            <div class="row">
                <div class="col-lg-6 col-md-6 col-lg-offset-3 col-md-offset-3 col-sm-12 col-xs-12">
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
                                  
                                    <div class="form-group" style="margin-bottom: 20px">
                                        <asp:TextBox ID="txtCompanyOfficialCommunication" runat="server" placeholder="Company Official Communication" CssClass="form-control"></asp:TextBox>
                                    </div>

                                    <div class="form-group" style="margin-bottom: 20px">
                                        <asp:TextBox ID="txtCompanyEmailOfficialCommunication" runat="server" placeholder="Company Name" CssClass="form-control"></asp:TextBox>
                                    </div>

                                    <div class="form-group" style="margin-bottom: 20px">
                                        <asp:TextBox ID="txtCompanyMobileOfficialCommunication" runat="server" placeholder="Company Name" CssClass="form-control"></asp:TextBox>
                                    </div>

                                    <div class="form-group" style="margin-bottom: 20px">
                                        <asp:TextBox ID="txtSocialMediaLinkedin" runat="server" placeholder="Social Media Linkedin" CssClass="form-control"></asp:TextBox>
                                    </div>

                                    <div class="form-group" style="margin-bottom: 20px">
                                        <asp:TextBox ID="txtSocialMediaTwitter" runat="server" placeholder="Social Media Twitter" CssClass="form-control"></asp:TextBox>
                                    </div>

                                    <div class="form-group" style="margin-bottom: 20px">
                                        <asp:TextBox ID="txtSocialMediaFacebook" runat="server" placeholder="Social Media Facebook" CssClass="form-control"></asp:TextBox>
                                    </div>

                                    <div class="form-group" style="margin-bottom: 20px">
                                        <asp:TextBox ID="txtCompanyWebsit" runat="server" placeholder="Social Media Websit" CssClass="form-control"></asp:TextBox>
                                    </div>

                                    <div class="form-group" style="margin-bottom: 20px">
                                        <asp:TextBox ID="txtCompanyAbout" runat="server" placeholder="Company About" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                    </div>

                                    <div class="form-group" style="margin-bottom: 20px">
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
                                    <asp:LinkButton ID="btnAddCompany" runat="server" ValidationGroup="SignupCompany">Update</asp:LinkButton>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
