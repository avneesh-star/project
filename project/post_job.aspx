<%@ Page Title="" Language="C#" MasterPageFile="~/recruiter.Master" AutoEventWireup="true" CodeBehind="post_job.aspx.cs" Inherits="project.post_job" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Post Job
    </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>Job Profile:</td>
            <td><asp:DropDownList ID="ddl_job_profile" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>Min Exp:</td>
            <td><asp:TextBox ID="txt_min_exp" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Max Exp:</td>
            <td><asp:TextBox ID="txt_max_exp" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Min Salary:</td>
            <td><asp:TextBox ID="txt_min_salary" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Max Salary:</td>
            <td><asp:TextBox ID="txt_max_salary" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>No. of vacancies</td>
            <td><asp:TextBox ID="txt_vacancy" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Comment:</td>
            <td><asp:TextBox ID="txt_comment" runat="server" TextMode="MultiLine" Rows="5" Columns="50"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button ID="btn_post" Text="Post" runat="server" OnClick="btn_post_Click" /></td>
        </tr>
    </table>
</asp:Content>
