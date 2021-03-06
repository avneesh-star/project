﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="course.aspx.cs" Inherits="project.course" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Course Master</title>
    <script type="text/javascript">
        function validation() {
            var msg = "";
            msg = checkcourse();
            if (msg != "") {
                alert(msg);
                return false;
            }
        }
        function checkcourse() {
            var tt = document.getElementById('<%=txt_course.ClientID%>');
            if (tt.value=="") {
                return 'Plase enter course Name!!\n\n';
            }
            else
            {
                return "";
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>Course</td>
            <td>
                <asp:TextBox ID="txt_course" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="btn_save" runat="server" Text="Save" OnClientClick="return validation()" OnClick="btn_save_Click" /></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:GridView ID="gv_course" runat="server" AutoGenerateColumns="False" OnRowCommand="gv_course_RowCommand" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Course ID">
                            <ItemTemplate>
                                <%# Eval("course_id") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Course Name">
                            <ItemTemplate>
                                <%# Eval("course_name") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Added On">
                            <ItemTemplate>
                                <%# Eval("abc") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btn_delete" Text="Delete" runat="server" CommandName="del" CommandArgument='<%# Eval("course_id") %>' />
                                <asp:Button ID="btn_edit" Text="Edit" runat="server" CommandName="edt" CommandArgument='<%# Eval("course_id") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
