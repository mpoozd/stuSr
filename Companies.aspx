<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Companies.aspx.cs" Inherits="StudentServices.Companies" EnableEventValidation="false" %>

<%@ Register Src="~/ControlPanel/PopupWindows.ascx" TagPrefix="uc1" TagName="PopupWindows" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        fa-heart:hover {
            color: #0f101b;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mj_pagetitle">
        <img src="images/page_title3.jpg" alt="">
        <div class="mj_mainheading_overlay"></div>
        <div class="mj_pagetitle_inner">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="mj_mainheading mj_toppadder80 mj_bottompadder80">
                            <h1>c<span>ompany</span> d<span>irectory</span></h1>
                            <%--<p>Orem ipsum dolor consectetuer.</p>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="mj_lightgraytbg mj_toppadder80 mj_bottompadder80">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="mj_tabs mj_bottompadder50">
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="recentjobs">
                                <div class="mj_tabcontent mj_toppadder30">
                                    <table class="table table-striped">
                                        <asp:Repeater ID="RepeaterRecentJobs" runat="server" DataSourceID="sqlGetRecentJobs">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <%--<a href="#"><i class="fa fa-heart"></i></a>--%>
                                                    </td>
                                                    <td>
                                                        <a href="#">
                                                            <img runat="server" id="imgLogo" src='<%# Bind("CompanyLogo") %>' class="img-responsive" alt="" width="70" height="70">
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <h4 style="margin-top: 10px">
                                                            <asp:LinkButton ID="linkJobTitle" runat="server" Text='<%# Bind("CompanyNameEn") %>'></asp:LinkButton></h4>

                                                    </td>
                                                    <td>

                                                        <i class="fa fa-folder-open" style="color:#337ab7"></i>
                                                        <p style="margin-top: -22px">
                                                            <asp:Label ID="lblCityName" runat="server" Text='<%# Bind("CountJobs") %>' Font-Size="16px" ForeColor="#337ab7"></asp:Label>
                                                        </p>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="LinkTypesJobsDescription" runat="server" CssClass="mj_btn mj_orangebtn" Text="See Jobs" PostBackUrl='<%# Bind("Url") %>'></asp:LinkButton>
                                                    </td>
                                                    <td><span style="margin-top: -30px">

                                                        <div class="mj_social_media_section">
                                                            <p>
                                                                <a href="#"><i class="fa fa-heart" style="color: #f73838"></i></a>
                                                            </p>
                                                            <p>
                                                                <a id="SocialMediaLinkedin" runat="server" href='<%# Bind("SocialMediaLinkedin") %>' target="_blank"><i class="fa fa-linkedin" style="color: #287bbc"></i></a>
                                                            </p>
                                                            <p>
                                                                <a id="SocialMediaFacebook" runat="server" href='<%# Bind("SocialMediaFacebook") %>' target="_blank"><i class="fa fa-facebook" style="color: #365899"></i></a>
                                                            </p>
                                                            <p>
                                                                <a id="SocialMediaTwitter" runat="server" href='<%# Bind("SocialMediaTwitter") %>' target="_blank"><i class="fa fa-twitter" style="color: #1da1f2"></i></a>
                                                            </p>

                                                            <p>
                                                                <a href="#"><i class="fa fa-comment" data-toggle="modal" data-target="#myComments"></i></a>
                                                            </p>


                                                        </div></td>

                                                    <td></td>

                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </table>
                                    <asp:SqlDataSource ID="sqlGetRecentJobs" runat="server" ConnectionString='<%$ ConnectionStrings:StudentHubConnectionString %>' SelectCommand="SELECT Companies.CompanyId, Companies.CompanyNameAr, Companies.CompanyNameEn, Companies.CompanyUserName, Companies.CompanyPassword, Companies.CompanyOfficialCommunication, Companies.CompanyEmailOfficialCommunication, Companies.CompanyMobileOfficialCommunication, Companies.CompanyActivity, Companies.CompanyStatus, 'Upload/' + Companies.CompanyLogo AS CompanyLogo, Companies.CompanyAbout, Companies.SocialMediaLinkedin, Companies.SocialMediaTwitter, Companies.SocialMediaFacebook, Companies.CompanyWebsit, 'Jobs.aspx?CompanyId=' + CONVERT (varchar, Companies.CompanyId) AS Url, V_CountJobsCompany.CountJobs FROM Companies INNER JOIN V_CountJobsCompany ON Companies.CompanyId = V_CountJobsCompany.CompanyId"></asp:SqlDataSource>

                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Login -->
    <div class="modal fade mj_popupdesign" id="myComments" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel2">Add Commenting on the company</h4>
                </div>
                <div class="modal-body">
                    <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">
                        <div class="row">
                            <div class="mj_pricingtable mj_greentable mj_login_form_wrapper">
                                <div class="mj_login_form">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtComment" runat="server" placeholder="Add comment Here .." CssClass="form-control tr_textarea" TextMode="MultiLine" Height="100px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvCommment" runat="server" ErrorMessage="Please Enter Comment" CssClass="validator" ValidationGroup="Comments" ControlToValidate="txtComment"></asp:RequiredFieldValidator>
                                        <div class="clearfix"></div>
                                    </div>

                                </div>
                                <div class="mj_pricing_footer">
                                    <asp:LinkButton ID="btnLogin" runat="server" ValidationGroup="Comments">Send</asp:LinkButton>
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
    <!-- End Login -->
</asp:Content>
