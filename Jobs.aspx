<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Jobs.aspx.cs" Inherits="StudentServices.Jobs" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="mj_mapmarker">
        <div style="height: 30px; width: 100%; margin-top: 200px"></div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="mj_top_searchbox">
                        <div class="col-lg-4 col-md-3 col-sm-3 col-xs-12">
                            <div class="form-group">
                                <asp:TextBox ID="txtContentText" CssClass="form-control" runat="server" placeholder="Jobs Title"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                            <asp:SqlDataSource ID="SqlCites" runat="server" ConnectionString='<%$ ConnectionStrings:StudentHubConnectionString %>' SelectCommand="SELECT [CityId], [CityNameEn] FROM [Cities]"></asp:SqlDataSource>
                            <asp:DropDownList CssClass="custom-select" ID="ddlCites" runat="server" DataSourceID="SqlCites" DataTextField="CityNameEn" DataValueField="CityId" AppendDataBoundItems="True">
                                <asp:ListItem Value="0">All Cites</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                            <asp:DropDownList ID="ddlGender" runat="server" CssClass="custom-select">
                                <asp:ListItem Value="1">All Gender</asp:ListItem>
                                <asp:ListItem Value="2">Male</asp:ListItem>
                                <asp:ListItem Value="3">Famle</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-lg-2 col-md-3 col-sm-3 col-xs-12">
                            <asp:LinkButton ID="btnSearch" runat="server" OnClick="btnSearch_Click" CssClass="mj_mainbtn mj_btnyellow" data-text="Search">Search</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="mj_filter_section">
        <div class="container">
            <div class="row">

                <div class="mj_check_filter">
                    <div class="form-inline">
                        <asp:SqlDataSource ID="SqlGetTypesJobs" runat="server" ConnectionString='<%$ ConnectionStrings:StudentHubConnectionString %>' SelectCommand="SELECT [TypesJobsId], [TypesJobsDescriptionEn] FROM [TypesJobs]"></asp:SqlDataSource>
                        <asp:CheckBoxList ID="cblTypesJobs" runat="server" DataSourceID="SqlGetTypesJobs" DataTextField="TypesJobsDescriptionEn" DataValueField="TypesJobsId" RepeatDirection="Horizontal"></asp:CheckBoxList>
                    </div>
                </div>
                <div class="mj_jobinfo">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                        <div class="row">
                            <div class="mj_showjob">
                                <p>showing (<strong id="CountRowRuselt" runat="server"></strong>) job offers</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                        <div class="row">
                            <div class="mj_rss_feed">
                                <p>
                                    RSS <i class="fa fa-rss"></i>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mj_tabcontent mj_bottompadder80">
                    <asp:GridView ID="GridView1" runat="server"></asp:GridView>
                    <table class="table table-striped">
                        <asp:Repeater ID="RepeaterJobs" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><a href="#"><i class="fa fa-heart"></i></a>
                                    </td>
                                    <td>
                                        <a href="#">
                                            <img runat="server" id="imgLogo" src='<%# Bind("CompanyLogo") %>' class="img-responsive" alt="" width="70" height="70">
                                        </a>
                                    </td>
                                    <td>
                                        <h4>
                                            <asp:LinkButton ID="linkJobTitle" runat="server" Text='<%# Bind("JobTitle") %>' PostBackUrl='<%# Bind("URL") %>'></asp:LinkButton></h4>
                                        <p style="margin-top: -22px">
                                            <asp:Label ID="lblCompanyName" runat="server" Text='<%# Bind("CompanyNameEn") %>' Font-Size="14px" ForeColor="#959595"></asp:Label>
                                        </p>
                                    </td>
                                    <td>
                                        <i class="fa fa-map-marker"></i>
                                        <p style="margin-top: -22px">
                                            <asp:Label ID="lblCityName" runat="server" Text='<%# Bind("CityNameEn") %>' Font-Size="16px" ForeColor="#959595"></asp:Label>
                                        </p>
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="LinkTypesJobsDescription" runat="server" CssClass='<%# Bind("TypesJobsTheme") %>' Text='<%# Bind("TypesJobsDescriptionEn") %>' PostBackUrl='<%# Bind("URL") %>'></asp:LinkButton>
                                    </td>
                                    <td><span style="margin-top: -22px">
                                        <asp:Label ID="lblSalary" runat="server" Text='<%# Bind("Salary") %>'></asp:Label></span>
                                    </td>

                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-lg-offset-4 col-md-offset-4">
                        <div class="mj_showmore"><a href="#" class="mj_showmorebtn mj_blackbtn">Show More</a> </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
