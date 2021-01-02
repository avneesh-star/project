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
    public partial class post_job : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["rid"] != null && Session["rid"].ToString() != "")
            {
                if (!IsPostBack)
                {
                    if(Request.QueryString["jobId"]!=null && Request.QueryString["jobId"].ToString()!="")
                    {
                        edit();
                    }
                    bindJobProfile();
                }
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }

        public void bindJobProfile()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_jobProfile", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "get");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddl_job_profile.DataTextField = "jp_name";
            ddl_job_profile.DataValueField = "jp_id";
            ddl_job_profile.DataSource = dt;
            ddl_job_profile.DataBind();
            ddl_job_profile.Items.Insert(0,new ListItem("--Select--","0"));
        }
        public void edit()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_jobPost", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "edit");
            cmd.Parameters.AddWithValue("@job_id", Request.QueryString["jobId"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddl_job_profile.SelectedValue = dt.Rows[0]["jobProfile_id"].ToString();
            txt_min_exp.Text = dt.Rows[0]["min_exp"].ToString();
            txt_max_exp.Text = dt.Rows[0]["max_exp"].ToString();
            txt_min_salary.Text = dt.Rows[0]["min_salary"].ToString();
            txt_max_salary.Text = dt.Rows[0]["max_salary"].ToString();
            txt_vacancy.Text = dt.Rows[0]["vacancies"].ToString();
            txt_comment.Text = dt.Rows[0]["comment"].ToString();
            btn_post.Text = "Update";
        }
        public void clear()
        {
            ddl_job_profile.SelectedValue = "0";
            txt_min_exp.Text = "";
            txt_max_exp.Text = "";
            txt_min_salary.Text = "";
            txt_max_salary.Text = "";
            txt_vacancy.Text = "";
            txt_comment.Text = "";
        }
        protected void btn_post_Click(object sender, EventArgs e)
        {
            if (btn_post.Text== "Post")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_jobPost", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "insert");
                cmd.Parameters.AddWithValue("@company_id", Session["rid"]);
                cmd.Parameters.AddWithValue("@jobProfile_id", ddl_job_profile.SelectedValue);
                cmd.Parameters.AddWithValue("@min_exp", txt_min_exp.Text);
                cmd.Parameters.AddWithValue("@max_exp", txt_min_exp.Text);
                cmd.Parameters.AddWithValue("@min_salary", txt_min_salary.Text);
                cmd.Parameters.AddWithValue("@max_salary", txt_max_salary.Text);
                cmd.Parameters.AddWithValue("@vacancies", txt_vacancy.Text);
                cmd.Parameters.AddWithValue("@comment", txt_comment.Text);
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {
                    clear();
                    //Response.Write("<script>alert('congratulations your job posted!!')</script>");
                    Response.Redirect("managePostedJob.aspx");
                }
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_jobPost", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "update");
                cmd.Parameters.AddWithValue("@job_id", Request.QueryString["jobId"]);
                cmd.Parameters.AddWithValue("@company_id", Session["rid"]);
                cmd.Parameters.AddWithValue("@jobProfile_id", ddl_job_profile.SelectedValue);
                cmd.Parameters.AddWithValue("@min_exp", txt_min_exp.Text);
                cmd.Parameters.AddWithValue("@max_exp", txt_min_exp.Text);
                cmd.Parameters.AddWithValue("@min_salary", txt_min_salary.Text);
                cmd.Parameters.AddWithValue("@max_salary", txt_max_salary.Text);
                cmd.Parameters.AddWithValue("@vacancies", txt_vacancy.Text);
                cmd.Parameters.AddWithValue("@comment", txt_comment.Text);
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if (result > 0)
                {
                    clear();
                    //Response.Write("<script>alert('congratulations your job posted!!')</script>");
                    Response.Redirect("managePostedJob.aspx");
                }
            }
            
        }
    }
}