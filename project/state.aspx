<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="state.aspx.cs" Inherits="project.state" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Manage State</title>
    <script type="text/javascript">
        function validation() {
            var msg = "";
            msg += checkcountry();
            msg += checkstate();
            if (msg != "") {
                alert(msg);
                return false;
            }
        }
        function checkcountry() {
            var tt = document.getElementById('<%=ddl_country.ClientID%>');
            if (tt.value == "0") {
                return 'Plase enter coutnry Name!!\n\n';
            }
            else {
                return "";
            }
        }
        function checkstate() {
            var tt = document.getElementById('<%=txt_state.ClientID%>');
            if (tt.value == "") {
                return 'Plase enter state Name!!\n\n';
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
            <td>Country:</td>
            <td>
                <asp:DropDownList ID="ddl_country" runat="server"></asp:DropDownList></td>
        </tr>
         <tr>
            <td>State:</td>
            <td>
                <asp:TextBox ID="txt_state" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="btn_save" runat="server" Text="Save" OnClientClick="return validation()" OnClick="btn_save_Click" /></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:GridView ID="gv_state" runat="server" AutoGenerateColumns="False" OnRowCommand="gv_state_RowCommand" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <%# Eval("state_id") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="State">
                            <ItemTemplate>
                                <%# Eval("state_name") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Country">
                            <ItemTemplate>
                                <%# Eval("country_name") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Added On">
                            <ItemTemplate>
                                <%# Convert.ToDateTime(Eval("inserted_date")).ToShortDateString() %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btn_delete" Text="Delete" runat="server" CommandName="del" CommandArgument='<%# Eval("state_id") %>' />
                                <asp:Button ID="btn_edit" Text="Edit" runat="server" CommandName="edt" CommandArgument='<%# Eval("state_id") %>' />
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
