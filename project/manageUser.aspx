<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="manageUser.aspx.cs" Inherits="project.manageUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%= gv_user.ClientID %>').DataTable();
        });
    </script>
    <title>Manage User</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        
        <tr>
            <td>
                <asp:GridView ID="gv_user" runat="server" AutoGenerateColumns="False"  OnRowCommand="gv_user_RowCommand" CssClass="table-sm" OnRowDataBound="gv_user_RowDataBound" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="User ID">
                        <ItemTemplate>
                            <%# Eval("user_id") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User Name">
                        <ItemTemplate>
                            <%# Eval("user_name") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User E-mail">
                        <ItemTemplate>
                            <%# Eval("user_email") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User Gender">
                        <ItemTemplate>
                            <%# Eval("user_gender").ToString()=="1"?"Male":Eval("user_gender").ToString()=="2"?"Female":"Others" %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User Course">
                        <ItemTemplate>
                            <%# Eval("course_name") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="User Resume">
                        <ItemTemplate>
                            <asp:LinkButton ID="btn2" runat="server" Text='<%# Eval("user_resume") %>' CommandName="T" CommandArgument='<%# Eval("user_resume") %>'></asp:LinkButton>
                        </ItemTemplate>
                        
                    </asp:TemplateField>
                     
                    <asp:TemplateField HeaderText="User Image">
                        <ItemTemplate>
                            <asp:Image ID="img1" runat="server" ImageUrl='<%# Eval("user_image","~/photo/{0}") %>' Width="50px" Height="40px"  />
                        </ItemTemplate>
                        </asp:TemplateField>
                    <asp:TemplateField HeaderText="Registration Date">
                        <ItemTemplate>
                            <%# Eval("abc") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="btn_delete" runat="server" Text='<%# Eval("user_status").ToString()=="1"?"Approved":"Not Approved" %>' CommandName="D" CommandArgument='<%# Eval("user_id") %>'></asp:LinkButton>
                            </ItemTemplate>
                    </asp:TemplateField>
                            
                </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"  />
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
