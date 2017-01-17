<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/MainPage.Master" AutoEventWireup="true" CodeBehind="Universities.aspx.cs" Inherits="StudentServices.ControlPanel.Universities" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:HiddenField ID="hfKeyValue" runat="server" Value="0" />
    <asp:HiddenField ID="hfEventStatus" runat="server" Value="1" />
    <asp:HiddenField ID="hfUplaoFile" runat="server" Value="" />

    <div class="row">
        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0  topUp">
            <div class="mj_mainheading mj_bottompadder50">
                <h1>u<span>niversities</span></h1>
                <p id="ContentAlert" runat="server" class="content_error"></p>
            </div>
        </div>
    </div>

    <div class="row" style="margin-top: 30px">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="mj_postdiv mj_shadow_yellow mj_postpage mj_toppadder50 mj_bottompadder50">
                <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">
                    <div class="form-group">
                        <label>University Name</label>
                        <asp:TextBox ID="txtUniversityName" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvUniversityName" runat="server" ErrorMessage="Please Enter University Name" CssClass="validator" ValidationGroup="Universities" ControlToValidate="txtUniversityName"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>University Name Arabic</label>
                        <asp:TextBox ID="txtUniversityNameAr" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvUniversityNameAr" runat="server" ErrorMessage="Please Enter University Name Arabic" CssClass="validator" ValidationGroup="Universities" ControlToValidate="txtUniversityNameAr"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>
                            logo <span>(optionnal)</span>
                        </label>
                        <div class="clearfix"></div>
                        <asp:FileUpload ID="fuLogo" runat="server" />

                    </div>
                    <div class="form-group">
                        <label>University Web Site <span>(optionnal)</span></label>
                        <asp:TextBox ID="txtUniversitySite" runat="server" CssClass="form-control" placeholder="http://www.exampl.com"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Site is incorrect" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" CssClass="validator" ValidationGroup="Universities" ControlToValidate="txtUniversitySite"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <label>University Email</label>
                        <asp:TextBox ID="txtUniversityEmail" runat="server" CssClass="form-control" placeholder="@job.com"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvUniversityEmail" runat="server" ErrorMessage="Please Enter University Email" CssClass="validator" ValidationGroup="Universities" ControlToValidate="txtUniversityEmail"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>City</label>
                        <asp:DropDownList ID="ddlCity" runat="server" CssClass="custom-select" AppendDataBoundItems="True" DataSourceID="SqlCity" DataTextField="CityNameEn" DataValueField="CityId">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                        <div class="clearfix"></div>
                        <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="Please Select City" CssClass="validator" ValidationGroup="Universities" ControlToValidate="ddlCity" InitialValue="0"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="mj_yellowbtn button_cancel" BorderStyle="None" ValidationGroup="Universities" OnClick="btnSave_Click"/>
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="mj_yellowbtn button_cancel" BorderStyle="None" OnClick="btnCancel_Click" />
                    </div>
                </div>
            </div>

        </div>
        <div class="clearfix"></div>
        <div class="form-grid form-group">
            <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" DataKeyNames="UniversitiesId" DataSourceID="SqlGetUniversities" CssClass="mGrid">
                <Columns>
                    <asp:BoundField DataField="UniversitiesId" HeaderText="UniversitiesId" ReadOnly="True" SortExpression="UniversitiesId" />
                    <asp:BoundField DataField="UniversitiesNameAr" HeaderText="UniversitiesNameAr" SortExpression="UniversitiesNameAr" />
                    <asp:BoundField DataField="UniversitiesNameEn" HeaderText="UniversitiesNameEn" SortExpression="UniversitiesNameEn" />
                    <asp:BoundField DataField="UniversitiesWebsite" HeaderText="UniversitiesWebsite" SortExpression="UniversitiesWebsite" />
                    <asp:BoundField DataField="UniversitiesEmail" HeaderText="UniversitiesEmail" SortExpression="UniversitiesEmail" />
                    <asp:BoundField DataField="CityNameEn" HeaderText="CityNameEn" SortExpression="CityNameEn" />
                    <asp:TemplateField HeaderText="Setting">
                        <ItemTemplate>
                            <asp:ImageButton CssClass="iconBtn" ID="btnEdit" runat="server" CommandArgument='<%# bind("UniversitiesId") %>' ImageUrl="~/images/Edit.png" OnClick="btnEdit_Click" />
                            <asp:ImageButton CssClass="iconBtn" ID="btnDelete" runat="server" CommandArgument='<%# bind("UniversitiesId") %>' ImageUrl="~/images/Delete.png" OnClientClick="return confirm('Are you sure you want to delete this?')" OnClick="btnDelete_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlGetUniversities" runat="server" ConnectionString="<%$ ConnectionStrings:StudentHubConnectionString %>" SelectCommand="SELECT Universities.UniversitiesId, Universities.UniversitiesNameAr, Universities.UniversitiesNameEn, Universities.UniversitiesLogo, Universities.UniversitiesWebsite, Universities.UniversitiesEmail, Universities.CityId, Cities.CityNameEn FROM Universities INNER JOIN Cities ON Universities.CityId = Cities.CityId"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlCity" runat="server" ConnectionString="<%$ ConnectionStrings:StudentHubConnectionString %>" SelectCommand="SELECT [CityId], [CityNameAr], [CityNameEn] FROM [Cities]"></asp:SqlDataSource>

    </div>

</asp:Content>