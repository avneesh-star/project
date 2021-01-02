<%@ Page Title="" Language="C#" MasterPageFile="~/recruiter.Master" AutoEventWireup="true" CodeBehind="recruiterHome.aspx.cs" Inherits="project.recruiterHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

      <script type="text/javascript">
        function validation() {
            var msg = "";
            
            msg += checkname();
            msg += checkemail();
            msg += checkurl();
            msg += checkcp();
            msg += checkcno();
            msg += checkaddress();

            if (msg != "") {
                alert(msg);
                return false;

            }
        }
            function checkname() {
                var cn = document.getElementById('<%=txt_company_name.ClientID%>');
               
                if (cn.value == "") {
                    return "Please enter compnay Name!!\n\n";

                }
                else 
                {
                    return "";
                }
            }
            function checkemail() {
                var cn = document.getElementById('<%=txt_email.ClientID%>');
                var exp = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
                if (cn.value == "") {
                    return "Please enter compnay email!!\n\n";

                }
                else if (exp.test(cn.value))
                {
                    return "";
                }
                else {
                    return "Please enter valid mail!!\n\n";
                }
            }
            
            function checkurl() {
                var cn = document.getElementById('<%=txt_url.ClientID%>');
                if (cn.value == "") {
                    return "Please enter compnay URL!!\n\n";

                }
                else
                {
                    return "";
                }
            }
            function checkcp() {
                var cn = document.getElementById('<%=txt_contact_person.ClientID%>');
                var exp = /^[A-Za-z ]+$/;
                if (cn.value == "") {
                    return "Please enter Contact Person Name!!\n\n";

                }
                else if (exp.test(cn.value))
                {
                    return "";
                }
                else {
                    return "Only alphabets are allowed!!\n\n";
                }
            }
            function checkcno() {
                var cn = document.getElementById('<%=txt_contact_number.ClientID%>');
                if (cn.value == "") {
                    return "Please enter contact Number!!\n\n";

                }
                else
                {
                    return "";
                }
            }
            function checkaddress() {
                var cn = document.getElementById('<%=txt_address.ClientID%>');
                if (cn.value == "") {
                    return "Please enter compnay address!!\n\n";

                }
                else
                {
                    return "";
                }
            }
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
    <asp:DataList ID="dl_view" runat="server"  RepeatDirection="Horizontal" OnItemCommand="dl_view_ItemCommand" >
        <ItemTemplate>
            <table border="0" id="tbl_dl" class="table table-striped">
                
                    <tr style="text-align:center">
                        <th colspan="2">Welcome <%# Eval("compnay_name") %></th>
                    </tr>
                
                <tr>
                    <th>Company ID:</th>
                    <td><%# Eval("recruiter_id") %></td>
                </tr>
                <tr>
                    <th>Company Name:</th>
                    <td><%# Eval("compnay_name") %></td>
                </tr>
                <tr>
                    <th>E-Mail:</th>
                    <td><%# Eval("email") %></td>
                </tr>
                <tr>
                    <th>URL:</th>
                    <td><%# Eval("compnay_url")%></td>
                </tr>
                <tr>
                    <th>HR:</th>
                    <td><%# Eval("contact_person") %> </td>
                </tr>
                <tr>
                    <th>Contact No:</th>
                    <td><%# Eval("contact_number") %></td>
                </tr>
                <tr>
                    <th>Address:</th>
                    <td><%# Eval("address")%>,<%#Eval("city_name") %>,<%#Eval("state_name") %>,<%#Eval("country_name") %></td>
                </tr>
               
                <tr>
                    <th>Registration Date:</th>
                    <td><%# Eval("rdate") %></td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:LinkButton ID="btn_edit" runat="server" Text="Edit" CommandName="E" CommandArgument='<%# Eval("recruiter_id") %>'></asp:LinkButton></td>
                </tr>
                    
            </table>
        </ItemTemplate>
    </asp:DataList>
     <table id="tbl_form" runat="server" >
        <tr >
            
            <td>Compnay Name:</td>
            <td><asp:TextBox ID="txt_company_name" runat="server"></asp:TextBox></td>
                
        </tr>
        <tr >
            <td>E-mail:</td>
            <td><asp:TextBox ID="txt_email" runat="server" TextMode="Email"></asp:TextBox></td>
        </tr>
        <tr >
            <td>Compnay URL:</td>
            <td><asp:TextBox ID="txt_url" runat="server" ></asp:TextBox></td>
        </tr>
        <tr >
            <td>Contact Person:</td>
            <td><asp:TextBox ID="txt_contact_person" runat="server" ></asp:TextBox></td>
        </tr>
        <tr>
            <td>Contact Number:</td>
            <td><asp:TextBox ID="txt_contact_number" runat="server" TextMode="Number" ></asp:TextBox></td>
        </tr>
        <tr >
            <td>Address:</td>
            <td><asp:TextBox ID="txt_address" runat="server" ></asp:TextBox></td>
        </tr>
        <tr>
            <td>Country:</td>
            <td><asp:DropDownList ID="ddl_country" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_country_SelectedIndexChanged"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>State:</td>
            <td><asp:DropDownList ID="ddl_state" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_state_SelectedIndexChanged"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>City:</td>
            <td><asp:DropDownList ID="ddl_city" runat="server"></asp:DropDownList></td>
        </tr>
        <tr >
            <td></td>
            <td><asp:Button ID="btn_save" runat="server" Text="Update" OnClientClick="return  validation()" OnClick="btn_save_Click"/>
            </td>
        </tr>
         <tr>
             <td colspan="2"><asp:Label ID="lblmsg" runat="server" Font-Bold="true"></asp:Label></td>
         </tr>
    </table>
</asp:Content>
