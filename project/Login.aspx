<%@ Page Title="" Language="C#" MasterPageFile="~/defalt.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="project.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Login</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td></td>
            <td ><span style="color:rebeccapurple;font-size:large"><%=Session["msg"] %> </span></td>
        </tr>
        <tr >
            <td >User Type:</td>
            <td ><asp:DropDownList CssClass="form-control" ID="ddl_user_type" runat="server">
                <asp:ListItem Text="Select User Type" Value="0"></asp:ListItem>
                <asp:ListItem Text="Admin" Value="1"></asp:ListItem>
                <asp:ListItem Text="User" Value="2"></asp:ListItem>
                <asp:ListItem Text="Recruiter" Value="3"></asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr >
            <td >E-mail:</td>
            <td ><asp:TextBox ID="txt_email" CssClass="form-control" runat="server" placeholder="User Email" ></asp:TextBox></td>
        </tr>
        <tr >
            <td >Password:</td>
            <td ><asp:TextBox ID="txt_password" CssClass="form-control" runat="server" placeholder="Password" ></asp:TextBox></td>
        </tr>
        <tr >
            <td></td>
            <td colspan="2"><asp:Button ID="btn_login" Text="Sign In" CssClass="btn btn-primary btn-lg btn-block" runat="server" OnClick="btn_login_Click" />
                <%--<a href="UserRegistration.aspx">User SignUp</a>
                <a href="addRecruiter.aspx">Recruiter SignUp</a>--%>
            </td>
        </tr>
        <tr>
            <td colspan="2"><asp:Label ID="lbl_msg" runat="server" ></asp:Label></td>
        </tr>
         <tr>
            <td colspan="2"><a href="forgotpassword.aspx">Forgot Password</a></td>
        </tr>
    </table>
</asp:Content>
