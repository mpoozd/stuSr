<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/MainPage.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="StudentServices.ControlPanel.Orders" %>


<%@ Register Src="~/ControlPanel/PopupWindows.ascx" TagPrefix="uc1" TagName="PopupWindows" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0  topUp">
            <div class="mj_mainheading mj_bottompadder50">
                <h1>o<span>rders</span></h1>
                <p id="ContentAlert" runat="server" class="content_error"></p>
            </div>
        </div>
    </div>
    <div class="row">
        <asp:GridView ID="gv" runat="server" CssClass="mGrid" AutoGenerateColumns="False" DataKeyNames="JobOpportunitiesId" DataSourceID="SqlOrders">
            <Columns>
                <asp:BoundField DataField="CompanyNameEn" HeaderText="Company Name" SortExpression="CompanyNameEn" />
                <asp:BoundField DataField="PackageTitleEn" HeaderText="Package" SortExpression="PackageTitleEn" />
                <asp:BoundField DataField="JobTitle" HeaderText="JobTitle" SortExpression="JobTitle" />
                <asp:BoundField DataField="CityNameEn" HeaderText="City" SortExpression="CityId" />
                <asp:BoundField DataField="JobOpportunitiesDate" HeaderText="Date" SortExpression="JobOpportunitiesDate" />
                <asp:BoundField DataField="OrderStatus" HeaderText="Status" SortExpression="JobOpportunitiesStatus" />
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

        <asp:SqlDataSource ID="SqlOrders" runat="server" ConnectionString="<%$ ConnectionStrings:StudentHubConnectionString %>" SelectCommand="SELECT JobOpportunities.JobOpportunitiesId, JobOpportunities.JobOpportunitiesStatus, JobOpportunities.JobOpportunitiesDate, JobOpportunities.JobTitle, JobOpportunities.CityId, Packages.PackageTitleEn, Companies.CompanyNameEn, Cities.CityNameEn, Case JobOpportunities.JobOpportunitiesStatus when 1 then 'New' else 'New' end  OrderStatus FROM JobOpportunities INNER JOIN Companies ON JobOpportunities.CompanyId = Companies.CompanyId INNER JOIN Packages ON JobOpportunities.PackageId = Packages.PackageId INNER JOIN Cities ON JobOpportunities.CityId = Cities.CityId"></asp:SqlDataSource>
    </div>

    <uc1:PopupWindows runat="server" ID="PopupWindows" />


</asp:Content>

