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
    public partial class bloodgroup : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["aid"] != null && Session["aid"].ToString() != "")
            {
                if (!IsPostBack)
                {
                    binddata();
                }
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
        public void binddata()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_bloodgroup", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "select");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            gv_bloodgroup.DataSource = dt;
            gv_bloodgroup.DataBind();
        }
        public void clear()
        {
            txt_bloodgroup.Text = "";
            btn_save.Text = "Save";
        }
        protected void btn_save_Click(object sender, EventArgs e)
        {
            if(btn_save.Text=="Save")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_bloodgroup", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action","insert");
                cmd.Parameters.AddWithValue("@bg_name",txt_bloodgroup.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                binddata();
            }
            else if(btn_save.Text=="Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_bloodgroup", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "update");
                cmd.Parameters.AddWithValue("@bg_id", ViewState["bgid"]);
                cmd.Parameters.AddWithValue("@bg_name", txt_bloodgroup.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                binddata();
            }
            clear();
        }

        protected void gv_bloodgroup_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName=="E")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_bloodgroup", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "edit");
                cmd.Parameters.AddWithValue("@bg_id", e.CommandArgument);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                txt_bloodgroup.Text = dt.Rows[0][1].ToString();
                ViewState["bgid"] = e.CommandArgument;
                btn_save.Text = "Update";
            }
            else
            if (e.CommandName == "D")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_bloodgroup", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "delete");
                cmd.Parameters.AddWithValue("@bg_id", e.CommandArgument);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                binddata();
            }
        }
    }
}