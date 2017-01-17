<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/MainPage.Master" AutoEventWireup="true" CodeBehind="Packages.aspx.cs" Inherits="StudentServices.ControlPanel.Packages" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
      <asp:HiddenField ID="hfKeyValue" runat="server" Value="0" />
    <asp:HiddenField ID="hfEventStatus" runat="server" Value="1" />
    <div class="row">
        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0  topUp">
            <div class="mj_mainheading mj_bottompadder50">
                <h1>p<span>ackages</span></h1>
                <p id="ContentAlert" runat="server" class="content_error"></p>
            </div>
        </div>
    </div>

    <div class="row" style="margin-top: 30px">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="mj_postdiv mj_shadow_yellow mj_postpage mj_toppadder50 mj_bottompadder50">
                <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">
                    <div class="form-group">
                        <label>Package Title</label>
                        <asp:TextBox ID="txtPackageTitleEn" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPackageTitleEn" runat="server" ErrorMessage="Please Enter Package Title" CssClass="validator" ValidationGroup="Package" ControlToValidate="txtPackageTitleEn"></asp:RequiredFieldValidator>
                    </div>

                     <div class="form-group">
                        <label>Package Sub Title</label>
                        <asp:TextBox ID="txtPackageSubTitleEn" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Sub Package Title" CssClass="validator" ValidationGroup="Package" ControlToValidate="txtPackageSubTitleEn"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label>Package Title Arabic</label>
                        <asp:TextBox ID="txtPackageTitleAr" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPackageTitleAr" runat="server" ErrorMessage="Please Enter Package Title Arabic" CssClass="validator" ValidationGroup="Package" ControlToValidate="txtPackageTitleAr"></asp:RequiredFieldValidator>
                    </div>

                      <div class="form-group">
                        <label>Package Sub Title Arabic</label>
                        <asp:TextBox ID="txtPackageSubTitleAr" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Package Title Arabic" CssClass="validator" ValidationGroup="Package" ControlToValidate="txtPackageSubTitleAr"></asp:RequiredFieldValidator>
                    </div>
                   

                    <div class="form-group">
                        <label>
                        </label>
                        <asp:CheckBox ID="cbPackageStatus" runat="server" Text="Package Status" />
                    </div>
                    <%--<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mj_toppadder20">
                        <div class="form-group  pull-left">
                            <div class="mj_checkbox">
                                <input type="checkbox" value="1" id="check2" name="checkbox">
                                <label for="check2"></label>
                            </div>
                            <span>Package Status</span>
                        </div>
                    </div>--%>
                </div>
                
            </div>
            <div class="mj_showmore">
                    <div class="mj_resumepreview_footer">
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="row">
                                <div class="mj_resume_changeing mj_yellowbg">
                                    <asp:LinkButton ID="lnkSave" runat="server" CssClass="fa" ValidationGroup="Package" OnClick="btnSave_Click">Save</asp:LinkButton>
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
            <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" DataKeyNames="PackageId" DataSourceID="SqlGetPackages" CssClass="mGrid">
                <Columns>
                    <asp:BoundField DataField="PackageId" HeaderText="PackageId" SortExpression="PackageId" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="PackageTitleAr" HeaderText="PackageTitleAr" SortExpression="PackageTitleAr" />
                    <asp:BoundField DataField="PackageSubTitleAr" HeaderText="PackageSubTitleAr" SortExpression="PackageSubTitleAr" />
                    <asp:BoundField DataField="PackageTitleEn" HeaderText="PackageTitleEn" SortExpression="PackageTitleEn" />
                    <asp:BoundField DataField="PackageSubTitleEn" HeaderText="PackageSubTitleEn" SortExpression="PackageSubTitleEn" />
                    <asp:CheckBoxField DataField="PackageStatus" HeaderText="PackageStatus" SortExpression="PackageStatus" />
                    <asp:TemplateField HeaderText="Setting">
                        <ItemTemplate>
                            <asp:ImageButton CssClass="iconBtn" ID="btnEdit" runat="server" OnClick="btnEdit_Click" CommandArgument='<%# bind("PackageId") %>' ImageUrl="~/images/Edit.png" />
                            <asp:ImageButton CssClass="iconBtn" ID="btnDelete" runat="server" OnClick="btnDelete_Click" CommandArgument='<%# bind("PackageId") %>' ImageUrl="~/images/Delete.png" OnClientClick="return confirm('Are you sure you want to delete this?')" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlGetPackages" runat="server" ConnectionString="<%$ ConnectionStrings:StudentHubConnectionString %>" SelectCommand="SELECT [PackageId], [PackageTitleAr], [PackageTitleEn], CONVERT(bit,[PackageStatus]) PackageStatus, [PackageSubTitleAr], [PackageSubTitleEn] FROM [Packages]"></asp:SqlDataSource>
    </div>
</asp:Content>

