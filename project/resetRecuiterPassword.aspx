<%@ Page Title="" Language="C#" MasterPageFile="~/defalt.Master" AutoEventWireup="true" CodeBehind="resetRecuiterPassword.aspx.cs" Inherits="project.resetRecuiterPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <table>
        <tr>
            <td>Enter New Password:</td>
            <td>

                <asp:TextBox ID="txtNewpass" CssClass="form-control" runat="server" ValidationGroup="AA"  Display="None" TextMode="Password"></asp:TextBox>
               
            </td>
        </tr>
        <tr>
            <td>Confirm New Password:</td>
            <td>

                <asp:TextBox ID="txtCnewpass" CssClass="form-control" runat="server"  ValidationGroup="AA" Display="None" TextMode="Password"></asp:TextBox>
               
               
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="btn_rest" CssClass="btn  btn-primary btn-block " runat="server"   Text="Reset Password" OnClick="btn_rest_Click"  />
                 <a class="btn  btn-danger btn-block" href="Login.aspx">Back to Login</a>
            </td>
        </tr>
        <tr>
            <td colspan="2">
               
                <asp:Label ID="lblMsg" runat="server"></asp:Label></td>
        </tr>
    </table>
</asp:Content>
