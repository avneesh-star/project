<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="jobProfile.aspx.cs" Inherits="project.jobProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Manage Job Profile</title>
    <script type="text/javascript">
        function validation() {
            var jpId = document.getElementById('<%=txt_jobprofile.ClientID%>');
            if (jpId.value == "") {
                alert('Please enter job profile!!\n\n');
                return false;
            }
            else {
                return true;
            }
            
        }
    </script>
    <title>Mange Job Profile</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table >
        <tr>
            <td>Job Profile:</td>
            <td><asp:TextBox ID="txt_jobprofile" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button ID="btn_save" runat="server" Text="Add" OnClick="btn_save_Click" CssClass="btn btn-info" OnClientClick="return validation()" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="gv_jobProfile" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="gv_jobProfile_RowCommand">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <%# Eval("jp_id") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Job Profile">
                            <ItemTemplate>
                                <%# Eval("jp_name") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Added Date">
                            <ItemTemplate>
                                <%# Eval("abc") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate> 
                                <asp:LinkButton ID="btn_edit" Text="Edit" CssClass="btn btn-link" runat="server" CommandName="edt" CommandArgument='<%# Eval("jp_id") %>' ></asp:LinkButton>
                                <asp:LinkButton ID="btn_delete" Text="Delete" CssClass="btn btn-link" runat="server" CommandName="del" CommandArgument='<%# Eval("jp_id") %>' ></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>

            </td>
        </tr>
    </table>
</asp:Content>
