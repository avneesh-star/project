<%@ Page Title="" Language="C#" MasterPageFile="~/defalt.Master" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="project.UserRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>User Registration</title>
    <script type="text/javascript">

        function validation() {
            var msg = "";
             var pp = document.getElementById('<%=btn_save.ClientID%>');
            
            msg += checkName();
            msg += checkDob();
            msg += checkEmail();
            if (pp.value == "Register") {
                msg += checkPassword();
            }
            msg += checkGender();
            msg += checkCourse();
            msg += checkJobProfile();
            msg += checkSkill();
            msg += checkCountry();
            msg += checkstate();
            msg += checkCity();
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
        function checkDob() {
            var tt = document.getElementById('<%=txt_dob.ClientID%>');
            if (tt.value == "") {
                return 'Please enter your Date of Birth!!\n\n';
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
        function checkJobProfile() {
            var tt = document.getElementById('<%=ddl_JP.ClientID%>');
            if (tt.value == "0") {
                return 'Please select job Profile!!\n\n';
            }
            else {
                return "";
            }
        }

        function checkSkill() {
            var tt = document.getElementById('<%=cbl_skill.ClientID%>');
            var items = tt.getElementsByTagName('input');
            var res = 0;
            for (var i = 0; i < items.length; i++) {
                if (items[i].checked == true) {
                    res = 1;
                }
            }
            if (res == 0) {
                return 'Please select skills!!\n\n'
            }
            else {
                return "";
            }

        }
        function checkCountry() {
            var tt = document.getElementById('<%=ddl_country.ClientID%>');
            if (tt.value == "0") {
                return 'Please select your country!!\n\n';
            }
            else {
                return "";
            }
        }
        function checkstate() {
            var tt = document.getElementById('<%=ddl_state.ClientID%>');
            if (tt.value == "0") {
                return 'Please select your State!!\n\n';
            }
            else {
                return "";
            }
        }
        function checkCity() {
            var tt = document.getElementById('<%=ddl_city.ClientID%>');
            if (tt.value == "0") {
                return 'Please select your city!!\n\n';
            }
            else {
                return "";
            }
        }
        $(document).ready(function () {
            $('#<%= txt_dob.ClientID %>').datepicker({
                defaultDate: "-25y",
                dateFormat: "dd-mm-yy",
                yearRange: "c-80:c+40",
                inline: true,
                showAnim: 'fadeIn',
                changeMonth: true,
                changeYear: true,
                minDate: "-50y",
                maxDate: "-10y",
            });
        });


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>Name:</td>
            <td>
                <asp:TextBox ID="txt_name" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Date of Birth:</td>
            <td>
                <asp:TextBox ID="txt_dob" runat="server" ></asp:TextBox></td>
        </tr>
        <tr>
            <td>E-mail:</td>
            <td>
                <asp:TextBox ID="txt_email" runat="server" TextMode="Email"></asp:TextBox></td>
        </tr>
        <tr id="tr_password" runat="server">
            <td>Password:</td>
            <td>
                <asp:TextBox ID="txt_password" runat="server" TextMode="Password"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Gender:</td>
            <td>
                <asp:RadioButtonList ID="rbl_gender" runat="server" RepeatColumns="3">
                    <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Others" Value="3"></asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>

        <tr>
            <td>Qualification:</td>
            <td>
                <asp:DropDownList ID="ddl_course" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>Job Profile:</td>
            <td>
                <asp:DropDownList ID="ddl_JP" runat="server" OnSelectedIndexChanged="ddl_JP_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList></td>
        </tr>
        <tr id="tr_skills" runat="server">
            <td>Skills:</td>
            <td>
                <asp:CheckBoxList ID="cbl_skill" runat="server" RepeatColumns="6"></asp:CheckBoxList></td>
        </tr>
        <tr>
            <td>Country:</td>
            <td>
                <asp:DropDownList ID="ddl_country" runat="server" OnSelectedIndexChanged="ddl_country_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>State:</td>
            <td>
                <asp:DropDownList ID="ddl_state" runat="server" OnSelectedIndexChanged="ddl_state_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>City:</td>
            <td>
                <asp:DropDownList ID="ddl_city" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>Resume:</td>
            <td>
                <asp:FileUpload ID="fu_resume" runat="server" /></td>
        </tr>
        <tr>
            <td>Image</td>
            <td>
                <asp:FileUpload ID="fu_image" runat="server" /></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="btn_save" runat="server" OnClientClick="return validation()" Text="Register" OnClick="btn_save_Click" />
                <a href="Login.aspx">Log In</a>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblmsg" runat="server" Font-Bold="true"></asp:Label>
            </td>
        </tr>

    </table>
</asp:Content>
