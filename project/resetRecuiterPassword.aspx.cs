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
    public partial class resetRecuiterPassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["token"] != null && Request.QueryString["token"].ToString() != "")
            {
                
            }
        }

        protected void btn_rest_Click(object sender, EventArgs e)
        {
            if (txtNewpass.Text != "" && txtCnewpass.Text != "")
            {
                if (txtNewpass.Text == txtCnewpass.Text)
                {
                    string token = Server.UrlDecode(Request.QueryString["token"]);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("sp_reset_recruiterPassword", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@password", txtNewpass.Text);
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