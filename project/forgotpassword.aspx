<%@ Page Title="" Language="C#" MasterPageFile="~/defalt.Master" AutoEventWireup="true" CodeBehind="forgotpassword.aspx.cs" Inherits="project.forgotpassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
	<div class="container padding-bottom-3x mb-2 mt-5">
	    <div class="row justify-content-center">
	       <div class="col-lg-4 col-md-10">
	            <div class="row">
                    <div class="col">
                        <h6>Forgot your password?</h6>
                    </div>
	                
	            </div>
	           
	                <div class="card-body">
                        
                        <div class="form-group"> 
                            <asp:Label ID="lbltype" AssociatedControlID="ddl_user_type" runat="server" Text="User type"></asp:Label> 
                            <asp:DropDownList CssClass="form-control" ID="ddl_user_type" runat="server">
                                <asp:ListItem Text="Select User Type" Value="0"></asp:ListItem>
                                <asp:ListItem Text="User" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Recruiter" Value="3"></asp:ListItem>
                                </asp:DropDownList>
                            <small class="form-text text-muted"></small> </div>
	                </div>
	                    <div class="form-group"> 
                             
                            <asp:Label ID="Label1" AssociatedControlID="txt_mail" runat="server" Text="Enter your email address"></asp:Label> 
                            <asp:TextBox  CssClass="form-control" runat="server"  id="txt_mail"></asp:TextBox>
                            <small class="form-text text-muted"></small>

	                    </div>
	                
                         <asp:Button ID="btn_send" CssClass="btn btn-success" Text="Send Link" runat="server" OnClick="btn_send_Click"></asp:Button>
                        
               <a class="btn btn-danger" href="Login.aspx">Back to Login</a>
               <div class="form-group">
                   <asp:Label ID="lbl_msg" runat="server"></asp:Label>
               </div>	              

	       </div>
	            
	        </div>
	    </div>
	

            
          
   
</asp:Content>
