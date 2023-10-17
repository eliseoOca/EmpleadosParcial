using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmpleadosParcial
{
    public partial class EmpleadosSectores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(TextBox1.Text))
            {
                SqlDataSource1.Insert();
                GridView1.DataBind();
            }
            else
            {
               

                Label1.Text = "El campo no puede estar vacío.";
            }
        }
    }
}