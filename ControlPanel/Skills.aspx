<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/MainPage.Master" AutoEventWireup="true" CodeBehind="Skills.aspx.cs" Inherits="StudentServices.ControlPanel.Skills" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hfKeyValue" runat="server" Value="0" />
    <asp:HiddenField ID="hfEventStatus" runat="server" Value="1" />

    <div class="row">
        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0  topUp">
            <div class="mj_mainheading mj_bottompadder50">
                <h1>s<span>kills</span></h1>
                <p id="ContentAlert" runat="server" class="content_error"></p>
            </div>
        </div>
    </div>

    <div class="row" style="margin-top: 30px">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="mj_postdiv mj_shadow_yellow mj_postpage mj_toppadder50 mj_bottompadder50">
                <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">

                    <div class="form-group">
                        <label>Skill Name Arabic</label>
                        <asp:TextBox ID="txtSkillsDescriptionAr" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvSkillsDescriptionAr" runat="server" ErrorMessage="Please Enter Skill Name Arabic" CssClass="validator" ValidationGroup="Skills" ControlToValidate="txtSkillsDescriptionAr"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Skills Name </label>
                        <asp:TextBox ID="txtSkillsDescriptionEn" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvSkillsDescriptionEn" runat="server" ErrorMessage="Please Enter Skills Description " CssClass="validator" ValidationGroup="Skills" ControlToValidate="txtSkillsDescriptionEn"></asp:RequiredFieldValidator>

                    </div>

                    <div class="form-group">
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="mj_yellowbtn button_cancel" BorderStyle="None" ValidationGroup="Skills" OnClick="btnSave_Click" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="mj_yellowbtn button_cancel" BorderStyle="None" OnClick="btnCancel_Click" />
                    </div>

                </div>
            </div>

        </div>
        <div class="clearfix"></div>
        <div class="form-grid form-group">
            <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" DataSourceID="SqlGetSkills" CssClass="mGrid">
                <Columns>
                    <asp:BoundField DataField="SkillsId" HeaderText="SkillsId" />
                    <asp:BoundField DataField="SkillsDescriptionAr" HeaderText="SkillsDescriptionAr" />
                    <asp:BoundField DataField="SkillsDescriptionEn" HeaderText="SkillsDescriptionEn" />
                    <asp:TemplateField HeaderText="Setting">
                        <ItemTemplate>
                            <asp:ImageButton CssClass="iconBtn" ID="btnEdit" runat="server" CommandArgument='<%# bind("SkillsId") %>' ImageUrl="~/images/Edit.png" OnClick="btnEdit_Click" />
                            <asp:ImageButton CssClass="iconBtn" ID="btnDelete" runat="server" CommandArgument='<%# bind("SkillsId") %>' ImageUrl="~/images/Delete.png" OnClientClick="return confirm('Are you sure you want to delete this?')" OnClick="btnDelete_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlGetSkills" runat="server" ConnectionString="<%$ ConnectionStrings:StudentHubConnectionString %>" SelectCommand="SELECT SkillsId, SkillsDescriptionAr, SkillsDescriptionEn FROM Skills"></asp:SqlDataSource>


    </div>
</asp:Content>
