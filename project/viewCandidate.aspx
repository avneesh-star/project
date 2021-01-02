<%@ Page Title="" Language="C#" MasterPageFile="~/recruiter.Master" AutoEventWireup="true" CodeBehind="viewCandidate.aspx.cs" Inherits="project.viewCandidate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
        $(document).ready(function () {
            $('#<%= grd_viewC.ClientID %>').DataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                 <asp:GridView ID="grd_viewC" runat="server" AutoGenerateColumns="false" OnRowCommand="grd_viewC_RowCommand"  OnRowDataBound="grd_viewC_RowDataBound" CssClass="table-sm">
        <Columns>
            <asp:TemplateField HeaderText="Sr.No.">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Candidate Name">
                        <ItemTemplate>
                            <%# Eval("user_name") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Candidate E-mail">
                        <ItemTemplate>
                            <%# Eval("user_email") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Candidate Gender">
                        <ItemTemplate>
                            <%# Eval("user_gender").ToString()=="1"?"Male":Eval("user_gender").ToString()=="2"?"Female":"Others" %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Candidate Course">
                        <ItemTemplate>
                            <%# Eval("course_name") %>
                        </ItemTemplate>
                    </asp:TemplateField>
            <asp:TemplateField HeaderText="Candidate Skills">
                        <ItemTemplate>
                            <%# Eval("user_skill") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Candidate Resume">
                        <ItemTemplate>
                            <asp:LinkButton ID="btn2" runat="server" Text='<%# Eval("user_resume").ToString().Remove(0,18) %>' CommandName="T" CommandArgument='<%# Eval("user_resume") %>'></asp:LinkButton>
                        </ItemTemplate>
                        
                    </asp:TemplateField>
                     
                    <asp:TemplateField HeaderText="Candidate Image">
                        <ItemTemplate>
                            <asp:Image ID="img1" runat="server" ImageUrl='<%# Eval("user_image","~/photo/{0}") %>' Width="50px" Height="40px"  />
                        </ItemTemplate>
                        </asp:TemplateField>
        </Columns>
    </asp:GridView>
            </td>
        </tr>
     </table>
   
</asp:Content>
