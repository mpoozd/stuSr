<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/MainPage.Master" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="StudentServices.ControlPanel.Students" %>


<%@ Register Src="~/ControlPanel/PopupWindows.ascx" TagPrefix="uc1" TagName="PopupWindows" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row">
        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0  topUp">
            <div class="mj_mainheading mj_bottompadder50">
                <h1>s<span>tudents</span></h1>
                <p id="ContentAlert" runat="server" class="content_error"></p>
            </div>
        </div>
    </div>

    <div class="row">
        <asp:GridView ID="gv" runat="server" CssClass="mGrid" AutoGenerateColumns="False" DataKeyNames="StudentId" DataSourceID="SqlStudents">
            <Columns>
                <asp:BoundField DataField="StudentId" HeaderText="StudentId" InsertVisible="False" ReadOnly="True" SortExpression="StudentId" />
                <asp:BoundField DataField="StudentName" HeaderText="StudentName" SortExpression="StudentName" />
                <asp:BoundField DataField="StudentEmail" HeaderText="StudentEmail" SortExpression="StudentEmail" />
                <asp:BoundField DataField="StudentMobile" HeaderText="StudentMobile" SortExpression="StudentMobile" />
                <asp:BoundField DataField="UniversitiesNameEn" HeaderText="UniversitiesNameEn" SortExpression="UniversitiesNameEn" />
                <asp:BoundField DataField="CollegesNameEn" HeaderText="CollegesNameEn" SortExpression="CollegesNameEn" />
                <asp:TemplateField HeaderText="Jobs">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Comments">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Complaints">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
                    </ItemTemplate>

                </asp:TemplateField>
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

        <asp:SqlDataSource ID="SqlStudents" runat="server" ConnectionString="<%$ ConnectionStrings:StudentHubConnectionString %>" SelectCommand="SELECT Students.StudentId, Students.StudentName, Students.StudentEmail, Universities.UniversitiesNameEn, Colleges.CollegesNameEn, Students.StudentMobile FROM Students INNER JOIN Colleges ON Students.CollegesId = Colleges.CollegesId INNER JOIN Universities ON Students.UniversitiesId = Universities.UniversitiesId"></asp:SqlDataSource>
    </div>
    <uc1:PopupWindows runat="server" ID="PopupWindows" />

</asp:Content>
