<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/MainPage.Master" AutoEventWireup="true" CodeBehind="Partners.aspx.cs" Inherits="StudentServices.ControlPanel.Partners" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <asp:HiddenField ID="hfKeyValue" runat="server" Value="0" />
    <asp:HiddenField ID="hfEventStatus" runat="server" Value="1" />
    <asp:HiddenField ID="hfUplaoFile" runat="server" Value="" />

      <div class="row">
        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0  topUp">
            <div class="mj_mainheading mj_bottompadder50">
                <h1>p<span>arteners</span></h1>
                <p id="ContentAlert" runat="server" class="content_error"></p>
            </div>
        </div>
    </div>

     <div class="row" style="margin-top: 30px">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="mj_postdiv mj_shadow_yellow mj_postpage mj_toppadder50 mj_bottompadder50">
                <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">
                    <div class="form-group">
                        <label>Partner Name</label>
                        <asp:TextBox ID="txtPartnerNameEn" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPartnerNameEn" runat="server" ErrorMessage="Please Enter Partner Name" CssClass="validator" ValidationGroup="Partners" ControlToValidate="txtPartnerNameEn"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Partner Name Arabic</label>
                        <asp:TextBox ID="txtPartnerNameAr" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvtxtPartnerNameAr" runat="server" ErrorMessage="Please Enter Partner Name Arabic" CssClass="validator" ValidationGroup="Partners" ControlToValidate="txtPartnerNameAr"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>
                            logo <span>(optionnal)</span>
                        </label>
                        <div class="clearfix"></div>
                        <asp:FileUpload ID="fuLogo" runat="server" />
                    </div>
                    <div class="form-group">
                        <label>Partner Site <span>(optionnal)</span></label>
                        <asp:TextBox ID="txtPartnerWebsite" runat="server" CssClass="form-control" placeholder="http://www.jobKSA.com"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Site is incorrect" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" CssClass="validator" ValidationGroup="Partners" ControlToValidate="txtPartnerWebsite"></asp:RegularExpressionValidator>

                    </div>
                    <div class="form-group">
                        <label>Partner Email</label>
                        <asp:TextBox ID="txtPartnerEmail" runat="server" CssClass="form-control" placeholder="exsample@job.com"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Partner Email" CssClass="validator" ValidationGroup="Partners" ControlToValidate="txtPartnerEmail"></asp:RequiredFieldValidator>
                        <div class="clearfix"></div>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="E-mail is incorrect" ControlToValidate="txtPartnerEmail" CssClass="validator" ValidationGroup="Partners" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mj_toppadder20">
                        <div class="form-group  pull-left">
                            <div class="mj_checkbox">
                                <asp:CheckBox ID="chkIsShowHomePage" runat="server" Checked="true" />
                                <%--<input type="checkbox" value="1" id="check2" name="checkbox" checked="checked">--%>
                                <label for="check2"></label>
                            </div>
                            <span>Show Home Page</span>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="mj_yellowbtn button_cancel" BorderStyle="None" ValidationGroup="Partners" OnClick="btnSave_Click"/>
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="mj_yellowbtn button_cancel" BorderStyle="None" OnClick="btnCancel_Click" />
                    </div>
                </div>
            </div>
          
        </div>
        <div class="clearfix"></div>
        <div class="form-grid form-group">
            <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" DataKeyNames="PartnerId" DataSourceID="SqlGetPartners" CssClass="mGrid">
                <Columns>
                    <asp:BoundField DataField="PartnerId" HeaderText="PartnerId" SortExpression="PartnerId" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="PartnerNameAr" HeaderText="Name Arabic" SortExpression="PartnerNameAr" />
                    <asp:BoundField DataField="PartnerNameEn" HeaderText="Name" SortExpression="PartnerNameEn" />
                    <asp:BoundField DataField="PartnerEmail" HeaderText="Email" SortExpression="PartnerLogo" />
                    <asp:BoundField DataField="PartnerWebsite" HeaderText="Website" SortExpression="PartnerWebsite" />
                    <asp:CheckBoxField DataField="IsShowHomePage" HeaderText="IsShowHomePage" SortExpression="IsShowHomePage" />
                    <asp:TemplateField HeaderText="Setting">
                          <ItemTemplate>
                            <asp:ImageButton CssClass="iconBtn" ID="btnEdit" runat="server" CommandArgument='<%# bind("PartnerId") %>' ImageUrl="~/images/Edit.png" OnClick="btnEdit_Click" />
                            <asp:ImageButton CssClass="iconBtn" ID="btnDelete" runat="server" CommandArgument='<%# bind("PartnerId") %>' ImageUrl="~/images/Delete.png" OnClientClick="return confirm('Are you sure you want to delete this?')" OnClick="btnDelete_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlGetPartners" runat="server" ConnectionString="<%$ ConnectionStrings:StudentHubConnectionString %>" SelectCommand="SELECT [PartnerId], [PartnerNameAr], [PartnerNameEn], [PartnerLogo], [PartnerWebsite], [IsShowHomePage], [PartnerEmail] FROM [Partners]"></asp:SqlDataSource>
    </div>
    
</asp:Content>

