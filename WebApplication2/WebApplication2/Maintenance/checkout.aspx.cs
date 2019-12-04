using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication2.Maintenance
{
    public partial class checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CompareTodayValidator.ValueToCompare = DateTime.Now.ToShortDateString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Declare objects
                SqlConnection conn;
                SqlCommand comm;
                // Initialize connection
                string connectionString = ConfigurationManager.ConnectionStrings["disk_inventoryssConnectionString"].ConnectionString;
                conn = new SqlConnection(connectionString);
                // Create command
                comm = new SqlCommand(
                   "EXECUTE sp_ins_checkout @borrower_id, @disk_id, @checkout_date", conn);

                // Add parameter
                comm.Parameters.Add("@borrower_id", System.Data.SqlDbType.Int);
                comm.Parameters["@borrower_id"].Value = DropDownList2.SelectedValue;
                comm.Parameters.Add("@disk_id", System.Data.SqlDbType.Int);
                comm.Parameters["@disk_id"].Value = DropDownList1.SelectedValue;
                comm.Parameters.Add("@checkout_date", System.Data.SqlDbType.Date);
                comm.Parameters["@checkout_date"].Value = TextBox1.Text;
                // Enclose database code in Try-Catch-Finally
                try
                {
                    // Open the connection
                    conn.Open();
                    // Execute the command
                    comm.ExecuteReader();

                    // Display completed message
                    Label1.Text = "New checkout has been made for Borrower: " + "<b>" + DropDownList2.SelectedItem +"</b>" + " and Disk: "+ "<b>" + DropDownList1.SelectedItem + "</b>" + " <br> Thank you";

                    DropDownList1.DataBind();
                    DropDownList2.Text = "";
                    TextBox1.Text = "";

                }
                catch (SqlException ex)
                {
                    string str;
                    str = "Source:" + ex.Source;
                    str += "\n" + "Number:" + ex.Number.ToString();
                    str += "\n" + "Message:" + ex.Message;
                    str += "\n" + "Class:" + ex.Class.ToString();
                    str += "\n" + "Procedure:" + ex.Procedure.ToString();
                    str += "\n" + "Line Number:" + ex.LineNumber.ToString();
                    str += "\n" + "Server:" + ex.Server.ToString();
                    // Display error message
                    Label1.Text = str;
                }
                finally
                {
                    // Close the connection
                    conn.Close();
                }
            }
        }
        // Adding additional item to dropdown list
        protected void ddl_DataBound(Object sender, EventArgs e)
        {
            DropDownList1.Items.Insert(0, new ListItem("--- select One ---", String.Empty));
        }
        // Adding additional item to dropdown list
        protected void ddl_DataBound1(Object sender, EventArgs e)
        {
            DropDownList2.Items.Insert(0, new ListItem("--- select One ---", String.Empty));
        }

    }
}