<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JobsCompany.aspx.cs" Inherits="StudentServices.JobsCompany"  EnableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mj_lightgraytbg mj_resumepreview mj_toppadder80 mj_bottompadder80">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-lg-offset-3 col-md-offset-3">
                    <div class="mj_resume_heading">
                        <h1>m<span>anage </span>j<span>obs</span></h1>
                    </div>
                </div>
            </div>

            <div class="row" style="margin-top:150px;">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="mj_top_searchbox">
                        
                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                            <asp:DropDownList ID="ddlJobs" runat="server" CssClass="custom-select" DataSourceID="SqlGetJob" DataTextField="JobTitle" DataValueField="JobOpportunitiesId">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlGetJob" runat="server" ConnectionString='<%$ ConnectionStrings:StudentHubConnectionString %>' SelectCommand="SELECT [JobOpportunitiesId], [JobTitle] FROM [JobOpportunities]"></asp:SqlDataSource>
                        </div>
                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12">
                            <asp:LinkButton ID="btnSearch" runat="server" CssClass="mj_mainbtn mj_btnyellow" data-text="View">View</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="clearfix"></div>
                <div class="form-grid form-group">


                    <asp:GridView ID="gv" runat="server" CssClass="mGrid" AutoGenerateColumns="False" DataSourceID="SDSJobs">
                        <Columns>
                            <asp:BoundField DataField="JobTitle" HeaderText="Job Title" SortExpression="JobTitle"></asp:BoundField>
                            <asp:BoundField DataField="StudentName" HeaderText="Student" SortExpression="StudentName"></asp:BoundField>
                            <asp:BoundField DataField="StudentEmail" HeaderText="Email" SortExpression="StudentEmail"></asp:BoundField>
                            <asp:BoundField DataField="StudentMobile" HeaderText="Mobile" SortExpression="StudentMobile"></asp:BoundField>
                            <asp:BoundField DataField="UniversitiesNameEn" HeaderText="University" SortExpression="UniversitiesNameEn"></asp:BoundField>
                            <asp:BoundField DataField="CollegesNameEn" HeaderText="College" SortExpression="CollegesNameEn"></asp:BoundField>
                            <asp:BoundField DataField="SpecialtiesNameEn" HeaderText="Specialty" SortExpression="SpecialtiesNameEn"></asp:BoundField>
                            <asp:BoundField DataField="JobOpportunitiesStatus" HeaderText="JobOpportunitiesStatus" SortExpression="JobOpportunitiesStatus" Visible="False"></asp:BoundField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <img alt="View" src="../images/find.png" class="iconBtn popup-trigger" />
                                    <img alt="Send Mail" src="../images/email.png" class="iconBtn popup-trigger" />
                                </ItemTemplate>

                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SDSJobs" runat="server" ConnectionString='<%$ ConnectionStrings:StudentHubConnectionString %>' SelectCommand="SELECT Students.StudentName, Students.StudentEmail, Students.StudentMobile, Universities.UniversitiesNameEn, Specialties.SpecialtiesNameEn, Colleges.CollegesNameEn, JobOpportunities.JobTitle, JobOpportunities.JobOpportunitiesStatus, JobOpportunities.JobOpportunitiesId FROM JobOpportunities INNER JOIN StudentJobOpportunities ON JobOpportunities.JobOpportunitiesId = StudentJobOpportunities.JobOpportunitiesId INNER JOIN Students ON StudentJobOpportunities.StudentId = Students.StudentId INNER JOIN Cities ON Students.CityId = Cities.CityId INNER JOIN Universities ON Students.UniversitiesId = Universities.UniversitiesId INNER JOIN Colleges ON Students.CollegesId = Colleges.CollegesId INNER JOIN Specialties ON Students.SpecialtiesId = Specialties.SpecialtiesId WHERE (JobOpportunities.JobOpportunitiesId = @JobOpportunitiesId)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlJobs" PropertyName="SelectedValue" Name="JobOpportunitiesId"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
