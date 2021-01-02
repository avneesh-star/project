<%@ Page Title="" Language="C#" MasterPageFile="~/recruiter.Master" AutoEventWireup="true" CodeBehind="managePostedJob.aspx.cs" Inherits="project.managePostedJob" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Manage Posted Job</title>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%= gv_posted_job.ClientID %>').DataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <table>
        <tr>
            <td>
                 <a href="post_job.aspx"><h3>Post New Job</h3></a>
            </td>
        </tr>
        <tr>

            <td>

            
    <asp:GridView ID="gv_posted_job" runat="server" AutoGenerateColumns="False" CssClass=" table table-striped table-sm" OnRowCommand="gv_posted_job_RowCommand" OnRowDataBound="gv_posted_job_RowDataBound" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Job Profile">
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
                                <%#Eval("min_exp") %>year-<%#Eval("max_exp") %>year
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Offered Salary">
                            <ItemTemplate>
                                Rs.<%#Eval("min_salary") %>-Rs<%#Eval("max_salary") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="No of Positions">
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
                                <asp:LinkButton ID="btn_edit" Text="Edit" CommandName="edt" CommandArgument='<%# Eval("job_id") %>' runat="server" CssClass="btn btn-link"></asp:LinkButton>
                                <asp:LinkButton ID="btn_delete" Text="Delete" OnClientClick="return confirm('Do want to delete!!')" CommandName="del" CommandArgument='<%# Eval("job_id") %>' runat="server" CssClass="btn btn-link"></asp:LinkButton>
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
