<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hashTest.aspx.cs" Inherits="project.hashTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:TextBox ID="txtpass" runat="server"></asp:TextBox>
        <asp:Button ID="btnsave" Text="save" runat="server" OnClick="btnsave_Click" /><br />
        <asp:Label ID="lbl2" runat="server"></asp:Label><br />
         <asp:Label ID="lbl1" runat="server"></asp:Label><br /><br /><br /><br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" Text="save" runat="server" OnClick="Button1_Click" /><br />
       
        
        <asp:Label ID="lbl3" runat="server"></asp:Label><br />
        <asp:Label ID="lbl4" runat="server"></asp:Label><br />
        <asp:Label ID="lbl5" runat="server"></asp:Label><br />
        <asp:Label ID="lbl6" runat="server"></asp:Label><br />
    </div>
    </form>
</body>
</html>
