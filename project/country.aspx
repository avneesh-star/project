﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="country.aspx.cs" Inherits="project.country" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function validation() {
            var msg = "";
            msg = checkcountry();
            if (msg != "") {
                alert(msg);
                return false;
            }
        }
        function checkcountry() {
            var tt = document.getElementById('<%=txt_country.ClientID%>');
            if (tt.value == "") {
                return 'Plase enter coutnry Name!!\n\n';
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
            <td>Country Name</td>
            <td>
                <asp:TextBox ID="txt_country" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="btn_save" runat="server" Text="Save" OnClientClick="return validation()" OnClick="btn_save_Click" /></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:GridView ID="gv_country" runat="server" AutoGenerateColumns="false" OnRowCommand="gv_country_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Contry ID">
                            <ItemTemplate>
                                <%# Eval("country_id") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Country Name">
                            <ItemTemplate>
                                <%# Eval("country_name") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Added On">
                            <ItemTemplate>
                                <%# Eval("abc") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btn_delete" Text="Delete" runat="server" CommandName="del" CommandArgument='<%# Eval("country_id") %>' />
                                <asp:Button ID="btn_edit" Text="Edit" runat="server" CommandName="edt" CommandArgument='<%# Eval("country_id") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
