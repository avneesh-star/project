<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="changeUserPassword.aspx.cs" Inherits="project.changeUserPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>Change Password</title>
    <script type="text/javascript">
        function validation() {
            var msg = "";
            msg+=checkOldpass();
            msg+=checkNewpass();
            msg+=checkCNewpass();
            if (msg != "") {
                alert(msg);
                return false;
            }
        }
        function checkOldpass()
        {
            var tp = document.getElementById('<%=txt_oldpassword.ClientID%>');
            if (tp.value == "") {
                return 'Please enter old Password!\n\n';
            }
            else {
                return "";
            }
        }
        function checkNewpass() {
            var tp = document.getElementById('<%=txt_newpassword.ClientID%>');
            if (tp.value == "") {
                return 'Please enter new Password!\n\n';
            }
            else {
                return "";
            }
        }
        function checkCNewpass() {
            var tp = document.getElementById('<%=txt_cnewpassword.ClientID%>');
            var tpc = document.getElementById('<%=txt_newpassword.ClientID%>');
            if (tp.value == "") {
                return 'Please confirm new Password!\n\n';
            }
            else if (tp.value == tpc.value) {
                return "";
            }
            else {
                return 'Password not mateched!!\n\n';
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>Old Password:</td>
            <td><asp:Textbox id ="txt_oldpassword" runat="server" placeholder="Old Password"></asp:Textbox></td>
        </tr>
        <tr>
            <td>New Password:</td>
            <td><asp:Textbox id ="txt_newpassword" runat="server" placeholder="New Password"></asp:Textbox></td>
        </tr>
        <tr>
            <td> Confirm New Password:</td>
            <td><asp:Textbox id ="txt_cnewpassword" runat="server" placeholder="Confirm New Password"></asp:Textbox></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:button id="btn_cangepass" runat="server" text="Change Password" OnClientClick="return validation()" OnClick="btn_cangepass_Click" /></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Label ID="lal_msg" runat="server" Font-Bold="true"></asp:Label></td>
        </tr>
    </table>
</asp:Content>
