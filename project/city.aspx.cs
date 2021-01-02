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
    public partial class city : System.Web.UI.Page
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
                    ddl_state.Items.Insert(0, new ListItem("--Select--", "0"));
                    ddl_state.Enabled = false;
                }
            }
            else
            {
                Response.Redirect("logout.aspx");
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
            ddl_state.Enabled = true;
            ddl_country.DataTextField = "country_name";
            ddl_country.DataValueField = "country_id";
            ddl_country.DataSource = dt;
            ddl_country.DataBind();
            ddl_country.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void BindState()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_get_state_by_country", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@countryID", ddl_country.SelectedValue);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddl_state.DataTextField = "state_name";
            ddl_state.DataValueField = "state_id";
            ddl_state.DataSource = dt;
            ddl_state.DataBind();
            ddl_state.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void BindGrid()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_city", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "joinSelect");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if(dt.Rows.Count>0)
            {
                gv_city.DataSource = dt;
                gv_city.DataBind();
            }
            else
            {
                gv_city.DataSource = null;
                gv_city.DataBind();
            }
        }
        protected void ddl_country_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddl_country.SelectedValue=="0")
            {
                ddl_state.SelectedValue = "0";
                ddl_state.Enabled = false;
            }
            else
        
            {
                ddl_state.Enabled = true;
                BindState();
            }
            
        }
        public void clear()
        {
            ddl_country.SelectedValue = "0";
            ddl_state.SelectedValue = "0";
            txt_city.Text = "";
            btn_save.Text = "Save";
        }
        protected void btn_save_Click(object sender, EventArgs e)
        {
            if(btn_save.Text=="Save")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_city",con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "insert");
                cmd.Parameters.AddWithValue("@city_name",txt_city.Text);
                cmd.Parameters.AddWithValue("@stateID", ddl_state.SelectedValue);
                cmd.Parameters.AddWithValue("@coutnryID", ddl_country.SelectedValue);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            else if(btn_save.Text =="Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_city", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "update");
                cmd.Parameters.AddWithValue("@city_id", ViewState["cid"]);
                cmd.Parameters.AddWithValue("@city_name", txt_city.Text);
                cmd.Parameters.AddWithValue("@stateID", ddl_state.SelectedValue);
                cmd.Parameters.AddWithValue("@coutnryID", ddl_country.SelectedValue);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            BindGrid();
            clear();
        }

        protected void gv_city_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName=="del")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_city", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "delete");
                cmd.Parameters.AddWithValue("@city_id", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                BindGrid();
            }
            else if (e.CommandName == "edt")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_city", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "edit");
                cmd.Parameters.AddWithValue("@city_id", e.CommandArgument);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                ddl_country.SelectedValue = dt.Rows[0]["coutnryID"].ToString();
                ddl_state.Enabled = true;
                BindState();
                ddl_state.SelectedValue = dt.Rows[0]["stateID"].ToString();
                txt_city.Text = dt.Rows[0]["city_name"].ToString();
                btn_save.Text = "Update";
                ViewState["cid"] = e.CommandArgument;
            }
        }
    }
}