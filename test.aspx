<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="StudentServices.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:StudentHubConnectionString %>' SelectCommand="SELECT [PennerId], [PennerTitle], [PennerSubTitle], [PennerImage] FROM [Penner]"></asp:SqlDataSource>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">

                <ItemTemplate>

                    <asp:Button ID="Button1" runat="server" Text="Button" />

                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("PennerTitle") %>'></asp:Label>
                </ItemTemplate>
            </asp:Repeater>
            <br />
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" DataKeyNames="PennerId">
                <Columns>
                    <asp:BoundField DataField="PennerId" HeaderText="PennerId" InsertVisible="False" ReadOnly="True" SortExpression="PennerId" />
                    <asp:BoundField DataField="PennerTitle" HeaderText="PennerTitle" SortExpression="PennerTitle" />
                    <asp:BoundField DataField="PennerSubTitle" HeaderText="PennerSubTitle" SortExpression="PennerSubTitle" />
                    <asp:TemplateField HeaderText="PennerImage" SortExpression="PennerImage">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PennerImage") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("PennerImage") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StudentHubConnectionString %>" SelectCommand="SELECT [PennerId], [PennerTitle], [PennerSubTitle], [PennerImage] FROM [Penner]"></asp:SqlDataSource>
            <br />
        </div>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </form>
</body>
</html>
