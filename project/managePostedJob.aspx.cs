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
    public partial class managePostedJob : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["rid"] != null && Session["rid"].ToString() != "")
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
            cmd.Parameters.AddWithValue("@action", "selectByCompanyID");
            cmd.Parameters.AddWithValue("@company_id", Session["rid"]);
            SqlDataReader dr = cmd.ExecuteReader();
            gv_posted_job.DataSource = dr;
            gv_posted_job.DataBind();
            con.Close();
        }

        protected void gv_posted_job_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName=="edt")
            {
                Response.Redirect("post_job.aspx?jobId="+e.CommandArgument);
            }
            else if(e.CommandName == "del")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_jobPost", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@action", "delete");
                cmd.Parameters.AddWithValue("@company_id", e.CommandArgument);
                int result = cmd.ExecuteNonQuery();
                con.Close();
                if(result>0)
                {
                    bindjobs();
                }
                
            }
        }

        protected void gv_posted_job_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }
    }

    
}