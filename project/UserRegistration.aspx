<%@ Page Title="" Language="C#" MasterPageFile="~/defalt.Master" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="project.UserRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function validation() {
            var msg = "";
            msg += checkName();
            msg += checkEmail();
            msg += checkPassword();
            msg += checkGender();
            msg += checkCourse();
            if (msg != "") {
                alert(msg);
                return false;
            }
        }
        function checkName() {
            var tt = document.getElementById('<%=txt_name.ClientID%>');
            if (tt.value == "") {
                return 'Please enter your name!!\n\n';
            }
            else {
                return "";
            }
        }
        function checkEmail() {
            var tt = document.getElementById('<%=txt_email.ClientID%>');
            if (tt.value == "") {
                return 'Please enter your email!!\n\n';
            }
            else {
                return "";
            }
        }
        function checkPassword() {
            var tt = document.getElementById('<%=txt_password.ClientID%>');
            if (tt.value == "") {
                return 'Please enter your password!!\n\n';
            }
            else {
                return "";
            }
        }
        function checkGender() {
            var tt = document.getElementById('<%=rbl_gender.ClientID%>');
            var items = tt.getElementsByTagName('input');
            var res = 0;
            for (var i = 0; i < items.length; i++) {
                if (items[i].checked == true) {
                    res = 1;
                }
            }
            if (res == 0) {
                return 'Please select any gender!!\n\n'
            }
            else {
                return "";
            }
            
        }
        function checkCourse() {
            var tt = document.getElementById('<%=ddl_course.ClientID%>');
            if (tt.value == "0") {
                return 'Please select any course!!\n\n';
            }
            else {
                return "";
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>Name:</td>
            <td><asp:TextBox ID="txt_name" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>E-mail:</td>
            <td><asp:TextBox ID="txt_email" runat="server" TextMode="Email"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><asp:TextBox ID="txt_password" runat="server" ></asp:TextBox></td>
        </tr>
        <tr>
            <td>Gender:</td>
            <td><asp:RadioButtonList ID="rbl_gender" runat="server" RepeatColumns="3">
                <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                <asp:ListItem Text="Others" Value="3"></asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td>Course:</td>
            <td><asp:DropDownList ID="ddl_course" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button ID="btn_save" runat="server" Text="Save" OnClientClick="return validation()" OnClick="btn_save_Click" /></td>
        </tr>
        
    </table>
</asp:Content>
