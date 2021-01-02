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
    public partial class jobs_user : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] != null && Session["uid"].ToString() != "")
            {
                if (!IsPostBack)
                {
                    bindjobs();
                    BindJobTitle();
                }
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
        public void bindjobs()
        {
            con.Open();
            SqlCommand cmd1 = new SqlCommand("sp_tbl_registration_edit", con);
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.AddWithValue("@user_id", Session["uid"]);
            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            
            string JT = dt1.Rows[0]["jobprofileID"].ToString();

            SqlCommand cmd = new SqlCommand("sp_tbl_jobPost", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "selectbyjobtitle");
            cmd.Parameters.AddWithValue("@jobProfile_id",JT);
            SqlDataReader dr = cmd.ExecuteReader();
            gv_jobs.DataSource = dr;
            gv_jobs.DataBind();
            con.Close();
        }
        public void BindJobTitle()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_jobProfile", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "get");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddljobtitle.DataValueField = "jp_id";
            ddljobtitle.DataTextField = "jp_name";
            ddljobtitle.DataSource = dt;
            ddljobtitle.DataBind();
            ddljobtitle.Items.Insert(0, new ListItem("--Select--", "0"));

        }
        protected void btnsearch_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("sp_tbl_jobPost", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "search");
            cmd.Parameters.AddWithValue("@jobProfile_id", ddljobtitle.SelectedValue);
            cmd.Parameters.AddWithValue("@max_salary", txtsalary.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            gv_jobs.DataSource = dt;
            gv_jobs.DataBind();
        }
    }
    
}