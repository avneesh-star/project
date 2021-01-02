<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="manageRecruiter.aspx.cs" Inherits="project.manageRecruiter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%= gv_recruiter.ClientID %>').DataTable({
                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]]
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        
        <tr>
            <td>
                <asp:GridView ID="gv_recruiter" runat="server" AutoGenerateColumns="False" CssClass="table-sm" OnRowCommand="gv_recruiter_RowCommand" OnRowDataBound="gv_recruiter_RowDataBound" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="Compnay ID">
                        <ItemTemplate>
                            <%# Eval("recruiter_id") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Compnay Name">
                        <ItemTemplate>
                            <%# Eval("compnay_name") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="E-mail">
                        <ItemTemplate>
                            <%# Eval("email") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="URL">
                        <ItemTemplate>
                            <%# Eval("compnay_url") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contact Person">
                        <ItemTemplate>
                            <%# Eval("contact_person") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contact Number">
                        <ItemTemplate>
                            <%# Eval("contact_number") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Address">
                        <ItemTemplate>
                            <%# Eval("address")%>,<%#Eval("city_name") %>,<%#Eval("state_name") %>,<%#Eval("country_name") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Registration Date">
                        <ItemTemplate>
                            <%# Eval("rdate") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="btn_delete" runat="server" Text='<%# Eval("status").ToString()=="1"?"Approved":"Not Approved" %>' CommandName="D" CommandArgument='<%# Eval("recruiter_id") %>'></asp:LinkButton>
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
