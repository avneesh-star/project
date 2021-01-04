using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

namespace project
{
    public partial class resetUserPassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["token"] != null && Request.QueryString["token"].ToString()!="")
            {
               //string str= mail_verify();
            }
        }

        //public string mail_verify()
        //{
        //    string token = Server.UrlDecode(Request.QueryString["token"]);
        //    con.Open();
        //    SqlCommand cmd2 = new SqlCommand("sp_check_token", con);
        //    cmd2.CommandType = CommandType.StoredProcedure;
        //    cmd2.Parameters.AddWithValue("@token", token);
        //    SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
        //    DataTable dt2 = new DataTable();
        //    da2.Fill(dt2);
        //    con.Close();
        //    if (dt2.Rows.Count > 0)
        //    {
        //        return  "success";
        //    }

        //    else
        //    {
        //        return "failed";
        //    }
        //}

        protected void btn_rest_Click(object sender, EventArgs e)
        {
            if(txtNewpass.Text!="" && txtCnewpass.Text != "")
            {
                if(txtNewpass.Text== txtCnewpass.Text)
                {
                    string token = Server.UrlDecode(Request.QueryString["token"]);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("sp_reset_userPassword", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@user_password", txtNewpass.Text);
                    cmd.Parameters.AddWithValue("@token", token);
                    int i = cmd.ExecuteNonQuery();
                    con.Close();
                    if (i > 0)
                    {
                        lblMsg.ForeColor = Color.Green;
                        lblMsg.Text = "your password has beeen reset!!";
                    }
                    else
                    {
                        lblMsg.ForeColor = Color.Red;
                        lblMsg.Text = "Password not matched!!";
                    }
                }
                else
                {
                    lblMsg.ForeColor = Color.Red;
                    lblMsg.Text = "Please enter password!!";
                }
                
            }
            else
            {
                lblMsg.ForeColor = Color.Red;
                lblMsg.Text = "Please enter password!!";
            }
            
        }
    }
}