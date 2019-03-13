using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace JQueryFormValidation
{
    public partial class test2 : System.Web.UI.Page
    {
        string strConnString = ConfigurationManager.ConnectionStrings["AdminConnectionString"].ConnectionString;
        string str;
        SqlCommand com;

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strConnString);
            con.Open();
            str = "select * from reg";
            com = new SqlCommand(str, con);
            SqlDataReader reader = com.ExecuteReader();

            reader.Read();
            Label2.Text = reader["usernames"].ToString();

            reader.Read();
            Label4.Text = reader["pass"].ToString();

            reader.Read();
            Label6.Text = reader["cpass"].ToString();

            reader.Read();
            Label8.Text = reader["emailid"].ToString();

            reader.Read();
            Label10.Text = reader["mobileno"].ToString();

            reader.Close();
            con.Close();
        }
    }
}