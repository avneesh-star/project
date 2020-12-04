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
    public partial class UserRegistration : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindCourse();
                if(Request.QueryString["uid"]!=null && Request.QueryString["uid"].ToString()!="")
                {
                    edit();
                }
                
            }
        }
        public void BindCourse()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tbl_course where course_status=1", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddl_course.DataTextField = "course_name";
            ddl_course.DataValueField = "course_id";
            ddl_course.DataSource = dt;
            ddl_course.DataBind();
            ddl_course.Items.Insert(0, new ListItem("--Select--", "0"));
        
        }
        
        public void edit()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_registration_edit", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@user_id",Request.QueryString["uid"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            txt_name.Text = dt.Rows[0]["user_name"].ToString();
            txt_email.Text = dt.Rows[0]["user_email"].ToString();
            txt_password.Text = dt.Rows[0]["user_password"].ToString();
            rbl_gender.SelectedValue = dt.Rows[0]["user_gender"].ToString();
            ddl_course.SelectedValue= dt.Rows[0]["user_course"].ToString();
            btn_save.Text = "Update";
        }
        public void clear()
        {
            txt_name.Text = "";
            txt_email.Text = "";
            txt_password.Text = "";
            rbl_gender.ClearSelection();
            ddl_course.SelectedValue = "";
            btn_save.Text = "Save";
        }
        protected void btn_save_Click(object sender, EventArgs e)
        {
            if(btn_save.Text=="Save")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_userRegistration_insert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@user_name", txt_name.Text);
                cmd.Parameters.AddWithValue("@user_email", txt_email.Text);
                cmd.Parameters.AddWithValue("@user_password", txt_password.Text);
                cmd.Parameters.AddWithValue("@user_gender", rbl_gender.SelectedValue);
                cmd.Parameters.AddWithValue("@user_course", ddl_course.SelectedValue);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_userRegistration_update", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@user_id", Request.QueryString["uid"]);
                cmd.Parameters.AddWithValue("@user_name", txt_name.Text);
                cmd.Parameters.AddWithValue("@user_email", txt_email.Text);
                cmd.Parameters.AddWithValue("@user_password", txt_password.Text);
                cmd.Parameters.AddWithValue("@user_gender", rbl_gender.SelectedValue);
                cmd.Parameters.AddWithValue("@user_course", ddl_course.SelectedValue);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            
            Response.Redirect("Login.aspx");
            clear();
        }
    }
}