using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace project
{
    public partial class userHome : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["uid"]!=null && Session["uid"].ToString()!="")
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
            cmd.Parameters.AddWithValue("@user_id", Session["uid"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                dl_user.DataSource = dt;
                dl_user.DataBind();
            }
            else
            {
                dl_user.DataSource = null;
                dl_user.DataBind();
            }
            
        }
        
       
        protected void dl_user_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            
            if(e.CommandName=="edt")
            {
                Response.Redirect("UserRegistration.aspx?userID=" + Session["uid"]);
            }
            else if(e.CommandName == "del")
            {
                Label lbl1 = e.Item.FindControl("lblimg") as Label;
                Label lbl2 = e.Item.FindControl("Lblrsm") as Label;
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_user_delete",con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userid", Session["uid"]);
                int i = cmd.ExecuteNonQuery();
                con.Close();
                if (i > 0)
                {
                    
                   File.Delete(Server.MapPath("photo" + "\\" + lbl1.Text));
                   File.Delete(Server.MapPath("resume" + "\\" + lbl2.Text));
                    Response.Write("<script>alert('Your all data deleted successfully!!');window.location='Login.aspx';</script>");
                    
                }
            }
            else if(e.CommandName == "rsm")
            {
                Response.Redirect("~/resume" + "\\" + e.CommandArgument);
            }
        }
    }
}