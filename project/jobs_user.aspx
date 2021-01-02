<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="jobs_user.aspx.cs" Inherits="project.jobs_user" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        function ApplyForm(job_id) {
            document.getElementById('iframe_pop').src = 'ApplyForm.aspx?JID=' + job_id;
            $('#div_overlay').fadeIn(500); $('#div_popup').fadeIn(500);
        }

        function CompanyInfo(company_id) {
            document.getElementById('iframe_company').src = 'CompanyInfo.aspx?CID=' + company_id;
            $('#div_overlaycompany').fadeIn(500); $('#div_popupcompany').fadeIn(500);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>Job Title :
            <asp:DropDownList ID="ddljobtitle" runat="server"></asp:DropDownList>
            Enter your Salary : 
            <asp:TextBox ID="txtsalary" runat="server"></asp:TextBox>
            <asp:Button ID="btnsearch" runat="server" Text="Search" OnClick="btnsearch_Click" />
            </td>
        </tr>
        <tr>
            <td style="text-align:center">
                <asp:GridView ID="gv_jobs" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None"  CssClass="table table-striped table-sm">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="Job Profile">
                            <ItemTemplate>
                                <%#Eval("jp_name") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Company">
                            <ItemTemplate>
                                
                                <a href="javascript:void(0);" onclick="CompanyInfo('<%#Eval("company_id") %>')"><%#Eval("compnay_name") %></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Required Exp">
                            <ItemTemplate>
                                <%#Eval("min_exp") %>Year - <%#Eval("max_exp") %> Year
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Offred Salary">
                            <ItemTemplate>
                                Rs.<%#Eval("min_salary") %>- Rs.<%#Eval("max_salary") %>
                               
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="No of vacancies">
                            <ItemTemplate>
                                <%#Eval("vacancies") %> positions
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
                                 <a href="javascript:void(0);" onclick="ApplyForm('<%#Eval("job_id") %>')">Send Mail</a>
                                <asp:LinkButton ID="btn_apply" Text="Apply" runat="server" CommandName="apl" CommandArgument='<%#Eval("job_id") %>' CssClass="btn btn-outline-info" ></asp:LinkButton>
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

    <%--------------------------popup apply----------------------------%>
    <div id="div_overlay" style="position: fixed; left: 0px; top: 0px; right: 0px; bottom: 0px; background: black; opacity: 0.2; display: none"></div>
    <div id="div_popup" style="position: fixed; display: none; left: 0px; top: 150px; right: 0px; bottom: 0px;">
        <center>
    <div style="overflow:auto;width:500px;height:300px;background:white;">
    <div style="float:right"><a href="javascript:void(0);" onclick="$('#div_overlay').fadeOut(1000);$('#div_popup').fadeOut(1000);">close</a></div>
    <iframe id="iframe_pop" src="ApplyForm.aspx" style="border:none" width="500px" height="300px"></iframe>
    </div></center>
    </div>

    <%--------------------------popup company----------------------------%>
    <div id="div_overlaycompany" style="position: fixed; left: 0px; top: 0px; right: 0px; bottom: 0px; background: black; opacity: 0.2; display: none"></div>
    <div id="div_popupcompany" style="position: fixed; display: none; left: 0px; top: 150px; right: 0px; bottom: 0px;">
        <center>
    <div style="overflow:auto;width:500px;height:250px;background:white;">
    <div style="float:right"><a href="javascript:void(0);" onclick="$('#div_overlaycompany').fadeOut(1000);$('#div_popupcompany').fadeOut(1000);">close</a></div>
    <iframe id="iframe_company" src="CompanyInfo.aspx" style="border:none" width="500px" height="250px"></iframe>
    </div></center>
    </div>
</asp:Content>
