<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="bloodgroup.aspx.cs" Inherits="project.bloodgroup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function validation() {
            var bg = document.getElementById('<%=txt_bloodgroup.ClientID%>');
            if (bg.value == "") {
                alert('Please enter blood group !!\n\n');
                return false;
            }
            else {
                return true
            }

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>Blood Group</td>
            <td><asp:TextBox ID="txt_bloodgroup" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:button ID="btn_save" Text="Save" OnClientClick="return validation()" OnClick="btn_save_Click" runat="server" /></td>
        </tr>
    </table>
    
    <asp:GridView ID="gv_bloodgroup" runat="server" AutoGenerateColumns="False" OnRowCommand="gv_bloodgroup_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText=" ID">
                <ItemTemplate>
                    <%# Eval("bg_id") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Blood Group">
                <ItemTemplate>
                    <%# Eval("bg_name") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Added Date">
                <ItemTemplate>
                    <%# Convert.ToDateTime(Eval("inserted_date")).ToShortDateString() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField >
                <ItemTemplate>
                   <asp:LinkButton ID="btn_edit" runat="server" Text="Edit" CommandName="E" CommandArgument='<%# Eval("bg_id") %>'></asp:LinkButton>
                    <asp:LinkButton ID="btn_delete" runat="server" Text="Delete" CommandName="D" CommandArgument='<%# Eval("bg_id") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            
        </Columns>

        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />

    </asp:GridView>
</asp:Content>
