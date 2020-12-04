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
    public partial class userHome : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["idd"]!=null && Session["idd"].ToString()!="")
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
            SqlCommand cmd = new SqlCommand("sp_tbl_registration_get_by_user", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@user_id", Session["idd"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                gv_user.DataSource = dt;
                gv_user.DataBind();
            }
            else
            {
                gv_user.DataSource = null;
                gv_user.DataBind();
            }

        }
        protected void gv_user_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "E")
            {

            }
        }
    }
}