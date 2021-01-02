<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="userHome.aspx.cs" Inherits="project.userHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            $(".txtDOB").datepicker({
                defaultDate: "-25y",
                dateFormat: "dd-mm-yy",
                yearRange: "c-80:c+40",
                inline: true,
                showAnim: 'fadeIn',
                changeMonth: true,
                changeYear: true,
                minDate: "-50y",
                maxDate: "-10y",
            });
        });
    </script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <h1>Hello
        <asp:Label ID="lblname" Text='<%# Eval("User_name") %>' runat="server"></asp:Label></h1>
    <asp:Repeater ID="dl_user" runat="server" OnItemCommand="dl_user_ItemCommand">
        <HeaderTemplate>
            <table border="0">
        </HeaderTemplate>
        
        <ItemTemplate>
            
                <tr>
                    <th>User Name:</th>
                    <td>
                        <asp:Label ID="lblempid" runat="server" Text='<%# Eval("User_name") %>'>  
                        </asp:Label>
                    </td>
                    <td rowspan="5">
                        <asp:Image ID="empimg" runat="server" ImageUrl='  
                                        <%# "~/photo/" + Eval("user_image") %>'
                            Height="140px" Width="160px" />
                        <asp:Label ID="lblimg" runat="server" Text='<%#Eval("user_image") %>' Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <th>Date Of Birth:    </th>
                    <td>
                        <asp:Label ID="lblempname" runat="server" Text='<%# Convert.ToDateTime(Eval("user_dob").ToString()).ToShortDateString() %>'>  
                        </asp:Label>
                    </td>
                </tr>
                <tr>
                    <th>Gender: 
                    </th>
                    <td>
                        <asp:Label ID="lblmbnum" runat="server" Text='<%# Eval("user_gender").ToString()=="1"?"Male":Eval("user_gender").ToString()=="1"?"Female":"Others"  %>'>  
                        </asp:Label>
                    </td>
                </tr>
                <tr>
                    <th> EmailId:  
                    </th>
                    <td>
                        <asp:Label ID="lblemailid" runat="server" Text='<%# Eval("user_email") %>'>  
                        </asp:Label>
                    </td>
                </tr>
                 <tr>
                    <th> Qualification:  
                    </th>
                    <td>
                        <asp:Label ID="lblquali" runat="server" Text='<%# Eval("course_name") %>'>  
                        </asp:Label>
                    </td>
                </tr>
                <tr>
                    <th> Address:  
                    </th>
                    <td colspan="2">
                        <asp:Label ID="lbladdress" runat="server" Text='<%# Eval("city_name") %>'>  
                        </asp:Label>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("state_name") %>'>  
                        </asp:Label>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("country_name") %>'>  
                        </asp:Label>
                    </td>
                </tr>
                <tr>
                    <th> Job Profile:  
                    </th>
                    <td colspan="2">
                        <asp:Label ID="lblJP" runat="server" Text='<%# Eval("jp_name") %>'>  
                        </asp:Label>
                    </td>
                </tr>
                <tr>
                    <th> Skills:  
                    </th>
                    <td colspan="2">
                        <asp:Label ID="lblskill" runat="server" Text='<%# Eval("user_skill") %>'>  
                        </asp:Label>
                    </td>
                </tr>
                <tr>
                    <th>Resume</th>
                    <td colspan="2"><asp:LinkButton ID="btnrsm" runat="server" CommandName="rsm" CommandArgument='<%# Eval("user_resume") %>' Text='<%# Eval("user_resume") %>'></asp:LinkButton>
                        <asp:Label ID="Lblrsm" runat="server" Text='<%#Eval("user_resume") %>' Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: right">
                        <asp:Button ID="btn_edit" runat="server" CommandName="edt" Text="Edit" CssClass="btn btn-outline-info"  />
                        <asp:Button ID="btn_delete" runat="server" OnClientClick="return confirm('are you sure you want to delete ?')"  Text="Delete" CommandName="del" CssClass="btn btn-outline-danger" />
                    </td>
                </tr>
           
        </ItemTemplate>
        <FooterTemplate>
             </table>
        </FooterTemplate>
    </asp:Repeater>

   
</asp:Content>
