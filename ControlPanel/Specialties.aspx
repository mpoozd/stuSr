<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/MainPage.Master" AutoEventWireup="true" CodeBehind="Specialties.aspx.cs" Inherits="StudentServices.ControlPanel.Specialties" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:HiddenField ID="hfKeyValue" runat="server" Value="0" />
    <asp:HiddenField ID="hfEventStatus" runat="server" Value="1" />
    <div class="row">
        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0  topUp">
            <div class="mj_mainheading mj_bottompadder50">
                <h1>s<span>pecialties</span></h1>
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
                        <asp:DropDownList ID="ddlUniversity" runat="server" CssClass="select-wrapper" DataSourceID="SqlUniversity" DataTextField="UniversitiesNameEn" DataValueField="UniversitiesId" AppendDataBoundItems="True" AutoPostBack="True" >
                            <asp:ListItem Value="0">Select </asp:ListItem>
                        </asp:DropDownList>
                        <div class="clearfix"></div>
                        <asp:RequiredFieldValidator ID="rfvUniversity" runat="server" ErrorMessage="Please Select University" InitialValue="0" CssClass="validator" ValidationGroup="Specialties" ControlToValidate="ddlUniversity"></asp:RequiredFieldValidator>

                    </div>
                    <div class="form-group">
                        <label>College</label>
                        <asp:DropDownList ID="ddlCollegesId" runat="server" CssClass="custom-select" DataSourceID="SqlCollege" DataTextField="CollegesNameEn" DataValueField="CollegesId" AppendDataBoundItems="True">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                        <div class="clearfix"></div>
                        <asp:RequiredFieldValidator ID="rfvCollegesId" runat="server" ErrorMessage="Please Select College" InitialValue="0"  CssClass="validator" ValidationGroup="Specialties" ControlToValidate="ddlCollegesId"></asp:RequiredFieldValidator>

                    </div>
                    <div class="form-group">
                        <label>Specialty Name</label>
                        <asp:TextBox ID="txtSpecialtiesNameEn" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvSpecialtiesNameEn" runat="server" ErrorMessage="Please Enter Specialty Name" CssClass="validator" ValidationGroup="Specialties" ControlToValidate="txtSpecialtiesNameEn"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Specialty Name Arabic</label>
                        <asp:TextBox ID="txtSpecialtiesNameAr" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvSpecialtiesNameAr" runat="server" ErrorMessage="Please Enter Specialty Name Arabic" CssClass="validator" ValidationGroup="Specialties" ControlToValidate="txtSpecialtiesNameAr"></asp:RequiredFieldValidator>

                    </div>

                    <div class="form-group">
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="mj_yellowbtn button_cancel" BorderStyle="None" ValidationGroup="Specialties" OnClick="btnSave_Click" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="mj_yellowbtn button_cancel" BorderStyle="None" OnClick="btnCancel_Click" />
                    </div>

                </div>
            </div>

        </div>
        <div class="clearfix"></div>
        <div class="form-grid form-group">
            <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" DataKeyNames="SpecialtiesId" DataSourceID="SqlGetSpecialty" CssClass="mGrid">
                <Columns>
                    <asp:BoundField DataField="UniversitiesNameEn" HeaderText="UniversitiesNameEn" SortExpression="UniversitiesNameEn" />
                    <asp:BoundField DataField="CollegesNameEn" HeaderText="CollegesNameEn" SortExpression="CollegesNameEn" />
                    <asp:BoundField DataField="SpecialtiesId" HeaderText="SpecialtiesId" SortExpression="SpecialtiesId" InsertVisible="False" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="CollegesId" HeaderText="CollegesId" SortExpression="CollegesId" Visible="False" />
                    <asp:BoundField DataField="SpecialtiesNameAr" HeaderText="SpecialtiesNameAr" SortExpression="SpecialtiesNameAr" />
                    <asp:BoundField DataField="SpecialtiesNameEn" HeaderText="SpecialtiesNameEn" SortExpression="SpecialtiesNameEn" />
                    <asp:TemplateField HeaderText="Setting">
                        <ItemTemplate>
                            <asp:ImageButton CssClass="iconBtn" ID="btnEdit" runat="server" CommandArgument='<%# bind("SpecialtiesId") %>' ImageUrl="~/images/Edit.png" OnClick="btnEdit_Click" />
                            <asp:ImageButton CssClass="iconBtn" ID="btnDelete" runat="server" CommandArgument='<%# bind("SpecialtiesId") %>' ImageUrl="~/images/Delete.png" OnClientClick="return confirm('Are you sure you want to delete this?')" OnClick="btnDelete_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlGetSpecialty" runat="server" ConnectionString="<%$ ConnectionStrings:StudentHubConnectionString %>" SelectCommand="SELECT Universities.UniversitiesNameEn, Colleges.CollegesNameEn, Specialties.SpecialtiesId, Specialties.CollegesId, Specialties.SpecialtiesNameAr, Specialties.SpecialtiesNameEn FROM Universities INNER JOIN Colleges ON Universities.UniversitiesId = Colleges.UniversitiesId INNER JOIN Specialties ON Colleges.CollegesId = Specialties.CollegesId"></asp:SqlDataSource>
         <asp:SqlDataSource ID="SqlUniversity" runat="server" ConnectionString="<%$ ConnectionStrings:StudentHubConnectionString %>" SelectCommand="SELECT [UniversitiesId], [UniversitiesNameAr], [UniversitiesNameEn] FROM [Universities]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlCollege" runat="server" ConnectionString="<%$ ConnectionStrings:StudentHubConnectionString %>" SelectCommand="SELECT [UniversitiesId], [CollegesId], [CollegesNameAr], [CollegesNameEn] FROM [Colleges] WHERE ([UniversitiesId] = @UniversitiesId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlUniversity" DefaultValue="1" Name="UniversitiesId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

