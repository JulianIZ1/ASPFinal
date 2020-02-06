using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient; //this namespace is for sqlclient server  
using System.Configuration;

namespace ASPFinal
{
    public partial class Login : System.Web.UI.Page
    {
        static String connString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        static SqlConnection myConn = new SqlConnection(connString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void Button1_Click(object sender, EventArgs e)
        {
         
                try
                {
                    string uid = txtUserID.Text;
                    string pass = txtPassword.Text;
                    myConn.Open();
                    string qry = "select * from Ulogin where UserId='" + uid + "' and Password='" + pass + "'";
                    SqlCommand cmd = new SqlCommand(qry, myConn);
                    SqlDataReader sdr = cmd.ExecuteReader();
                    if (sdr.Read())
                    {
                        Label4.Text = "Login Sucess......!!";

                        Response.Redirect("Dashboard.aspx");
                    }
                    else
                    {
                        Label4.Text = "UserId & Password Is not correct Try again..!!";

                    }
                    
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
                finally
                {
                myConn.Close();
                }
            

        }
    
    }
}