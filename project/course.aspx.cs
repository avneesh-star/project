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
    public partial class course : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["idd"] != null && Session["idd"].ToString() != "")
            {
                if (!IsPostBack)
                {
                    BindGrid();
                }
            }
            else
            {
                Response.Redirect("logout.aspx");
            }

        }
        public void BindGrid()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_course_select", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                gv_course.DataSource = dt;
                gv_course.DataBind();
            }
            else
            {
                gv_course.DataSource = null;
                gv_course.DataBind();
            }

        }
        public void clear()
        {
            txt_course.Text = "";
            btn_save.Text = "Save";
        }
        protected void btn_save_Click(object sender, EventArgs e)
        {
            if(btn_save.Text=="Save")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_course_insert", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@course_name", txt_course.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_course_update", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@course_name", txt_course.Text);
                cmd.Parameters.AddWithValue("@course_id", ViewState["cid"]);
                cmd.ExecuteNonQuery();
                con.Close();
                
            }
            BindGrid();
            clear();
        }

        protected void gv_course_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName=="del")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_course_delete", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@course_id", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                BindGrid();
            }
            else if (e.CommandName == "edt")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_course_edit", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@course_id", e.CommandArgument);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                txt_course.Text = dt.Rows[0]["course_name"].ToString();
                ViewState["cid"] = e.CommandArgument;
                btn_save.Text = "Update";
            }
        }
    }
}