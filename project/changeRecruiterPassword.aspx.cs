﻿using System;
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
    public partial class changeRecruiterPassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["rid"] != null && Session["rid"].ToString() != "")
            {
                if (!IsPostBack)
                {
                    //PAGE LOAD
                }
            }
            else
            {

            }
        }

        protected void btn_cangepass_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_chengeRecruiterpassword", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", Session["rid"]);
            cmd.Parameters.AddWithValue("@newpass", txt_newpassword.Text);
            cmd.Parameters.AddWithValue("@oldpass", txt_oldpassword.Text);
            int res = cmd.ExecuteNonQuery();
            con.Close();
            if (res > 0)
            {
                lal_msg.Text = "Password changed successfuly!";
                lal_msg.ForeColor = Color.LawnGreen;
            }
            else
            {
                lal_msg.Text = "Password not changed !";
                lal_msg.ForeColor = Color.Red;
            }
        }
    }
}