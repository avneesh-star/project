<%@ Page Title="" Language="C#" MasterPageFile="~/defalt.Master" AutoEventWireup="true" CodeBehind="addRecruiter.aspx.cs" Inherits="project.addRecruiter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Recruiter Registration</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <table >
        <tr >
            
            <td>Compnay Name:</td>
            <td><asp:TextBox ID="txt_company_name" runat="server"></asp:TextBox></td>
                
        </tr>
        <tr >
            <td>E-mail:</td>
            <td><asp:TextBox ID="txt_email" runat="server" TextMode="Email"></asp:TextBox></td>
        </tr>
       
        <tr id="pass_row" runat="server">
            <td>Password:</td>
            <td><asp:TextBox ID="txt_password" runat="server" ></asp:TextBox></td>
        </tr>
           
        <tr >
            <td>Compnay URL:</td>
            <td><asp:TextBox ID="txt_url" runat="server" ></asp:TextBox></td>
        </tr>
        <tr >
            <td>Contact Person:</td>
            <td><asp:TextBox ID="txt_contact_person" runat="server" ></asp:TextBox></td>
        </tr>
        <tr>
            <td>Contact Number:</td>
            <td><asp:TextBox ID="txt_contact_number" runat="server" TextMode="Number" ></asp:TextBox></td>
        </tr>
        <tr >
            <td>Address:</td>
            <td><asp:TextBox ID="txt_address" runat="server" ></asp:TextBox></td>
        </tr>
        <tr>
            <td>Country:</td>
            <td><asp:DropDownList ID="ddl_country" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_countyr_SelectedIndexChanged"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>State:</td>
            <td><asp:DropDownList ID="ddl_state" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_state_SelectedIndexChanged"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>City:</td>
            <td><asp:DropDownList ID="ddl_city" runat="server"></asp:DropDownList></td>
        </tr>
        <tr >
            <td></td>
            <td><asp:Button ID="btn_save" runat="server" Text="Register" OnClientClick="return validation()" OnClick="btn_save_Click"  />
               <a href="Login.aspx">LogIn</a>
                
            </td>
        </tr>
        <tr >
            <td></td>
            <td><asp:Label ID="lblmsg" runat="server" Font-Bold="false"></asp:Label></td>
        </tr>
        
    </table>
        
    <script type="text/javascript">
        function validation() {
            var msg = "";
            
            msg += checkname();
            msg += checkemail();
            msg += checkpassword();
            msg += checkurl();
            msg += checkcp();
            msg += checkcno();
            msg += checkaddress();

            if (msg != "") {
                alert(msg);
                return false;

            }
        }
            function checkname() {
                var cn = document.getElementById('<%=txt_company_name.ClientID%>');
               
                if (cn.value == "") {
                    return "Please enter compnay Name!!\n\n";

                }
                else 
                {
                    return "";
                }
            }
            function checkemail() {
                var cn = document.getElementById('<%=txt_email.ClientID%>');
                var exp = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
                if (cn.value == "") {
                    return "Please enter compnay email!!\n\n";

                }
                else if (exp.test(cn.value))
                {
                    return "";
                }
                else {
                    return "Please enter valid mail!!\n\n";
                }
            }
            function checkpassword() {
                var cn = document.getElementById('<%=txt_password.ClientID%>');
                if (cn.value == "") {
                    return "Please enter password!!\n\n";

                }
                else
                {
                    return "";
                }
            }
            function checkurl() {
                var cn = document.getElementById('<%=txt_url.ClientID%>');
                if (cn.value == "") {
                    return "Please enter compnay URL!!\n\n";

                }
                else
                {
                    return "";
                }
            }
            function checkcp() {
                var cn = document.getElementById('<%=txt_contact_person.ClientID%>');
                var exp = /^[A-Za-z ]+$/;
                if (cn.value == "") {
                    return "Please enter Contact Person Name!!\n\n";

                }
                else if (exp.test(cn.value))
                {
                    return "";
                }
                else {
                    return "Only alphabets are allowed!!\n\n";
                }
            }
            function checkcno() {
                var cn = document.getElementById('<%=txt_contact_number.ClientID%>');
                if (cn.value == "") {
                    return "Please enter contact Number!!\n\n";

                }
                else
                {
                    return "";
                }
            }
            function checkaddress() {
                var cn = document.getElementById('<%=txt_address.ClientID%>');
                if (cn.value == "") {
                    return "Please enter compnay address!!\n\n";

                }
                else
                {
                    return "";
                }
            }
        
    </script>
</asp:Content>
