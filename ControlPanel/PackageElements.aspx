<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/MainPage.Master" AutoEventWireup="true" CodeBehind="PackageElements.aspx.cs" Inherits="StudentServices.ControlPanel.PackageElements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hfKeyValue" runat="server" Value="0" />
    <asp:HiddenField ID="hfEventStatus" runat="server" Value="1" />

    <div class="row">
        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0  topUp">
            <div class="mj_mainheading mj_bottompadder50">
                <h1>p<span>ackage</span>E<span>lements</span></h1>
                <p id="ContentAlert" runat="server" class="content_error"></p>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="mj_postdiv mj_shadow_yellow mj_postpage mj_toppadder50 mj_bottompadder50">
                <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">

                    <div class="form-group">
                        <label>Package Element Name</label>
                        <asp:TextBox ID="txtPackageElementEn" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPackageElementEn" runat="server" ErrorMessage="Please Enter Package Element Name" CssClass="validator" ValidationGroup="PackageElement" ControlToValidate="txtPackageElementEn"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Package Element Name Arabic</label>
                        <asp:TextBox ID="txtPackageElementAr" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPackageElementAr" runat="server" ErrorMessage="Please Enter Package Element Name Arabic" CssClass="validator" ValidationGroup="PackageElement" ControlToValidate="txtPackageElementAr"></asp:RequiredFieldValidator>
                    </div>

                </div>
            </div>

            <div class="mj_showmore">
                <div class="mj_resumepreview_footer">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="row">
                            <div class="mj_resume_changeing mj_yellowbg">
                                <asp:LinkButton ID="lnkSave" runat="server" CssClass="fa" ValidationGroup="PackageElement" OnClick="btnSave_Click">Save</asp:LinkButton>
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
                <%--<asp:LinkButton ID="btnSave" runat="server" CssClass="mj_showmorebtn mj_bigbtn mj_yellowbtn" ValidationGroup="Cities" OnClick="btnSave_Click">Save</asp:LinkButton>--%>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="form-grid form-group">
            <asp:GridView ID="gv" runat="server" CssClass="mGrid" AutoGenerateColumns="False" DataKeyNames="PackageElementsId" DataSourceID="SqlGetPackageElement">
                <Columns>
                    <asp:BoundField DataField="PackageElementsId" HeaderText="PackageElementsId" ReadOnly="True" InsertVisible="False" SortExpression="PackageElementsId"></asp:BoundField>
                    <asp:BoundField DataField="PackageElementsTitleEn" HeaderText="PackageElementsTitleEn" SortExpression="PackageElementsTitleEn"></asp:BoundField>
                    <asp:BoundField DataField="PackageElementsTitleAr" HeaderText="PackageElementsTitleAr" SortExpression="PackageElementsTitleAr"></asp:BoundField>
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:ImageButton CssClass="iconBtn" ID="btnEdit" runat="server" CommandArgument='<%# bind("PackageElementsId") %>' ImageUrl="~/images/Edit.png" OnClick="btnEdit_Click" />
                            <asp:ImageButton CssClass="iconBtn" ID="btnDelete" runat="server" CommandArgument='<%# bind("PackageElementsId") %>' ImageUrl="~/images/Delete.png" OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure you want to delete this Package Elements?')" />
                        </ItemTemplate>

                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlGetPackageElement" runat="server" ConnectionString="<%$ ConnectionStrings:StudentHubConnectionString %>" SelectCommand="SELECT [PackageElementsId], [PackageElementsTitleEn], [PackageElementsTitleAr] FROM [PackageElements]"></asp:SqlDataSource>




    </div>

</asp:Content>
