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
    public partial class jobProfile : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["aid"] != null && Session["aid"].ToString() != "")
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

        protected void btn_save_Click(object sender, EventArgs e)
        {
            if(btn_save.Text== "Add")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_jobProfile", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "insert");
                cmd.Parameters.AddWithValue("@jp_name",txt_jobprofile.Text);
                cmd.ExecuteNonQuery();
                con.Close();
               
            }
            else if(btn_save.Text=="Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_jobProfile", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "update");
                cmd.Parameters.AddWithValue("@jp_name", txt_jobprofile.Text);
                cmd.Parameters.AddWithValue("@jp_id", ViewState["jpid"]);
                cmd.ExecuteNonQuery();
                con.Close();
                
            }
            BindGrid();
        }
        public void BindGrid()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_jobProfile", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "get");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            gv_jobProfile.DataSource = dt;
            gv_jobProfile.DataBind();
        }

        protected void gv_jobProfile_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName=="edt")
            {
                
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_jobProfile", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "edit");
                cmd.Parameters.AddWithValue("@jp_id", e.CommandArgument);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                txt_jobprofile.Text = dt.Rows[0][1].ToString();
                ViewState["jpid"] = e.CommandArgument;
                btn_save.Text = "Update";
            }
            else if(e.CommandName=="del")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_jobProfile", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "delete");
                cmd.Parameters.AddWithValue("@jp_id", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
    }
}