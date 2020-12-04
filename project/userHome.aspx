<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="userHome.aspx.cs" Inherits="project.userHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <asp:GridView ID="gv_user" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" OnRowCommand="gv_user_RowCommand" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
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
                    <asp:TemplateField HeaderText="Registration Date">
                        <ItemTemplate>
                            <%# Eval("abc") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                   <%-- <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="btn_delete" runat="server" Text="Delete" CommandName="D" CommandArgument='<%# Eval("user_id") %>'></asp:LinkButton>
                            </ItemTemplate>
                    </asp:TemplateField>--%>
                            <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="btn_edit" runat="server" Text="Edit" CommandName="E" CommandArgument='<%# Eval("user_id") %>'></asp:LinkButton>
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
