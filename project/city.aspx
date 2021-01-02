<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="city.aspx.cs" Inherits="project.city" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Manage City</title>
    <script type="text/javascript">
        
        function validation() {
            var msg = "";
            msg += checkcountry();
            msg += checkstate();
            msg += checkcity();
            if (msg != "") {
                alert(msg);
                return false;
            }
        }
        function checkcountry() {
            var tt = document.getElementById('<%=ddl_country.ClientID%>');
            if (tt.value == "0") {
                return 'Please select Country!!\n\n';
            }
            else {
                return "";
            }
        }
        function checkstate() {
            var tt = document.getElementById('<%=ddl_state.ClientID%>');
            if (tt.value == "0") {
                return 'Please select State!!\n\n';
            }
            else {
                return "";
            }
        }

        function checkcity() {
            var tt = document.getElementById('<%=txt_city.ClientID%>');
            if (tt.value == "") {
                return 'Please enter city name!!\n\n';
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
            <td><asp:DropDownList ID="ddl_country" runat="server" OnSelectedIndexChanged="ddl_country_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>State:</td>
            <td><asp:DropDownList ID="ddl_state" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>City:</td>
            <td><asp:TextBox ID="txt_city" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button ID="btn_save" runat="server" Text="Save" OnClientClick="return validation()" OnClick="btn_save_Click" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="gv_city" runat="server" AutoGenerateColumns="False" OnRowCommand="gv_city_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <%#Eval("city_id") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="City">
                            <ItemTemplate>
                                <%#Eval("city_name") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="State">
                            <ItemTemplate>
                                <%#Eval("state_name") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Country">
                            <ItemTemplate>
                                <%#Eval("country_name") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Added On">
                            <ItemTemplate>
                                <%#Convert.ToDateTime(Eval("inserted_date").ToString()).ToShortDateString() %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btn_delete" Text="Delete" runat="server" CommandName="del" CommandArgument='<%# Eval("city_id") %>' />
                                <asp:Button ID="btn_edit" Text="Edit" runat="server" CommandName="edt" CommandArgument='<%# Eval("city_id") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>

            </td> 
        </tr>
    </table>
 </asp:Content>
