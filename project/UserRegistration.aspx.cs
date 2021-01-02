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
using System.Drawing;
using System.Net;
using System.Net.Mail;


namespace project
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["userID"] != null && Request.QueryString["userID"].ToString() != "")
            {
                if (!IsPostBack)
                {
                    edit();
                    tr_password.Attributes.Add("style", "display:none");
                }

            }
            if (!IsPostBack)
            {

                BindCourse();
                BindCountry();
                ddl_state.Items.Insert(0, new ListItem("--Select--", "0"));
                ddl_state.Enabled = false;
                ddl_city.Items.Insert(0, new ListItem("--Select--", "0"));
                ddl_city.Enabled = false;
                JobProfile();
                //tr_skills.Attributes.Add("style", "display:none");
                tr_skills.Visible = false;
                
            }
        }
        public void BindCourse()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tbl_course where course_status=1", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddl_course.DataTextField = "course_name";
            ddl_course.DataValueField = "course_id";
            ddl_course.DataSource = dt;
            ddl_course.DataBind();
            ddl_course.Items.Insert(0, new ListItem("--Select--", "0"));

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
        public void JobProfile()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_jobProfile", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "get");
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            ddl_JP.DataTextField = "jp_name";
            ddl_JP.DataValueField = "jp_id";
            ddl_JP.DataSource = dt;
            ddl_JP.DataBind();
            ddl_JP.Items.Insert(0, new ListItem("--Select--", "0"));
        }
        public void BindSkills()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_skills", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@action", "selectByjpid");
            cmd.Parameters.AddWithValue("@jp_id", ddl_JP.SelectedValue);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cbl_skill.DataTextField = "skill_name";
            cbl_skill.DataValueField = "skill_id";
            cbl_skill.DataSource = dt;
            cbl_skill.DataBind();
        }
        public void clear()
        {
            txt_name.Text = "";
            txt_email.Text = "";
            txt_password.Text = "";
            rbl_gender.ClearSelection();
            ddl_course.SelectedValue = "0";
            btn_save.Text = "Save";
        }
        public void edit()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_registration_edit", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@user_id", Request.QueryString["userID"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                txt_name.Text = dt.Rows[0]["user_name"].ToString();
                txt_dob.Text = Convert.ToDateTime((dt.Rows[0]["user_dob"].ToString())).ToShortDateString();
                txt_email.Text = dt.Rows[0]["user_email"].ToString();
                rbl_gender.SelectedValue = dt.Rows[0]["user_gender"].ToString();
                ddl_course.SelectedValue = dt.Rows[0]["user_course"].ToString();
                ddl_JP.SelectedValue = dt.Rows[0]["jobprofileID"].ToString();
                string[] arr = dt.Rows[0]["user_skill"].ToString().Split(',');
                tr_skills.Visible = true;
                cbl_skill.ClearSelection();
                for (int i = 0; i < cbl_skill.Items.Count; i++)
                {
                    for (int j = 0; j < arr.Length; j++)
                    {
                        if (cbl_skill.Items[i].Text == arr[j])
                        {
                            cbl_skill.Items[i].Selected = true;
                            break;
                        }
                    }
                }
                ddl_country.SelectedValue = dt.Rows[0][11].ToString();
                ddl_state.Enabled = true;
                BindState();
                ddl_state.SelectedValue = dt.Rows[0][12].ToString();
                ddl_city.Enabled = true;
                BindCity();
                ddl_city.SelectedValue = dt.Rows[0][13].ToString();
                ViewState["image"] = dt.Rows[0]["user_image"].ToString();
                ViewState["rsm"] = dt.Rows[0]["user_resume"].ToString();
                btn_save.Text = "Update";
            }

        }

        public string token()
        {
            //byte[] time = BitConverter.GetBytes(DateTime.UtcNow.ToBinary());
            //byte[] key = Guid.NewGuid().ToByteArray();
            //string token = Convert.ToBase64String(time.Concat(key).ToArray());
            //return token;
            var allChar = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var random = new Random();
            var resultToken = new string(
               Enumerable.Repeat(allChar, 32)
               .Select(token => token[random.Next(token.Length)]).ToArray());

            string authToken = resultToken.ToString();
            return authToken;
        }
        public int checkMail(string str)
        {
            con.Open();
            SqlCommand cmd1 = new SqlCommand("sp_user_mail_check", con);
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.AddWithValue("@user_email", str);
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt.Rows.Count;

        }
        protected void btn_save_Click(object sender, EventArgs e)
        {
            string RN = "";
            string img = "";
            string skl = "";
            string imgext = "";
            string resumeext = "";
            string tkn = token();
            var encoded = WebUtility.UrlEncode(tkn.Replace('\\', '+'));
            
            for (int i = 0; i < cbl_skill.Items.Count; i++)
            {
                if (cbl_skill.Items[i].Selected == true)
                {
                    skl += cbl_skill.Items[i].Text + ',';
                }
            }
            skl = skl.TrimEnd(',');
            if (btn_save.Text == "Register")
            {
                //code for check e-mail
                int num = checkMail(txt_email.Text);
                if (num > 0)
                {
                    lblmsg.ForeColor = Color.Red;
                    lblmsg.Text = "E-mail already regitered!!";
                }
                else
                {
                    RN = DateTime.Now.Ticks.ToString() + Path.GetFileName(fu_resume.PostedFile.FileName);
                    img = DateTime.Now.Ticks.ToString() + Path.GetFileName(fu_image.PostedFile.FileName);
                    imgext = Path.GetExtension(fu_image.PostedFile.FileName);
                    resumeext = Path.GetExtension(fu_resume.PostedFile.FileName);
                    fu_resume.SaveAs(Server.MapPath("resume" + "\\" + RN));
                    fu_image.SaveAs(Server.MapPath("photo" + "\\" + img));
                    if (imgext.ToString().ToLower() == ".jpg" || imgext.ToString().ToLower() == ".jpeg" || imgext.ToString().ToLower() == ".png")
                    {
                        if (resumeext.ToString().ToLower() == ".doc" || resumeext.ToString().ToLower() == ".docx" || resumeext.ToString().ToLower() == ".pdf")
                        {
                            con.Open();
                            SqlCommand cmd = new SqlCommand("sp_tbl_userRegistration_insert", con);
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@user_name", txt_name.Text);
                            cmd.Parameters.AddWithValue("@user_email", txt_email.Text);
                            cmd.Parameters.AddWithValue("@user_password", txt_password.Text);
                            cmd.Parameters.AddWithValue("@user_gender", rbl_gender.SelectedValue);
                            cmd.Parameters.AddWithValue("@user_course", ddl_course.SelectedValue);
                            cmd.Parameters.AddWithValue("@user_resume", RN);
                            cmd.Parameters.AddWithValue("@user_image", img);
                            cmd.Parameters.AddWithValue("@user_dob", Convert.ToDateTime(txt_dob.Text));
                            cmd.Parameters.AddWithValue("@countryID", ddl_country.SelectedValue);
                            cmd.Parameters.AddWithValue("@stateID", ddl_state.SelectedValue);
                            cmd.Parameters.AddWithValue("@cityID", ddl_city.SelectedValue);
                            cmd.Parameters.AddWithValue("@jobprofileID", ddl_JP.SelectedValue);
                            cmd.Parameters.AddWithValue("@user_skill", skl);
                            cmd.Parameters.AddWithValue("@token", tkn); 
                            int i = cmd.ExecuteNonQuery();
                            con.Close();
                            if (i > 0)
                            {
                                 MailAddress bcc = new MailAddress("avneesh.gangwar@outlook.com");
                                 using (MailMessage mm = new MailMessage("awaneeshkumar051@gmail.com", txt_email.Text))
                                 {
                                     mm.Subject = "Verification Mail";
                                     mm.Body ="Hi,"+ txt_name.Text + "please click http://localhost:49747/email_verification.aspx?token="+ tkn + " here to veify your mail";
                                     mm.CC.Add(bcc);
                                     mm.IsBodyHtml = true;
                                     SmtpClient smtp = new SmtpClient();
                                     smtp.Host = "smtp.gmail.com";
                                     smtp.EnableSsl = true;
                                     NetworkCredential NetworkCred = new NetworkCredential("awaneeshkumar051@gmail.com","Akg@4321");
                                     smtp.UseDefaultCredentials = true;
                                     smtp.Credentials = NetworkCred;
                                     smtp.Port = 25;
                                     smtp.Send(mm);
                                     ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Your registration has been done. Kindly check your mail');", true);
                                 }
                                Response.Write("<script>window.location='Login.aspx';</script>");
                                clear();
                            }
                            else
                            {
                                lblmsg.ForeColor = Color.BlueViolet;
                                lblmsg.Text = "Registration not done!!";
                            }

                        }
                        else
                        {
                            lblmsg.ForeColor = Color.Red;
                            lblmsg.Text = "please upload only doc, docx or pdf file for resume !!";
                        }
                    }
                    else
                    {
                        lblmsg.ForeColor = Color.Red;
                        lblmsg.Text = "please upload only jpg,jpeg or png files for photo !!";
                    }
                }
            }
            else if (btn_save.Text == "Update")
            {
                int num = checkMail(txt_email.Text);
                if (num > 0)
                {
                    lblmsg.ForeColor = Color.Red;
                    lblmsg.Text = "E-mail already regitered!!";
                }
                else
                {
                    img = Path.GetFileName(fu_image.PostedFile.FileName);
                    RN = Path.GetFileName(fu_resume.PostedFile.FileName);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("sp_tbl_userRegistration_update", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@user_id", Request.QueryString["userID"]);
                    cmd.Parameters.AddWithValue("@user_name", txt_name.Text);
                    cmd.Parameters.AddWithValue("@user_email", txt_email.Text);
                    cmd.Parameters.AddWithValue("@user_gender", rbl_gender.SelectedValue);
                    cmd.Parameters.AddWithValue("@user_course", ddl_course.SelectedValue);
                    cmd.Parameters.AddWithValue("@user_dob", Convert.ToDateTime(txt_dob.Text));
                    cmd.Parameters.AddWithValue("@countryID", ddl_country.SelectedValue);
                    cmd.Parameters.AddWithValue("@stateID", ddl_state.SelectedValue);
                    cmd.Parameters.AddWithValue("@cityID", ddl_city.SelectedValue);
                    cmd.Parameters.AddWithValue("@jobprofileID", ddl_JP.SelectedValue);
                    cmd.Parameters.AddWithValue("@user_skill", skl);
                    if (img != "")
                    {
                        imgext = Path.GetExtension(fu_image.PostedFile.FileName);
                        if (imgext.ToString().ToLower() == ".jpg" || imgext.ToString().ToLower() == ".jpeg" || imgext.ToString().ToLower() == ".png")
                        {
                            img = DateTime.Now.Ticks.ToString() + img;
                            cmd.Parameters.AddWithValue("@user_image", img); ;
                            File.Delete(Server.MapPath("photo" + "\\" + ViewState["image"]));
                            fu_image.SaveAs(Server.MapPath("photo" + "\\" + img));
                        }
                        else
                        {
                            lblmsg.ForeColor = Color.Red;
                            lblmsg.Text = "please upload only jpg,jpeg or png files for photo !!";
                        }

                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@user_image", ViewState["image"]);
                    }
                    if (RN != "")
                    {
                        resumeext = Path.GetExtension(fu_resume.PostedFile.FileName);
                        if (resumeext.ToString().ToLower() == ".doc" || resumeext.ToString().ToLower() == ".docx" || resumeext.ToString().ToLower() == ".pdf")
                        {
                            RN = DateTime.Now.Ticks.ToString() + RN;
                            cmd.Parameters.AddWithValue("@user_resume", RN);
                            File.Delete(Server.MapPath("resume" + "\\" + ViewState["rsm"]));
                            fu_resume.SaveAs(Server.MapPath("resume" + "\\" + RN));
                        }
                        else
                        {
                            lblmsg.ForeColor = Color.Red;
                            lblmsg.Text = "please upload only doc, docx or pdf file for resume !!";
                        }
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@user_resume", ViewState["rsm"]);
                    }

                    int i = cmd.ExecuteNonQuery();
                    con.Close();
                    if (i > 0)
                    {
                        Response.Redirect("userHome.aspx");
                    }
                    else
                    {
                        lblmsg.ForeColor = Color.Red;
                        lblmsg.Text = "Your record has not been updated successfully !!!";
                    }
                }
            }
        }

        protected void ddl_country_SelectedIndexChanged(object sender, EventArgs e)
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

        protected void ddl_JP_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_JP.SelectedValue == "0")
            {
                tr_skills.Visible = false;
                //tr_skills.Attributes.Add("style", "display:none");
            }
            else
            {
                tr_skills.Visible = true;
                //tr_skills.Attributes.Add("style", "display:normal");
                BindSkills();
            }

        }
    }
}