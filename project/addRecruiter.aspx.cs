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
    public partial class addRecruiter : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindCountry();
                ddl_state.Items.Insert(0, new ListItem("--Select--", "0"));
                ddl_state.Enabled = false;
                ddl_city.Items.Insert(0, new ListItem("--Select--", "0"));
                ddl_city.Enabled = false;
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
            if (btn_save.Text == "Register")
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
                    SqlCommand cmd = new SqlCommand("sp_tbl_recruiterRegistratioin_insert", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@compnay_name", txt_company_name.Text);
                    cmd.Parameters.AddWithValue("@email", txt_email.Text);
                    cmd.Parameters.AddWithValue("@password", txt_password.Text);
                    cmd.Parameters.AddWithValue("@compnay_url", txt_url.Text);
                    cmd.Parameters.AddWithValue("@contact_person", txt_contact_person.Text);
                    cmd.Parameters.AddWithValue("@contact_number", txt_contact_number.Text);
                    cmd.Parameters.AddWithValue("@address", txt_address.Text);
                    cmd.Parameters.AddWithValue("@countryID",ddl_country.SelectedValue );
                    cmd.Parameters.AddWithValue("@stateID", ddl_state.SelectedValue);
                    cmd.Parameters.AddWithValue("@cityID", ddl_city.SelectedValue);
                    int res = cmd.ExecuteNonQuery();
                    con.Close();
                    if (res > 0)
                    {
                        Response.Write("<script>alert('Registraion done successfully!!');window.location='Login.aspx';</script>");

                        //Response.Redirect("Login.aspx");
                    }
                }
                
            }

        }

        protected void ddl_countyr_SelectedIndexChanged(object sender, EventArgs e)
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