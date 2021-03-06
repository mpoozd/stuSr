﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProfileCompany.aspx.cs" Inherits="StudentServices.ProfileCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="mj_lightgraytbg mj_resumepreview mj_toppadder80 mj_bottompadder80">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-lg-offset-3 col-md-offset-3">
                    <div class="mj_resume_heading">
                        <img src="images/logo1.png" class="img-responsive" alt="" width="180" height="180">
                        <h1>a<span>ramco</span> c<span>ompany</span></h1>

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
                                        <asp:TextBox ID="txtCoName" runat="server" placeholder="Name User Contact English" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox1" runat="server" placeholder="Name User Contact Arabic" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Enter Name" CssClass="validator" ValidationGroup="SignupCompany" ControlToValidate="txtCoName"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox3" runat="server" placeholder="Email User Contact Arabic" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Name" CssClass="validator" ValidationGroup="SignupCompany" ControlToValidate="txtCoName"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="TextBox4" runat="server" placeholder="Mobile User Contact Arabic" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please Enter Name" CssClass="validator" ValidationGroup="SignupCompany" ControlToValidate="txtCoName"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="form-group">
                                        <asp:TextBox ID="txtCompanyName" runat="server" placeholder="Company Name English" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Company Name" CssClass="validator" ValidationGroup="SignupCompany" ControlToValidate="txtCompanyName"></asp:RequiredFieldValidator>
                                    </div>
                                     <div class="form-group">
                                        <asp:TextBox ID="TextBox2" runat="server" placeholder="Company Name Arabic" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtCoEmail" runat="server" placeholder="Email Address" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Email Address" CssClass="validator" ValidationGroup="SignupCompany" ControlToValidate="txtCoEmail"></asp:RequiredFieldValidator>
                                    </div>
                                  
                                    <div class="clearfix"></div>
                                    <div class="form-group mj_toppadder20" style="text-align:left">
                                        <div class="mj_checkbox">
                                            <input type="checkbox" value="1" id="check1" name="checkbox">
                                            <label for="check1"></label>
                                        </div>
                                        <span >Stauts</span>
                                    </div>
                                </div>
                                <div class="mj_pricing_footer">
                                    <%--<a href="#">Get Started Now!</a>--%>
                                    <asp:LinkButton ID="btnRegCompany" runat="server" ValidationGroup="SignupCompany">Save</asp:LinkButton>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
