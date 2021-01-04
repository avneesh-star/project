<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="adminHome.aspx.cs" Inherits="project.adminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container bootstrap snippet">
  <div class="row">
    <div class="col-lg-2 col-sm-6">
      <div class="circle-tile ">
        <a href="#"><div class="circle-tile-heading dark-blue"><i class="fa fa-users fa-fw fa-3x"></i></div></a>
        <div class="circle-tile-content dark-blue">
          <div class="circle-tile-description text-faded">Registered Recruiter</div>
          <div class="circle-tile-number text-faded "><asp:Label ID="lbl_rec_count" runat="server"></asp:Label></div>
          
        </div>
      </div>
    </div>
     
    <div class="col-lg-2 col-sm-6">
      <div class="circle-tile ">
        <a href="#"><div class="circle-tile-heading red"><i class="fa fa-users fa-fw fa-3x"></i></div></a>
        <div class="circle-tile-content red">
          <div class="circle-tile-description text-faded"> Active Recruiter</div>
          <div class="circle-tile-number text-faded "><asp:Label ID="active_rec" runat="server"></asp:Label></div>
          
        </div>
      </div>
    </div> 

      <div class="col-lg-2 col-sm-6">
      <div class="circle-tile ">
        <a href="#"><div class="circle-tile-heading green"><i class="fa fa-users fa-fw fa-3x"></i></div></a>
        <div class="circle-tile-content green">
          <div class="circle-tile-description text-faded"> Total Job Seeker</div>
          <div class="circle-tile-number text-faded "><asp:Label ID="lbl_total_user" runat="server"></asp:Label></div>
          
        </div>
      </div>
    </div> 

      <div class="col-lg-2 col-sm-6">
      <div class="circle-tile ">
        <a href="#"><div class="circle-tile-heading blue"><i class="fa fa-users fa-fw fa-3x"></i></div></a>
        <div class="circle-tile-content blue">
          <div class="circle-tile-description text-faded"> Active Job Seeker<</div>
          <div class="circle-tile-number text-faded "><asp:Label ID="lbl_active_user" runat="server"></asp:Label></div>
          
        </div>
      </div>
    </div> 
  </div> 
</div> 
</asp:Content>
