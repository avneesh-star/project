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
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            if(ddl_user_type.SelectedValue=="1")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_admin_login",con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@email",txt_email.Text);
                cmd.Parameters.AddWithValue("@password",txt_password.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                if (dt.Rows.Count > 0)
                {
                    Session["idd"] = dt.Rows[0]["admin_id"].ToString();
                    Response.Redirect("adminHome.aspx");
                }
                else
                {
                    lbl_msg.Text = "Admin login falied!!";
                    lbl_msg.ForeColor = Color.Red;
                }
            }
            else if(ddl_user_type.SelectedValue == "2")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_user_login", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@email", txt_email.Text);
                cmd.Parameters.AddWithValue("@password", txt_password.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                if (dt.Rows.Count > 0)
                {
                    Session["idd"] = dt.Rows[0]["user_id"].ToString();
                    Response.Redirect("userHome.aspx");
                }
                else
                {
                    lbl_msg.Text = "User login falied!!";
                    lbl_msg.ForeColor = Color.Red;
                }
            }
            else if (ddl_user_type.SelectedValue == "3")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_recruiter_login", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@email", txt_email.Text);
                cmd.Parameters.AddWithValue("@password", txt_password.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                if (dt.Rows.Count > 0)
                {
                    Session["idd"] = dt.Rows[0]["recruiter_id"].ToString();
                    Response.Redirect("recruiterHome.aspx");
                }
                else
                {
                    lbl_msg.Text = "Recruiter login falied!!";
                    lbl_msg.ForeColor = Color.Red;
                }
            }
        }
    }
}