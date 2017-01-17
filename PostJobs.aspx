<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PostJobs.aspx.cs" Inherits="StudentServices.PostJobs" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="mj_lightgraytbg mj_resumepreview mj_toppadder80 mj_bottompadder80">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-lg-offset-3 col-md-offset-3">
                    <div class="mj_resume_heading">
                        <h1>p<span>ost A </span>j<span>ob</span></h1>
                    </div>
                </div>
            </div>

            <div class="row" style="margin-top: 150px;">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="mj_top_searchbox">

                        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                            <asp:DropDownList ID="ddlJobs" runat="server" CssClass="custom-select" DataSourceID="SqlGetJob" DataTextField="PackageTitleEn" DataValueField="PackageId">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlGetJob" runat="server" ConnectionString='<%$ ConnectionStrings:StudentHubConnectionString %>' SelectCommand="SELECT [PackageId], [PackageTitleEn] FROM [Packages]"></asp:SqlDataSource>
                        </div>
                        <div class="col-lg-4 col-md-5 col-sm-5 col-xs-12">
                            <asp:LinkButton ID="btnSearch" runat="server" CssClass="mj_mainbtn mj_btnyellow" data-text="Select Your Package">Select Your Package</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row" style="margin-top: 30px;">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="mj_postdiv mj_shadow_blue mj_postpage mj_toppadder50 mj_bottompadder50">
                        <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">


                            <div class="form-group">
                                <label>Overview</label>
                                <asp:TextBox ID="txtStudentOverview" runat="server" CssClass="form-control" TextMode="MultiLine" Height="150px"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label>Requirements</label>
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="MultiLine" Height="150px"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label>Special Features</label>
                                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="MultiLine" Height="150px"></asp:TextBox>
                            </div>


                            <div class="form-group">
                                <label>Skills</label>
                                <asp:CheckBoxList ID="cblSkills" runat="server" RepeatDirection="Horizontal" DataSourceID="SqlSkills" DataTextField="SkillsDescriptionEn" DataValueField="SkillsId"></asp:CheckBoxList>
                                <asp:SqlDataSource ID="SqlSkills" runat="server" ConnectionString='<%$ ConnectionStrings:StudentHubConnectionString %>' SelectCommand="SELECT [SkillsId], [SkillsDescriptionEn] FROM [Skills]"></asp:SqlDataSource>
                            </div>

                            <div class="form-group">
                                <label>Interests</label>
                                <asp:CheckBoxList CssClass="cbl" ID="cblInterests" runat="server" RepeatDirection="Horizontal" DataSourceID="SqlInterests" DataTextField="InterestsDescriptionEn" DataValueField="InterestsId"></asp:CheckBoxList>
                                <asp:SqlDataSource ID="SqlInterests" runat="server" ConnectionString='<%$ ConnectionStrings:StudentHubConnectionString %>' SelectCommand="SELECT [InterestsId], [InterestsDescriptionEn] FROM [Interests]"></asp:SqlDataSource>
                            </div>

                            
                            <div class="form-group">
                                <label>Types Jobs</label>
                                <asp:CheckBoxList CssClass="cbl" ID="CheckBoxList1" runat="server" RepeatDirection="Horizontal" DataSourceID="SqlTypesJobs" DataTextField="TypesJobsDescriptionEn" DataValueField="TypesJobsId"></asp:CheckBoxList>
                                <asp:SqlDataSource ID="SqlTypesJobs" runat="server" ConnectionString='<%$ ConnectionStrings:StudentHubConnectionString %>' SelectCommand="SELECT [TypesJobsId], [TypesJobsDescriptionEn] FROM [TypesJobs]"></asp:SqlDataSource>
                            </div>

                            <div class="form-group">
                                <label>City</label>
                                <asp:CheckBoxList CssClass="cbl" ID="CheckBoxList2" runat="server" RepeatDirection="Horizontal" DataSourceID="SqlCity" DataTextField="CityNameEn" DataValueField="CityId"></asp:CheckBoxList>
                                <asp:SqlDataSource ID="SqlCity" runat="server" ConnectionString='<%$ ConnectionStrings:StudentHubConnectionString %>' SelectCommand="SELECT [CityId], [CityNameEn] FROM [Cities]"></asp:SqlDataSource>
                            </div>


                        </div>
                    </div>
                    <div class="mj_showmore">
                        <asp:LinkButton ID="btnSave" runat="server" CssClass="mj_showmorebtn mj_bigbtn mj_bluebtn">Save</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
