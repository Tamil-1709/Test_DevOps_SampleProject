using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SampleProject
{
    public partial class _Default : Page
    {
        public string txtusername;
        public string txtpassword;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void cmdlogin_ServerClick(object sender, EventArgs e)
        {
            string username = Request.Form["txtusername"];
            string password = Request.Form["txtpassword"];

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please enter valid credentials');", true);
            }
            string connStr = ConfigurationManager.AppSettings["ConnectionString"];

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand("usp_ValidateUser", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Username", username); //mailid
                    cmd.Parameters.AddWithValue("@Password", password);

                    conn.Open();
                    object result = cmd.ExecuteScalar(); // Assume stored procedure returns 1 for success, 0 for failure

                    if (result != null && Convert.ToInt32(result) == 1)
                    {
                        Response.Redirect("About.aspx");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid username or password');", true);
                    }
                }
            }
        }

    }
}