<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/MainPage.master" AutoEventWireup="true" CodeBehind="CareerField.aspx.cs" Inherits="StudentServices.ControlPanel.CareerField" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:HiddenField ID="hfKeyValue" runat="server" Value="0" />
    <asp:HiddenField ID="hfEventStatus" runat="server" Value="1" />

    <div class="row">
        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0  topUp">
            <div class="mj_mainheading mj_bottompadder50">
                <h1>c<span>areer Field</span></h1>
                <p id="ContentAlert" runat="server" class="content_error"></p>
            </div>
        </div>
    </div>

    <div class="row" style="margin-top: 30px">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="mj_postdiv mj_shadow_yellow mj_postpage mj_toppadder50 mj_bottompadder50">
                <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">

                    <div class="form-group">
                        <label>Career Field Title Arabic</label>
                        <asp:TextBox ID="txtCareerFieldTitleAr" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCareerFieldTitleAr" runat="server" ErrorMessage="Please Enter Career Field Title Arabic " CssClass="validator" ValidationGroup="CareerField" ControlToValidate="txtCareerFieldTitleAr"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Career Field Title </label>
                        <asp:TextBox ID="txtCareerFieldTitleEn" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCareerFieldTitleEn" runat="server" ErrorMessage="Please Enter Career Field Title  " CssClass="validator" ValidationGroup="CareerField" ControlToValidate="txtCareerFieldTitleEn"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="mj_yellowbtn button_cancel" BorderStyle="None" ValidationGroup="CareerField" OnClick="btnSave_Click" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="mj_yellowbtn button_cancel" BorderStyle="None" OnClick="btnCancel_Click" />
                    </div>

                </div>
            </div>



        </div>
        <div class="clearfix"></div>
        <div class="form-grid form-group">
            <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" DataSourceID="SqlGetCareerField" CssClass="mGrid" DataKeyNames="CareerFieldId">
                <Columns>
                    <asp:BoundField DataField="CareerFieldId" HeaderText="CareerFieldId" ReadOnly="True" SortExpression="CareerFieldId" />
                    <asp:BoundField DataField="CareerFieldTitleAr" HeaderText="CareerFieldTitleAr" SortExpression="CareerFieldTitleAr" />
                    <asp:BoundField DataField="CareerFieldTitleEn" HeaderText="CareerFieldTitleEn" SortExpression="CareerFieldTitleEn" />
                    <asp:TemplateField HeaderText="Setting">
                        <ItemTemplate>
                            <asp:ImageButton CssClass="iconBtn" ID="btnEdit" runat="server" CommandArgument='<%# bind("CareerFieldId") %>' ImageUrl="~/images/Edit.png" OnClick="btnEdit_Click" />
                            <asp:ImageButton CssClass="iconBtn" ID="btnDelete" runat="server" CommandArgument='<%# bind("CareerFieldId") %>' ImageUrl="~/images/Delete.png" OnClientClick="return confirm('Are you sure you want to delete this?')" OnClick="btnDelete_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlGetCareerField" runat="server" ConnectionString="<%$ ConnectionStrings:StudentHubConnectionString %>" SelectCommand="SELECT [CareerFieldId], [CareerFieldTitleAr], [CareerFieldTitleEn] FROM [CareerField]"></asp:SqlDataSource>


    </div>

</asp:Content>
