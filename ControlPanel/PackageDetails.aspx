<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/MainPage.Master" AutoEventWireup="true" CodeBehind="PackageDetails.aspx.cs" Inherits="StudentServices.ControlPanel.PackageDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:HiddenField ID="hfKeyValue" runat="server" Value="0" />
    <asp:HiddenField ID="hfEventStatus" runat="server" Value="1" />

    <div class="row">
        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0  topUp">
            <div class="mj_mainheading mj_bottompadder50">
                <h1>p<span>ackage</span>d<span>etails</span></h1>
                <p id="ContentAlert" runat="server" class="content_error"></p>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="mj_postdiv mj_shadow_yellow mj_postpage mj_toppadder50 mj_bottompadder50">
                <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">

                    <div class="form-group">
                        <label>Packages</label>
                        <asp:DropDownList ID="ddlPackages" runat="server" CssClass="custom-select" AppendDataBoundItems="True" DataSourceID="SDSPackages" DataTextField="PackageTitleEn" DataValueField="PackageId">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                        <div class="clearfix"></div>
                        <asp:RequiredFieldValidator ID="rfvPackages" runat="server" ErrorMessage="Please Select Packages" CssClass="validator" InitialValue="0" ValidationGroup="PackageDetails" ControlToValidate="ddlPackages"></asp:RequiredFieldValidator>
                        <asp:SqlDataSource ID="SDSPackages" runat="server" ConnectionString='<%$ ConnectionStrings:StudentHubConnectionString %>' SelectCommand="SELECT [PackageId], [PackageTitleEn] FROM [Packages]"></asp:SqlDataSource>
                    </div>

                    <div class="form-group">
                        <label>Package Elements</label>
                        <asp:DropDownList ID="ddlPackageElements" runat="server" CssClass="custom-select" AppendDataBoundItems="True" DataSourceID="sdsPackageElements" DataTextField="PackageElementsTitleEn" DataValueField="PackageElementsId">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                        <div class="clearfix"></div>
                        <asp:RequiredFieldValidator ID="rfvPackageElements" runat="server" ErrorMessage="Please Select Package Elements" CssClass="validator" InitialValue="0" ValidationGroup="PackageDetails" ControlToValidate="ddlPackageElements"></asp:RequiredFieldValidator>
                        <asp:SqlDataSource ID="sdsPackageElements" runat="server" ConnectionString='<%$ ConnectionStrings:StudentHubConnectionString %>' SelectCommand="SELECT PackageElementsId, PackageElementsTitleEn, PackageElementsTitleAr FROM PackageElements"></asp:SqlDataSource>
                    </div>

                    <div class="form-group">
                        <label>Package Detail value</label>
                        <asp:TextBox ID="txtPackageDetailsValue" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPackageDetailsValue" runat="server" ErrorMessage="Please Enter Package Details Value" CssClass="validator" ValidationGroup="PackageDetails" ControlToValidate="txtPackageDetailsValue"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Package Detail Price</label>
                        <asp:TextBox ID="txtPackageDetailsPrice" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPackageDetailsPrice" runat="server" ErrorMessage="Please Enter Package Details Price" CssClass="validator" ValidationGroup="PackageDetails" ControlToValidate="txtPackageDetailsPrice"></asp:RequiredFieldValidator>
                    </div>

                </div>
            </div>

            <div class="mj_showmore">
                <div class="mj_resumepreview_footer">
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="row">
                            <div class="mj_resume_changeing mj_yellowbg">
                                <asp:LinkButton ID="lnkSave" runat="server" CssClass="fa" ValidationGroup="PackageDetails" OnClick="btnSave_Click">Save</asp:LinkButton>
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
            <asp:GridView ID="gv" runat="server" CssClass="mGrid" AutoGenerateColumns="False" DataKeyNames="PackageDetailsId" DataSourceID="SqlGetPackageDetails">
                <Columns>
                    <asp:BoundField DataField="PackageTitleEn" HeaderText="Package" SortExpression="PackageTitleEn"></asp:BoundField>
                    <asp:BoundField DataField="PackageElementsTitleEn" HeaderText="Element" SortExpression="PackageElementsTitleEn"></asp:BoundField>
                    <asp:BoundField DataField="PackageDetailsId" HeaderText="PackageDetailsId" ReadOnly="True" SortExpression="PackageDetailsId" Visible="False"></asp:BoundField>
                    <asp:BoundField DataField="PackageId" HeaderText="PackageId" SortExpression="PackageId" Visible="False"></asp:BoundField>
                    <asp:BoundField DataField="PackageElementsId" HeaderText="PackageElementsId" SortExpression="PackageElementsId" Visible="False"></asp:BoundField>
                    <asp:BoundField DataField="PackageDetailsValue" HeaderText="Elment Value" SortExpression="PackageDetailsValue"></asp:BoundField>
                    <asp:BoundField DataField="PackageDetailsPrice" HeaderText="Elment Price" SortExpression="PackageDetailsPrice"></asp:BoundField>
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:ImageButton CssClass="iconBtn" ID="btnEdit" runat="server" CommandArgument='<%# bind("PackageDetailsId") %>' ImageUrl="~/images/Edit.png" OnClick="btnEdit_Click" />
                            <asp:ImageButton CssClass="iconBtn" ID="btnDelete" runat="server" CommandArgument='<%# bind("PackageDetailsId") %>' ImageUrl="~/images/Delete.png" OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure you want to delete this Package Elements?')" />
                        </ItemTemplate>

                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </div>
        <asp:SqlDataSource ID="SqlGetPackageDetails" runat="server" ConnectionString="<%$ ConnectionStrings:StudentHubConnectionString %>" SelectCommand="SELECT Packages.PackageTitleEn, PackageElements.PackageElementsTitleEn, PackageDetails.PackageDetailsValue, PackageDetails.PackageDetailsPrice, PackageDetails.PackageElementsId, PackageDetails.PackageId, PackageDetails.PackageDetailsId FROM PackageDetails INNER JOIN PackageElements ON PackageDetails.PackageElementsId = PackageElements.PackageElementsId INNER JOIN Packages ON PackageDetails.PackageId = Packages.PackageId"></asp:SqlDataSource>



    </div>

</asp:Content>
