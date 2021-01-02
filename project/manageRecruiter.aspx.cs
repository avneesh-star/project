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
    public partial class manageRecruiter : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["aid"] != null && Session["aid"].ToString() != "")
            {
                if (!IsPostBack)
                {
                    BindData();
                }
            }
            else
            {
                Response.Redirect("logout.aspx");
            }

        }
        public void BindData()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_recruiterRegistratioin_get", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if(dt.Rows.Count>0)
            {
                gv_recruiter.DataSource = dt;
                gv_recruiter.DataBind();
            }
            else
            {
                gv_recruiter.DataSource = null;
                gv_recruiter.DataBind();
            }
            
        }
       

        protected void gv_recruiter_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "D")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_tbl_recruiterRegistratioin_delete", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@rid", e.CommandArgument);
                cmd.ExecuteNonQuery();
                con.Close();
                BindData();
            }
            
        }

        

        protected void gv_recruiter_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}