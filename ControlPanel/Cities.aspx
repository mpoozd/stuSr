<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/MainPage.Master" AutoEventWireup="true" CodeBehind="Cities.aspx.cs" Inherits="StudentServices.ControlPanel.Cities" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hfKeyValue" runat="server" Value="0" />
    <asp:HiddenField ID="hfEventStatus" runat="server" Value="1" />

    <div class="row">
        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0  topUp">
            <div class="mj_mainheading mj_bottompadder50">
                <h1>c<span>ities</span></h1>
                <p id="ContentAlert" runat="server" class="content_error"></p>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="mj_postdiv mj_shadow_yellow mj_postpage mj_toppadder50 mj_bottompadder50">
                <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">

                    <div class="form-group">
                        <label>City Name</label>
                        <asp:TextBox ID="txtCityNameEn" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCityNameEn" runat="server" ErrorMessage="Please Enter City Name" CssClass="validator" ValidationGroup="Cities" ControlToValidate="txtCityNameEn"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>City Name Arabic</label>
                        <asp:TextBox ID="txtCityNameAr" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCityNameAr" runat="server" ErrorMessage="Please Enter City Name Arabic" CssClass="validator" ValidationGroup="Cities" ControlToValidate="txtCityNameAr"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="mj_yellowbtn button_cancel" BorderStyle="None" OnClick="btnSave_Click" ValidationGroup="Cities" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="mj_yellowbtn button_cancel" BorderStyle="None" OnClick="btnCancel_Click" />

                    </div>

                </div>
            </div>
            <div class="mj_showmore">
                <%--<asp:LinkButton ID="btnSave" runat="server" CssClass="mj_showmorebtn mj_bigbtn mj_yellowbtn" ValidationGroup="Cities" OnClick="btnSave_Click">Save</asp:LinkButton>--%>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="form-grid form-group">
            <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" DataSourceID="SqlGetCities" CssClass="mGrid" DataKeyNames="CityId">
                <Columns>
                    <asp:BoundField DataField="CityId" HeaderText="City Id" ReadOnly="True" SortExpression="CityId" InsertVisible="False" />
                    <asp:BoundField DataField="CityNameAr" HeaderText="City Name Arabic" SortExpression="CityNameAr" />
                    <asp:BoundField DataField="CityNameEn" HeaderText="City Name" SortExpression="CityNameEn" />
                    <asp:TemplateField HeaderText="Setting">
                        <ItemTemplate>
                            <asp:ImageButton CssClass="iconBtn" ID="btnEdit" runat="server" CommandArgument='<%# bind("CityId") %>' ImageUrl="~/images/Edit.png" OnClick="btnEdit_Click" />
                            <asp:ImageButton CssClass="iconBtn" ID="btnDelete" runat="server" CommandArgument='<%# bind("CityId") %>' ImageUrl="~/images/Delete.png" OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure you want to delete this City?')" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlGetCities" runat="server" ConnectionString="<%$ ConnectionStrings:StudentHubConnectionString %>" SelectCommand="SELECT [CityId], [CityNameAr], [CityNameEn] FROM [Cities]"></asp:SqlDataSource>


    </div>

</asp:Content>