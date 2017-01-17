<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageJobs.aspx.cs" Inherits="StudentServices.ManageJobs" %>

<%@ Register Src="~/PopupWin.ascx" TagPrefix="uc1" TagName="PopupWin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="mj_lightgraytbg mj_resumepreview mj_toppadder80 mj_bottompadder80">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-lg-offset-3 col-md-offset-3">
                    <div class="mj_resume_heading">
                        <img src="images/info.jpg" class="img-responsive" alt="" width="180" height="180">
                        <h1>M<span>uthana</span> A<span>qlan</span></h1>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="clearfix"></div>
                <div class="form-grid form-group">
                    <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" DataSourceID="SDSJobs" CssClass="mGrid">
                        <Columns>
                            <asp:BoundField DataField="CompanyNameEn" HeaderText="CompanyNameEn" SortExpression="CompanyNameEn"></asp:BoundField>
                            <asp:BoundField DataField="JobTitle" HeaderText="JobTitle" SortExpression="JobTitle"></asp:BoundField>
                            <asp:BoundField DataField="JobOpportunitiesDate" HeaderText="JobOpportunitiesDate" SortExpression="JobOpportunitiesDate"></asp:BoundField>
                            <asp:BoundField DataField="JobOpportunitiesStatus" HeaderText="JobOpportunitiesStatus" ReadOnly="True" SortExpression="JobOpportunitiesStatus"></asp:BoundField>
                            <asp:BoundField DataField="StudentName" HeaderText="StudentName" SortExpression="StudentName"></asp:BoundField>
                            <asp:BoundField DataField="CityNameEn" HeaderText="CityNameEn" SortExpression="CityNameEn"></asp:BoundField>
                            <asp:BoundField DataField="Status" HeaderText="Status" ReadOnly="True" SortExpression="Status"></asp:BoundField>
                            <asp:BoundField DataField="StudentId" HeaderText="StudentId" SortExpression="StudentId" Visible="False"></asp:BoundField>
                            <asp:TemplateField HeaderText="Actions">

                                <ItemTemplate>
                                    <img alt="View" src="../images/find.png" class="iconBtn popup-trigger" />
                                    <img alt="Active" src="../images/active.png" class="iconBtn popup-trigger" />
                                    <img alt="Stop" src="../images/stop.png" class="iconBtn popup-trigger" />
                                    <img alt="Send Mail" src="../images/email.png" class="iconBtn popup-trigger" />
                                </ItemTemplate>
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SDSJobs" runat="server" ConnectionString='<%$ ConnectionStrings:StudentHubConnectionString %>' SelectCommand="SELECT Companies.CompanyNameEn, JobOpportunities.JobTitle, JobOpportunities.JobOpportunitiesDate, CASE JobOpportunities.JobOpportunitiesStatus WHEN 1 THEN 'Open' ELSE 'Colse' END AS JobOpportunitiesStatus, Students.StudentName, Cities.CityNameEn, 'Review' AS Status, StudentJobOpportunities.StudentId FROM JobOpportunities INNER JOIN StudentJobOpportunities ON JobOpportunities.JobOpportunitiesId = StudentJobOpportunities.JobOpportunitiesId INNER JOIN Students ON StudentJobOpportunities.StudentId = Students.StudentId INNER JOIN Cities ON JobOpportunities.CityId = Cities.CityId INNER JOIN Companies ON JobOpportunities.CompanyId = Companies.CompanyId WHERE (StudentJobOpportunities.StudentId = 1)"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
    <uc1:PopupWin runat="server" ID="PopupWin" />
</asp:Content>
