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
    public partial class skills : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["aid"] != null && Session["aid"].ToString() != "")
            {
                if (!IsPostBack)
                {
                    BindGrid();
                    BindJP();
                }
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }

        protected void BindGrid()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_skills", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "joinSelect");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            gv_skill.DataSource = dt;
            gv_skill.DataBind();
        }
        protected void clear()
        {
            ddl_jobprofile.SelectedValue = "0";
            txt_skill.Text = "";
            btn_add.Text = "Add";
        }
        protected void BindJP()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_jobProfile",con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action","get");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddl_jobprofile.DataTextField = "jp_name";
            ddl_jobprofile.DataValueField = "jp_id";
            ddl_jobprofile.DataSource = dt;
            ddl_jobprofile.DataBind();
            ddl_jobprofile.Items.Insert(0,new ListItem("--Select--","0"));
        }
        protected void btn_add_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_skills", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action",btn_add.Text== "Add"? "insert": "update");
            cmd.Parameters.AddWithValue("@jp_id", ddl_jobprofile.SelectedValue);
            cmd.Parameters.AddWithValue("@skill_name", txt_skill.Text);
            cmd.Parameters.AddWithValue("@skill_id", btn_add.Text == "Add" ?0:ViewState["skid"]);
            cmd.ExecuteNonQuery();
            con.Close();
            BindGrid();
            clear();
        }

        protected void gv_skill_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName=="edt")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_skills", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "edit");
                cmd.Parameters.AddWithValue("@skill_id", e.CommandArgument);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                ddl_jobprofile.SelectedValue = dt.Rows[0]["jp_id"].ToString();
                txt_skill.Text = dt.Rows[0]["skill_name"].ToString();
                btn_add.Text = "Update";
                ViewState["skid"] = e.CommandArgument;
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_skills", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "delete");
                cmd.Parameters.AddWithValue("@skill_id", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                BindGrid();
            }
        }
    }
}