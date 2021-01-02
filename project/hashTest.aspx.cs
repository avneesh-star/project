using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCrypt.Net;

namespace project
{
    public partial class hashTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //bcryptTest();
        }

        //public void bcryptTest()
        //{
        //    const string password = txtpass.Text;
        //    const int workfactor = 13;
        //    var start = DateTime.UtcNow;
        //    var hashed = BCrypt.Net.BCrypt.HashPassword(password,workfactor);
        //    var end = DateTime.UtcNow;

        //    Response.Write("\nhash length is {0} chars"+hashed.Length);
        //    Response.Write("\nProcessing time is {0} with workfactor{1}"+(end-start)+','+workfactor);
        //    Response.Write("\nhased password"+hashed);
        //    Response.Write("\ncorret password"+BCrypt.Net.BCrypt.Verify("avneesh",hashed));
        //    Response.Write("\nin corret password" + BCrypt.Net.BCrypt.Verify("avneewsh", hashed));

        //}
        
        protected void btnsave_Click(object sender, EventArgs e)
        {
             ViewState["hashed"]= BCrypt.Net.BCrypt.HashPassword(txtpass.Text, 12);
            lbl1.Text = "Entered password:" + txtpass.Text;
            lbl2.Text = "Password hashed:" + ViewState["hashed"].ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            bool res = BCrypt.Net.BCrypt.Verify(TextBox1.Text, ViewState["hashed"].ToString());
            if (res)
            {
                lbl3.Text = "Password matched!!";
            }
            else
            {
                lbl3.Text = "Password not matched!!";
            }
        }
    }
}