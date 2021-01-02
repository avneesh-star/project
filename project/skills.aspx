<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="skills.aspx.cs" Inherits="project.skills" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function validation() {
            var jp = document.getElementById('<%=ddl_jobprofile.ClientID%>');
            var sk=document.getElementById('<%=txt_skill.ClientID%>');
            if (jp.value == "0") {
                alert('Please select Job Profile first!!\n');
                return false;
            }
            else if (sk.value == "") {
                alert('Please enter skill!!\n');
                return false;
            }
            else {
                return true;
            }
        }

       
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td> Job Profile:   </td>
             <td>  <asp:DropDownList ID="ddl_jobprofile" runat="server"></asp:DropDownList>  </td>
        </tr>
        <tr>
            <td>  Skill:  </td>
             <td> <asp:TextBox ID="txt_skill" runat="server"></asp:TextBox>   </td>
        </tr>
        <tr>
            <td>    </td>
             <td>  <asp:Button ID="btn_add" Text="Add" runat="server" OnClick="btn_add_Click" OnClientClick="return validation()"/>  </td>
        </tr>
        <tr>
            <td colspan="2"> 
                <asp:GridView ID="gv_skill" runat="server" AutoGenerateColumns="false" OnRowCommand="gv_skill_RowCommand" CssClass="table table-striped">
                    <Columns>
                        <asp:TemplateField HeaderText="Job Profile">
                            <ItemTemplate>
                                <%# Eval("jp_name") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Skill">
                            <ItemTemplate>
                                <%# Eval("skill_name") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                               <asp:LinkButton ID="btn_edit" Text="Edit" runat="server" CommandName="edt" CommandArgument='<%# Eval("skill_id") %>' CssClass="btn btn-link"></asp:LinkButton>
                                <asp:LinkButton ID="btn_delete" Text="Delete" runat="server" CommandName="del" CommandArgument='<%# Eval("skill_id") %>' CssClass="btn btn-link" ></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

            </td>
             
        </tr>
    </table>
</asp:Content>
