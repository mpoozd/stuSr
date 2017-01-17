<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Notifications.aspx.cs" Inherits="StudentServices.Notifications" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="mj_lightgraytbg mj_resumepreview mj_toppadder80 mj_bottompadder80">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-lg-offset-3 col-md-offset-3">
                    <div class="mj_resume_heading">
                        <h1>N<span>otifications</span></h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="clearfix"></div>
                <div class="form-grid form-group">
                    <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" DataKeyNames="NotificationsId" DataSourceID="SDSNotifications" CssClass="mGrid" OnRowDataBound="gv_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="JobTitle" HeaderText="Job Title" SortExpression="JobTitle"></asp:BoundField>
                            <asp:BoundField DataField="JobOpportunitiesDescription" HeaderText="Job Description" SortExpression="JobOpportunitiesDescription"></asp:BoundField>
                            <asp:BoundField DataField="CompanyNameEn" HeaderText="Company" SortExpression="CompanyNameEn"></asp:BoundField>
                            <asp:BoundField DataField="CityNameEn" HeaderText="City" SortExpression="CityNameEn"></asp:BoundField>
                            <asp:BoundField DataField="NotificationsType" HeaderText="NotificationsType" SortExpression="NotificationsType" Visible="False"></asp:BoundField>
                            <asp:TemplateField HeaderText="NotificationsStatus" SortExpression="NotificationsStatus" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblNotificationsStatus" runat="server" Text='<%# Bind("NotificationsStatus") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="NotificationsId" HeaderText="NotificationsId" SortExpression="NotificationsId" InsertVisible="False" ReadOnly="True" Visible="False"></asp:BoundField>
                            <asp:BoundField DataField="JobOpportunitiesDate" HeaderText="Job Date" SortExpression="JobOpportunitiesDate"></asp:BoundField>
                            <asp:BoundField DataField="JobOpportunitiesStatus" HeaderText="JobOpportunitiesStatus" SortExpression="JobOpportunitiesStatus" Visible="False"></asp:BoundField>
                            <asp:BoundField DataField="StudentId" HeaderText="StudentId" SortExpression="StudentId" Visible="False"></asp:BoundField>
                            <asp:TemplateField HeaderText="View">
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnView" runat="server" ImageUrl="../images/find.png" CssClass="iconBtn popup-trigger" ToolTip="View" PostBackUrl="~/JobDetail.aspx" />
                                    <%--<img alt="View" src="../images/find.png" class="iconBtn popup-trigger" />--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SDSNotifications" runat="server" ConnectionString='<%$ ConnectionStrings:StudentHubConnectionString %>' SelectCommand="SELECT StudentsNotifications.NotificationsType, StudentsNotifications.NotificationsStatus, StudentsNotifications.NotificationsId, JobOpportunities.JobOpportunitiesDate, JobOpportunities.JobOpportunitiesStatus, JobOpportunities.JobOpportunitiesDescription, Cities.CityNameEn, Companies.CompanyNameEn, JobOpportunities.JobTitle, StudentsNotifications.StudentId FROM StudentsNotifications INNER JOIN JobOpportunities ON StudentsNotifications.JobOpportunitiesId = JobOpportunities.JobOpportunitiesId INNER JOIN Companies ON JobOpportunities.CompanyId = Companies.CompanyId INNER JOIN Cities ON JobOpportunities.CityId = Cities.CityId WHERE (StudentsNotifications.StudentId = 1)"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>




</asp:Content>
