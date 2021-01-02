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
    public partial class state : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["aid"] != null && Session["aid"].ToString() != "")
            {
                if (!IsPostBack)
                {
                    BindGrid();
                    bindCountry();
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
            SqlCommand cmd = new SqlCommand("sp_state", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action","select");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                gv_state.DataSource = dt;
                gv_state.DataBind();
            }
            else
            {
                gv_state.DataSource = null;
                gv_state.DataBind();
            }

        }
        public void bindCountry()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_country_select", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddl_country.DataTextField = "country_name";
            ddl_country.DataValueField = "country_id";
            ddl_country.DataSource = dt;
            ddl_country.DataBind();
            ddl_country.Items.Insert(0,new ListItem("--Select--","0"));
        }
        public void clear()
        {
            ddl_country.SelectedValue = "0";
            txt_state.Text = "";
            btn_save.Text = "Save";
        }
   
        protected void btn_save_Click(object sender, EventArgs e)
        {
            if(btn_save.Text== "Save")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_state", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "insert");
                cmd.Parameters.AddWithValue("@state_name",txt_state.Text);
                cmd.Parameters.AddWithValue("@countryID", ddl_country.SelectedValue);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            else if(btn_save.Text== "Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_state", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "update");
                cmd.Parameters.AddWithValue("@state_name", txt_state.Text);
                cmd.Parameters.AddWithValue("@countryID", ddl_country.SelectedValue);
                cmd.Parameters.AddWithValue("@state_id", ViewState["sid"]);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            clear();
            BindGrid();
        }

        protected void gv_state_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "del")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_state", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "delete");
                cmd.Parameters.AddWithValue("@state_id", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                BindGrid();
            }
            else if (e.CommandName == "edt")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_state", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "edit");
                cmd.Parameters.AddWithValue("@state_id", e.CommandArgument);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                ddl_country.SelectedValue = dt.Rows[0]["countryID"].ToString();
                txt_state.Text = dt.Rows[0]["state_name"].ToString();
                ViewState["sid"] = e.CommandArgument;
                btn_save.Text = "Update";
            }
        }
    }
}