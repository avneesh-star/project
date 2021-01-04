using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace project
{
    public partial class adminHome : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["aid"] != null && Session["aid"].ToString() != "")
            {
                if (!IsPostBack)
                {
                    gettotalRectruiter();
                    getactiveRectruiter();
                    gettotalUser();
                    getactiveUser();
                }
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }

        public void gettotalRectruiter()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_get_recruiter", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", 1);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            lbl_rec_count.Text = dt.Rows[0][0].ToString();
        }
        public void getactiveRectruiter()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_get_recruiter", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", 2);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            active_rec.Text = dt.Rows[0][0].ToString();
        }

        public void gettotalUser()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_get_users", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", 1);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            lbl_total_user.Text = dt.Rows[0][0].ToString();
        }

        public void getactiveUser()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_get_users", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", 2);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            lbl_active_user.Text = dt.Rows[0][0].ToString();
        }
    }
}