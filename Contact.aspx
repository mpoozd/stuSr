<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="StudentServices.Contact" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mj_mapmarker">
        <div id="map"></div>
    </div>
    <div class="mj_lightgraytbg mj_bottompadder80">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="mj_contact_info mj_bottompadder80">
                        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0">
                            <div class="mj_mainheading mj_toppadder80 mj_bottompadder50">
                                <h1>c<span>ontact</span> i<span>nformation</span></h1>
                            </div>
                        </div>
                        <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1">
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                    <div class="mj_contact_detail_img">
                                        <img src="images/contact_icon1.jpg" alt="marker" />
                                    </div>
                                    <div class="mj_contact_detail">
                                        <p>Meshjob, Street Name 6901,</p>
                                        <p>Melbourne Australia</p>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                    <div class="mj_contact_detail_img">
                                        <img src="images/contact_icon2.jpg" alt="marker" />
                                    </div>
                                    <div class="mj_contact_detail">
                                        <p>+440 875369208 - Office</p>
                                        <p>+440 353363114 - Fax</p>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                    <div class="mj_contact_detail_img">
                                        <img src="images/contact_icon3.jpg" alt="marker" />
                                    </div>
                                    <div class="mj_contact_detail">
                                        <p>
                                            <a href="#">support@sitename.com</a>
                                        </p>
                                        <p>
                                            <a href="#">info@sitename.com</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="mj_contact_form">
                        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0">
                            <div class="mj_mainheading mj_toppadder80 mj_bottompadder50">
                                <h1>f<span>eed</span> b<span>ack</span></h1>
                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.</p>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-10 col-lg-offset-3 col-md-offset-3 col-sm-offset-3 col-xs-offset-1">
                            <div class="row">
                                <form class="mj_bottompadder80">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Name"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Please Enter Name" CssClass="validator" ValidationGroup="ContactUs" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="Email Address"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Please Enter Email Address" CssClass="validator" ValidationGroup="ContactUs" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email is incorrect" CssClass="validator" ValidationGroup="ContactUs" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtemail"></asp:RegularExpressionValidator>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Subject"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ErrorMessage="Please Enter Email Address" CssClass="validator" ValidationGroup="ContactUs" ControlToValidate="txtSubject"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control tr_textarea" placeholder="Message" TextMode="MultiLine" Height="100px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ErrorMessage="Please Enter Email Address" CssClass="validator" ValidationGroup="ContactUs" ControlToValidate="txtMessage"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label id="lblMsg" runat="server" style="color: #00CA00; font-weight: bold"></label>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="mj_showmore">
                            <asp:LinkButton ID="btnSend" runat="server" OnClick="btnSend_Click" CssClass="mj_showmorebtn mj_bluebtn" ValidationGroup="ContactUs">send a message</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


