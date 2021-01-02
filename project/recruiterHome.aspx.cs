using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

namespace project
{
    public partial class recruiterHome : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["rid"] != null && Session["rid"].ToString() != "")
            {
                if (!IsPostBack)
                {
                    BindData();
                    BindCountry();
                    ddl_state.Items.Insert(0, new ListItem("--Select--", "0"));
                    ddl_state.Enabled = false;
                    ddl_city.Items.Insert(0, new ListItem("--Select--", "0"));
                    ddl_city.Enabled = false;
                }
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }

        public void BindCountry()
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
        public void BindCity()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_city_select", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@state_id", ddl_state.SelectedValue);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddl_city.DataTextField = "city_name";
            ddl_city.DataValueField = "city_id";
            ddl_city.DataSource = dt;
            ddl_city.DataBind();
            ddl_city.Items.Insert(0, new ListItem("--Select--", "0"));
        }
        public void BindData()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_recruiterRegistratioin_get_by_id", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@rid", Session["rid"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                
                dl_view.DataSource = dt;
                dl_view.DataBind();
            }
            else
            {
               
                dl_view.DataSource = null;
                dl_view.DataBind();
            }
            tbl_form.Attributes.Add("style", "display:none");
            dl_view.Attributes.Add("style", "display: normal");

        }
        public void clear()
        {
            txt_company_name.Text = "";
            txt_email.Text = "";
            txt_url.Text = "";
            txt_contact_person.Text = "";
            txt_contact_number.Text = "";
            txt_address.Text = "";
        }

        public int checkMail(string str)
        {
            con.Open();
            SqlCommand cmd1 = new SqlCommand("sp_recruiter_mail_check", con);
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.AddWithValue("@email", str);
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt.Rows.Count;

        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            int num = checkMail(txt_email.Text);
            if(num>0)
            {
                lblmsg.ForeColor = Color.Red;
                lblmsg.Text = "E-Mail already registered!!";
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_recruiterRegistratioin_update", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@recruiter_id", ViewState["rucid"]);
                cmd.Parameters.AddWithValue("@compnay_name", txt_company_name.Text);
                cmd.Parameters.AddWithValue("@email", txt_email.Text);

                cmd.Parameters.AddWithValue("@compnay_url", txt_url.Text);
                cmd.Parameters.AddWithValue("@contact_person", txt_contact_person.Text);
                cmd.Parameters.AddWithValue("@contact_number", txt_contact_number.Text);
                cmd.Parameters.AddWithValue("@address", txt_address.Text);
                cmd.Parameters.AddWithValue("@countryID", ddl_country.SelectedValue);
                cmd.Parameters.AddWithValue("@stateID", ddl_state.SelectedValue);
                cmd.Parameters.AddWithValue("@cityID", ddl_city.SelectedValue);
                int res = cmd.ExecuteNonQuery();
                con.Close();
                if (res > 0)
                {
                    clear();
                    BindData();
                    tbl_form.Attributes.Add("style", "display:none");
                    dl_view.Attributes.Add("style", "display:normal");
                }
            }
            
        }

        protected void dl_view_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "E")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_recruiterRegistratioin_edit", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@rid", e.CommandArgument);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                txt_company_name.Text = dt.Rows[0]["compnay_name"].ToString();
                txt_email.Text = dt.Rows[0]["email"].ToString();
                txt_url.Text = dt.Rows[0]["compnay_url"].ToString();
                txt_contact_person.Text = dt.Rows[0]["contact_person"].ToString();
                txt_contact_number.Text = dt.Rows[0]["contact_number"].ToString();
                txt_address.Text = dt.Rows[0]["address"].ToString();
                ddl_country.SelectedValue= dt.Rows[0]["countryID"].ToString();
                ddl_state.SelectedValue = dt.Rows[0]["stateID"].ToString();
                ddl_city.SelectedValue = dt.Rows[0]["cityID"].ToString();
                ViewState["rucid"] = e.CommandArgument;
                tbl_form.Attributes.Add("style", "display:normal");
                dl_view.Attributes.Add("style", "display:none");
            }
        }

        protected void ddl_country_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_country.SelectedValue != "0")
            {
                ddl_state.Enabled = true;
                BindState();
            }
            else
            {
                ddl_state.SelectedValue = "0";
                ddl_state.Enabled = false;
                ddl_city.SelectedValue = "0";
                ddl_city.Enabled = false;
            }
        }

        protected void ddl_state_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_state.SelectedValue != "0")
            {
                ddl_city.Enabled = true;
                BindCity();
            }
            else
            {
                ddl_city.SelectedValue = "0";
                ddl_city.Enabled = false;
            }
        }
    }
}