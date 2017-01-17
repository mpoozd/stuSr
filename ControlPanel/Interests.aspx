<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/MainPage.Master" AutoEventWireup="true" CodeBehind="Interests.aspx.cs" Inherits="StudentServices.ControlPanel.Interests" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:HiddenField ID="hfKeyValue" runat="server" Value="0" />
    <asp:HiddenField ID="hfEventStatus" runat="server" Value="1" />

    <div class="row">
        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0  topUp">
            <div class="mj_mainheading mj_bottompadder50">
                <h1>i<span>nterestis</span></h1>
                <p id="ContentAlert" runat="server" class="content_error"></p>
            </div>
        </div>
    </div>

    <div class="row" style="margin-top: 30px">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="mj_postdiv mj_shadow_yellow mj_postpage mj_toppadder50 mj_bottompadder50">
                <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">

                    <div class="form-group">
                        <label>Interests Title</label>
                        <asp:TextBox ID="txtInterestsDescriptionEn" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInterestsDescriptionEn" runat="server" ErrorMessage="Please Enter Interests Description " CssClass="validator" ValidationGroup="Interests" ControlToValidate="txtInterestsDescriptionEn"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Interests Title Arabic</label>
                        <asp:TextBox ID="txtInterestsDescriptionAr" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvfInterestsDescriptionAr" runat="server" ErrorMessage="Please Enter Interests Description Arabic " CssClass="validator" ValidationGroup="Interests" ControlToValidate="txtInterestsDescriptionAr"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="mj_yellowbtn button_cancel" BorderStyle="None" ValidationGroup="Interests" OnClick="btnSave_Click"/>
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="mj_yellowbtn button_cancel" BorderStyle="None" OnClick="btnCancel_Click" />
                    </div>
                </div>
            </div>

        </div>
        <div class="clearfix"></div>
        <div class="form-grid form-group">
            <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" DataSourceID="SqlGetInterests" CssClass="mGrid" DataKeyNames="InterestsId">
                <Columns>
                    <asp:BoundField DataField="InterestsId" HeaderText="InterestsId" ReadOnly="True" SortExpression="InterestsId" />
                    <asp:BoundField DataField="InterestsDescriptionAr" HeaderText="InterestsDescriptionAr" SortExpression="InterestsDescriptionAr" />
                    <asp:BoundField DataField="InterestsDescriptionEn" HeaderText="InterestsDescriptionEn" SortExpression="InterestsDescriptionEn" />
                    <asp:TemplateField HeaderText="Setting">
                        <ItemTemplate>
                            <asp:ImageButton CssClass="iconBtn" ID="btnEdit" runat="server" CommandArgument='<%# bind("InterestsId") %>' ImageUrl="~/images/Edit.png" OnClick="btnEdit_Click" />
                            <asp:ImageButton CssClass="iconBtn" ID="btnDelete" runat="server" CommandArgument='<%# bind("InterestsId") %>' ImageUrl="~/images/Delete.png" OnClientClick="return confirm('Are you sure you want to delete this?')" OnClick="btnDelete_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlGetInterests" runat="server" ConnectionString="<%$ ConnectionStrings:StudentHubConnectionString %>" SelectCommand="SELECT [InterestsId], [InterestsDescriptionAr], [InterestsDescriptionEn] FROM [Interests]"></asp:SqlDataSource>


    </div>

</asp:Content>

