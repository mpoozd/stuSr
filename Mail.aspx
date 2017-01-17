<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Mail.aspx.cs" Inherits="StudentServices.Mail" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="mj_lightgraytbg mj_blogsidebar mj_bottompadder80 mj_toppadder80">
        <div class="container">
            <div class="row">

                <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                    <div class="mj_sidebar_wrapper">
                        <aside class="widget widget_categories">
                            <h4 class="widget-title">Folders</h4>
                            <ul>
                                <li>
                                    <asp:LinkButton ID="lnkNew" runat="server" OnClick="lnkNew_Click">New</asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="lnkInbox" runat="server" OnClick="lnkInbox_Click">Inbox</asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="lnkSent" runat="server" OnCommand="lnkSent_Command">Sent</asp:LinkButton>
                                </li>
                            </ul>
                        </aside>

                    </div>
                </div>
                <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="mj_recent_article">

                                <div class="mj_articledata" style="margin-top: 30px; margin-bottom: 30px; text-align: left">
                                    <asp:Panel ID="pnlInbox" runat="server" Visible="true">
                                        <asp:GridView ID="gvInbox" runat="server" AutoGenerateColumns="False" DataKeyNames="EmailId" DataSourceID="sdsInbox" CssClass="mGrid" OnRowDataBound="gvInbox_RowDataBound">
                                            <Columns>
                                                <asp:BoundField DataField="ProfileName" HeaderText="From" SortExpression="ProfileName">
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="EmailId" HeaderText="EmailId" ReadOnly="True" InsertVisible="False" SortExpression="EmailId" Visible="False"></asp:BoundField>
                                                <asp:BoundField DataField="EmailType" HeaderText="EmailType" SortExpression="EmailType" Visible="False"></asp:BoundField>
                                                <asp:BoundField DataField="EmailFrom" HeaderText="EmailFrom" SortExpression="EmailFrom" Visible="False"></asp:BoundField>
                                                <asp:BoundField DataField="EmailTo" HeaderText="EmailTo" SortExpression="EmailTo" Visible="False"></asp:BoundField>
                                                <asp:BoundField DataField="EmailSubject" HeaderText="Subject" ReadOnly="True" SortExpression="EmailSubject">
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="EmailBody" HeaderText="EmailBody" ReadOnly="True" SortExpression="EmailBody" Visible="false"></asp:BoundField>
                                                <asp:BoundField DataField="EmailDate" HeaderText="Date" SortExpression="EmailDate">
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="EmailStauts" SortExpression="EmailStauts" Visible="False">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEmailStauts" runat="server" Text='<%# Bind("EmailStauts") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="View">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="btnView" runat="server" ImageUrl="../images/find.png" CssClass="iconBtn popup-trigger" ToolTip="View" PostBackUrl="~/JobDetail.aspx" />
                                                        <%--<img alt="View" src="../images/find.png" class="iconBtn popup-trigger" />--%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="sdsInbox" runat="server" ConnectionString='<%$ ConnectionStrings:StudentHubConnectionString %>' SelectCommand="SELECT        Profiles.ProfileName, Emails.EmailId, Emails.EmailType, Emails.EmailFrom, Emails.EmailTo,SUBSTRING(Emails.EmailSubject,0,80) +'..'  EmailSubject, SUBSTRING(Emails.EmailBody,0,80) +'..' EmailBody, Emails.EmailAttachment, Emails.EmailStauts, Emails.EmailDate FROM Emails INNER JOIN Profiles ON Emails.EmailFrom = Profiles.ProfileId WHERE        (Emails.EmailTo = 2) AND (Emails.EmailType = 1) "></asp:SqlDataSource>


                                    </asp:Panel>

                                    <asp:Panel ID="pnlSent" runat="server" Visible="false">
                                        <asp:GridView ID="gvSent" runat="server" AutoGenerateColumns="False" DataKeyNames="EmailId" DataSourceID="sdsSent" CssClass="mGrid">
                                            <Columns>
                                                <asp:BoundField DataField="ProfileName" HeaderText="To" SortExpression="ProfileName">
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="EmailId" HeaderText="EmailId" ReadOnly="True" InsertVisible="False" SortExpression="EmailId" Visible="False"></asp:BoundField>
                                                <asp:BoundField DataField="EmailType" HeaderText="EmailType" SortExpression="EmailType" Visible="False"></asp:BoundField>
                                                <asp:BoundField DataField="EmailFrom" HeaderText="EmailFrom" SortExpression="EmailFrom" Visible="False"></asp:BoundField>
                                                <asp:BoundField DataField="EmailTo" HeaderText="EmailTo" SortExpression="EmailTo" Visible="False"></asp:BoundField>
                                                <asp:BoundField DataField="EmailSubject" HeaderText="Subject" ReadOnly="True" SortExpression="EmailSubject">
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="EmailBody" HeaderText="EmailBody" ReadOnly="True" SortExpression="EmailBody" Visible="false"></asp:BoundField>
                                                <asp:BoundField DataField="EmailDate" HeaderText="Date" SortExpression="EmailDate">
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="EmailStauts" SortExpression="EmailStauts" Visible="False">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEmailStauts" runat="server" Text='<%# Bind("EmailStauts") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="View">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="btnView" runat="server" ImageUrl="../images/find.png" CssClass="iconBtn popup-trigger" ToolTip="View" PostBackUrl="~/JobDetail.aspx" />
                                                        <%--<img alt="View" src="../images/find.png" class="iconBtn popup-trigger" />--%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="sdsSent" runat="server" ConnectionString='<%$ ConnectionStrings:StudentHubConnectionString %>' SelectCommand="SELECT        Profiles.ProfileName, Emails.EmailId, Emails.EmailType, Emails.EmailFrom, Emails.EmailTo,SUBSTRING(Emails.EmailSubject,0,80) +'..'  EmailSubject, SUBSTRING(Emails.EmailBody,0,80) +'..' EmailBody, Emails.EmailAttachment, Emails.EmailStauts, Emails.EmailDate FROM Emails INNER JOIN Profiles ON Emails.EmailTo = Profiles.ProfileId WHERE        (Emails.EmailFrom = 2) AND (Emails.EmailType = 1) "></asp:SqlDataSource>


                                    </asp:Panel>
                                    <asp:Panel ID="pnlNew" runat="server" Visible="false">
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
