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
    public partial class manageJob : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["aid"] != null && Session["aid"].ToString() != "")
            {
                if (!IsPostBack)
                {
                    bindjobs();
                }
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
        public void bindjobs()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_jobPost", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "selectAll");
            SqlDataReader dr = cmd.ExecuteReader();
            gv_PostedJob.DataSource = dr;
            gv_PostedJob.DataBind();
            con.Close();
        }

        protected void gv_PostedJob_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName=="A")
            {
                con.Open();
                SqlCommand cmd =new  SqlCommand("sp_tbl_jobPost_status_update",con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@job_id",e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                bindjobs();
            }
        }

        protected void gv_PostedJob_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}