<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="manageJob.aspx.cs" Inherits="project.manageJob" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%= gv_PostedJob.ClientID %>').DataTable();
        });
    </script>
    <title>Manage jobs</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td style="text-align:center">
                <asp:GridView ID="gv_PostedJob" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="gv_PostedJob_RowCommand" CssClass="table-sm" OnRowDataBound="gv_PostedJob_RowDataBound" >
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="Job Title">
                            <ItemTemplate>
                                <%#Eval("jp_name") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Company">
                            <ItemTemplate>
                                <%#Eval("compnay_name") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Required Exp">
                            <ItemTemplate>
                                <%#Eval("min_exp") %>Year-<%#Eval("max_exp") %>Year
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Offered Salary">
                            <ItemTemplate>
                                Rs.<%#Eval("min_salary") %>-Rs<%#Eval("max_salary") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                       
                        <asp:TemplateField HeaderText="No of Position">
                            <ItemTemplate>
                                <%#Eval("vacancies") %>Positions
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Comment">
                            <ItemTemplate>
                                <%#Eval("comment") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Posted On">
                            <ItemTemplate>
                                <%#Convert.ToDateTime(Eval("added_date").ToString()).ToShortDateString() %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="btn_approve" runat="server" Text='<%#Eval("job_status").ToString()=="0"?"Not Approved":"Approved" %>' CommandArgument='<%#Eval("job_id") %>' CommandName="A" CssClass="btn btn-link"></asp:LinkButton>
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
