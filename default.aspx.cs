using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace JQueryFormValidation
{
    public partial class _default : System.Web.UI.Page
    {
        SqlCommand cmd = new SqlCommand();
        SqlConnection con = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.ConnectionString = "Data Source=.;Initial Catalog=JQuery;Integrated Security=True";
            con.Open();

        }

        protected void submitbtn_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("insert into reg " + "(usernames,pass,cpass,emailid,mobileno)values(@usernames,@pass,@cpass,@emailid,@mobileno)", con);
            cmd.Parameters.AddWithValue("@usernames", usernames.Text);
            cmd.Parameters.AddWithValue("@pass", passwords.Text);

            cmd.Parameters.AddWithValue("@cpass", cpasss.Text);
            cmd.Parameters.AddWithValue("@emailid", emailid.Text);
            cmd.Parameters.AddWithValue("@mobileno", mobileno.Text);


            cmd.ExecuteNonQuery();


            usernames.Text = "";

            passwords.Text = "";
            cpasss.Text = "";
            emailid.Text = "";
            mobileno.Text = "";

        }
    }
}