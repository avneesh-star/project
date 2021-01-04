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
using System.Net;
using System.Net.Mail;

namespace project
{
    public partial class forgotpassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public int checuserkMail(string str)
        {
            int uid = 0;
            con.Open();
            SqlCommand cmd1 = new SqlCommand("sp_user_mail_check", con);
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.AddWithValue("@user_email", str);
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                uid = Convert.ToInt32(dt.Rows[0]["user_id"].ToString());
                return uid;
            }
            else
            {
                uid = 0;
                return uid;
            }

        }

        public int checCompanykMail(string str)
        {
            int rid = 0;
            con.Open();
            SqlCommand cmd1 = new SqlCommand("sp_recruiter_mail_check", con);
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.AddWithValue("@email", str);
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                rid = Convert.ToInt32(dt.Rows[0]["recruiter_id"].ToString());
                return rid;
            }
            else
            {
                rid = 0;
                return rid;
            }

        }

        public string token()
        {
            byte[] time = BitConverter.GetBytes(DateTime.UtcNow.ToBinary());
            byte[] key = Guid.NewGuid().ToByteArray();
            string token = Convert.ToBase64String(time.Concat(key).ToArray());
            return token;
        }
        protected void btn_send_Click(object sender, EventArgs e)
        {


            string tkn = token();
            if (ddl_user_type.SelectedValue == "2")
            {
                int idd = checuserkMail(txt_mail.Text);
                if (idd > 0)
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("sp_update_user_token", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@user_id", idd);
                    cmd.Parameters.AddWithValue("@token", tkn);
                    int i = cmd.ExecuteNonQuery();
                    con.Close();
                    if (i > 0)
                    {
                        MailAddress bcc = new MailAddress("avneesh.gangwar@outlook.com");
                        using (MailMessage mm = new MailMessage("awaneeshkumar051@gmail.com", txt_mail.Text))
                        {
                            mm.Subject = "Reset Password";
                            mm.Body = "Hi," + txt_mail.Text + "please click http://localhost:49747/resetUserPassword.aspx?token=" + Server.UrlEncode(tkn) + " here to reset your password";
                            mm.CC.Add(bcc);
                            mm.IsBodyHtml = true;
                            SmtpClient smtp = new SmtpClient();
                            smtp.Host = "smtp.gmail.com";
                            smtp.EnableSsl = true;
                            NetworkCredential NetworkCred = new NetworkCredential("awaneeshkumar051@gmail.com", "Akg@4321");
                            smtp.UseDefaultCredentials = true;
                            smtp.Credentials = NetworkCred;
                            smtp.Port = 25;
                            smtp.Send(mm);
                            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Please cheack your mail for reset your password!!');", true);
                        }
                    }
                    else
                    {
                        lbl_msg.ForeColor = Color.Red;
                        lbl_msg.Text = "E mail not registered!!";
                    }
                }
                else if (ddl_user_type.SelectedValue == "3")
                {
                    int ridd = checCompanykMail(txt_mail.Text);
                    if (ridd > 0)
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("sp_update_recruite_token", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@recruiter_id", ridd);
                        cmd.Parameters.AddWithValue("@token", tkn);
                        int i = cmd.ExecuteNonQuery();
                        con.Close();
                        if (i > 0)
                        {
                            MailAddress bcc = new MailAddress("avneesh.gangwar@outlook.com");
                            using (MailMessage mm = new MailMessage("awaneeshkumar051@gmail.com", txt_mail.Text))
                            {
                                mm.Subject = "Reset Password";
                                mm.Body = "Hi," + txt_mail.Text + "please click http://localhost:49747/resetRecuiterPassword.aspx?token=" + Server.UrlEncode(tkn) + " here to reset your password";
                                mm.CC.Add(bcc);
                                mm.IsBodyHtml = true;
                                SmtpClient smtp = new SmtpClient();
                                smtp.Host = "smtp.gmail.com";
                                smtp.EnableSsl = true;
                                NetworkCredential NetworkCred = new NetworkCredential("awaneeshkumar051@gmail.com", "Akg@4321");
                                smtp.UseDefaultCredentials = true;
                                smtp.Credentials = NetworkCred;
                                smtp.Port = 25;
                                smtp.Send(mm);
                                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Please cheack your mail for reset your password!!');", true);
                            }
                        }
                        else
                        {
                            lbl_msg.ForeColor = Color.Red;
                            lbl_msg.Text = "E mail not registered!!";
                        }
                    }
                }
            }
        }
    }
}