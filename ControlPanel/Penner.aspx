<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/MainPage.Master" AutoEventWireup="true" CodeBehind="Penner.aspx.cs" Inherits="StudentServices.ControlPanel.Penner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hfKeyValue" runat="server" Value="0" />
    <asp:HiddenField ID="hfEventStatus" runat="server" Value="1" />

    <asp:HiddenField ID="HFImagPenner" runat="server" Value="" />

    <div class="row">
        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0  topUp">
            <div class="mj_mainheading mj_bottompadder50">
                <h1>p<span>enner</span></h1>
                <p id="ContentAlert" runat="server" class="content_error"></p>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="mj_postdiv mj_shadow_yellow mj_postpage mj_toppadder50 mj_bottompadder50">
                <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">

                    <div class="form-group">
                        <label>Penner Title</label>
                        <asp:TextBox ID="txtPennerTitle" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPennerTitle" runat="server" ErrorMessage="Please Enter Penner Title" CssClass="validator" ValidationGroup="Cities" ControlToValidate="txtPennerTitle"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Penner Sub Title</label>
                        <asp:TextBox ID="txtPennerSubTitle" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPennerSubTitle" runat="server" ErrorMessage="Please Enter Sub Penner Title" CssClass="validator" ValidationGroup="Cities" ControlToValidate="txtPennerSubTitle"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Penner Title Arabic</label>
                        <asp:TextBox ID="txtPennerTitleAr" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPennerTitleAr" runat="server" ErrorMessage="Please Enter Penner Title Arabic" CssClass="validator" ValidationGroup="Cities" ControlToValidate="txtPennerTitleAr"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label>Penner Sub Title Arabic</label>
                        <asp:TextBox ID="txtPennerSubTitleAr" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPennerSubTitleAr" runat="server" ErrorMessage="Please Enter Penner Sub Title Arabic" CssClass="validator" ValidationGroup="Cities" ControlToValidate="txtPennerSubTitleAr"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label>Penner Image</label>
                        <asp:FileUpload ID="ufPennerImage" runat="server" />
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Choose Image Penner" CssClass="validator" ValidationGroup="Cities" ControlToValidate="ufPennerImage"></asp:RequiredFieldValidator>--%>
                    </div>
                </div>
            </div>
            <div class="mj_showmore">
                <div class="mj_resumepreview_footer">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="row">
                            <div class="mj_resume_changeing mj_yellowbg">
                                <asp:LinkButton ID="lnkSave" runat="server" CssClass="fa" ValidationGroup="Cities" OnClick="btnSave_Click">Save</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="row">
                            <div class="mj_resume_changeing mj_bluebg">
                                <asp:LinkButton ID="lnkCancel" runat="server" CssClass="fa" OnClick="btnCancel_Click">Cancel</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="form-grid form-group">
            <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" DataSourceID="SqlGetCities" CssClass="mGrid" DataKeyNames="PennerId">
                <Columns>
                    <asp:BoundField DataField="PennerId" HeaderText="Penner Id" ReadOnly="True" SortExpression="PennerId" InsertVisible="False" />
                    <asp:BoundField DataField="PennerTitle" HeaderText="Penner Title" SortExpression="PennerTitle" />
                    <asp:BoundField DataField="PennerTitleAr" HeaderText="Penner Title Arabic" SortExpression="PennerTitleAr" />
                    <asp:TemplateField HeaderText="Setting">
                        <ItemTemplate>
                            <asp:ImageButton CssClass="iconBtn" ID="btnEdit" runat="server" CommandArgument='<%# bind("PennerId") %>' ImageUrl="~/images/Edit.png" OnClick="btnEdit_Click" />
                            <asp:ImageButton CssClass="iconBtn" ID="btnDelete" runat="server" CommandArgument='<%# bind("PennerId") %>' ImageUrl="~/images/Delete.png" OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure you want to delete this Penner?')" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlGetCities" runat="server" ConnectionString="<%$ ConnectionStrings:StudentHubConnectionString %>" SelectCommand="SELECT [PennerId], [PennerTitle], [PennerSubTitle], [PennerTitleAr], [PennerSubTitleAr], [PennerImage] FROM [Penner]"></asp:SqlDataSource>


    </div>

</asp:Content>
