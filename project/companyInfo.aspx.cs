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
    public partial class companyInfo : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Display();
            }
        }
        public void Display()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_recruiterRegistratioin_get_by_id", con);
            cmd.CommandType = CommandType.StoredProcedure;
            
            cmd.Parameters.AddWithValue("@rid", Request.QueryString["CID"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            lblcname.Text = dt.Rows[0]["compnay_name"].ToString();
            lblcurl.Text = dt.Rows[0]["compnay_url"].ToString();
            lblcaddress.Text = dt.Rows[0]["address"].ToString() + "," + dt.Rows[0]["city_name"].ToString() + "," + dt.Rows[0]["state_name"].ToString() + "," + dt.Rows[0]["country_name"].ToString();
            lblchr.Text = dt.Rows[0]["contact_person"].ToString();
            lblemail.Text = dt.Rows[0]["email"].ToString();
            lblcn.Text = dt.Rows[0]["contact_number"].ToString();
        }
    }
}