<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="StudentServices.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="mj_lightgraytbg mj_bottompadder80">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0">
                    <div class="mj_mainheading mj_toppadder80 mj_bottompadder50">
                        <h1>c<span>hange</span> <span>to my</span> p<span>assword</span></h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-md-6 col-lg-offset-3 col-md-offset-3 col-sm-12 col-xs-12">
                    <div class="mj_pricingtable mj_greentable mj_login_form_wrapper">
                        <div class="mj_login_form">
                            <div class="form-group" style="margin-bottom:20px">
                                <input type="password" placeholder="Your Old Password" id="uname" class="form-control">
                            </div>
                            <div class="form-group" style="margin-bottom:20px">
                                <input type="password" placeholder="Your New Password" id="upassword" class="form-control">
                            </div>
                             <div class="form-group" style="margin-bottom:20px">
                                <input type="password" placeholder="Confirm New Password" id="upassword" class="form-control">
                            </div>
                            
                        </div>
                        <div class="mj_pricing_footer">
                            <a href="#">login Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
