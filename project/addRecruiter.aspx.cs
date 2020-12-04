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
    public partial class addRecruiter : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void edit()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_recruiterRegistratioin_edit", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@rid", Request.QueryString["rid"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            
        }
        protected void btn_save_Click(object sender, EventArgs e)
        {
            if (btn_save.Text == "Save")
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
                int res=cmd.ExecuteNonQuery();
                con.Close();
                if(res>0)
                {
                    Response.Redirect("manageRecruiter.aspx");
                }
            }
        }
    }
}