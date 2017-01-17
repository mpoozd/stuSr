<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/MainPage.Master" AutoEventWireup="true" CodeBehind="Colleges.aspx.cs" Inherits="StudentServices.ControlPanel.Colleges" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:HiddenField ID="hfKeyValue" runat="server" Value="0" />
    <asp:HiddenField ID="hfEventStatus" runat="server" Value="1" />

    <div class="row">
        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0  topUp">
            <div class="mj_mainheading mj_bottompadder50">
                <h1>c<span>olleges</span></h1>
                <p id="ContentAlert" runat="server" class="content_error"></p>
            </div>
        </div>
    </div>

    <div class="row" style="margin-top: 30px">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="mj_postdiv mj_shadow_yellow mj_postpage mj_toppadder50 mj_bottompadder50">
                <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">
                    <div class="form-group">
                        <label>University</label>
                        <asp:DropDownList ID="ddlUniversity" runat="server" CssClass="custom-select" AppendDataBoundItems="True" DataSourceID="SqlUniversity" DataTextField="UniversitiesNameEn" DataValueField="UniversitiesId">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                        <div class="clearfix"></div>
                        <asp:RequiredFieldValidator ID="rfvUniversity" runat="server" ErrorMessage="Please Select University" CssClass="validator" InitialValue="0" ValidationGroup="Colleges" ControlToValidate="ddlUniversity"></asp:RequiredFieldValidator>


                    </div>
                    <div class="form-group">
                        <label>College Name</label>
                        <asp:TextBox ID="txtCollegesNameAr" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCollegesNameAr" runat="server" ErrorMessage="Please Enter Colleges Name" CssClass="validator" ValidationGroup="Colleges" ControlToValidate="txtCollegesNameAr"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>College Name Arabic</label>
                        <asp:TextBox ID="txtCollegesNameEn" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCollegesNameEn" runat="server" ErrorMessage="Please Enter Colleges Name Arabic" CssClass="validator" ValidationGroup="Colleges" ControlToValidate="txtCollegesNameEn"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="mj_yellowbtn button_cancel" BorderStyle="None" ValidationGroup="Colleges" OnClick="btnSave_Click" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="mj_yellowbtn button_cancel" BorderStyle="None" OnClick="btnCancel_Click" />
                    </div>

                </div>
            </div>

        </div>
        <div class="clearfix"></div>
        <div class="form-grid form-group">
            <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" DataKeyNames="CollegesId" DataSourceID="SqlGetColleges" CssClass="mGrid">
                <Columns>
                    <asp:BoundField DataField="UniversitiesId" HeaderText="UniversitiesId" SortExpression="UniversitiesId" Visible="False" />
                    <asp:BoundField DataField="CollegesId" HeaderText="CollegesId" SortExpression="CollegesId" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="CollegesNameAr" HeaderText="CollegesNameAr" SortExpression="CollegesNameAr" />
                    <asp:BoundField DataField="CollegesNameEn" HeaderText="CollegesNameEn" SortExpression="CollegesNameEn" />
                    <asp:BoundField DataField="UniversitiesNameEn" HeaderText="UniversitiesNameEn" SortExpression="UniversitiesNameEn" />
                    <asp:BoundField DataField="UniversitiesNameAr" HeaderText="UniversitiesNameAr" SortExpression="UniversitiesNameAr" />
                    <asp:TemplateField HeaderText="Setting">
                        <ItemTemplate>
                            <asp:ImageButton CssClass="iconBtn" ID="btnEdit" runat="server" CommandArgument='<%# bind("CollegesId") %>' ImageUrl="~/images/Edit.png" OnClick="btnEdit_Click" />
                            <asp:ImageButton CssClass="iconBtn" ID="btnDelete" runat="server" CommandArgument='<%# bind("CollegesId") %>' ImageUrl="~/images/Delete.png" OnClientClick="return confirm('Are you sure you want to delete this?')" OnClick="btnDelete_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlGetColleges" runat="server" ConnectionString="<%$ ConnectionStrings:StudentHubConnectionString %>" SelectCommand="SELECT Colleges.UniversitiesId, Colleges.CollegesId, Colleges.CollegesNameAr, Colleges.CollegesNameEn, Universities.UniversitiesNameEn, Universities.UniversitiesNameAr FROM Universities INNER JOIN Colleges ON Universities.UniversitiesId = Colleges.UniversitiesId"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlUniversity" runat="server" ConnectionString="<%$ ConnectionStrings:StudentHubConnectionString %>" SelectCommand="SELECT [UniversitiesId], [UniversitiesNameAr], [UniversitiesNameEn] FROM [Universities]"></asp:SqlDataSource>

    </div>
</asp:Content>

