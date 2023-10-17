using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmpleadosParcial
{
    public partial class Empleados_ABM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(TextBox1.Text) &&
                !string.IsNullOrEmpty(TextBox2.Text)) 
            {
                try
                {
                    SqlDataSource1.InsertParameters["nombre"].DefaultValue = TextBox1.Text;
                    SqlDataSource1.InsertParameters["apellido"].DefaultValue = TextBox2.Text;
                    SqlDataSource1.InsertParameters["idSector"].DefaultValue = DropDownList1.SelectedValue;
                    SqlDataSource1.Insert();
                    Label1.Text = "Se efectuó la carga";
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                   
                }
                catch (Exception ex)
                {
                    Label1.Text = "Error: " + ex.Message;
                }
            }
            else
            {
                
                Label1.Text = "Por favor, complete todos los campos antes de continuar.";
            }


        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex >= 0)
            {
                string id = GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text;
                string nombre = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;
                string apellido = GridView1.Rows[GridView1.SelectedIndex].Cells[2].Text;
                string sector = GridView1.Rows[GridView1.SelectedIndex].Cells[3].Text;

                Label2.Text = "ID: " + id + "<br/>" + "Nombre: " + nombre + "<br/>" + "Apellido: " + apellido + "<br/>" + "Sector: " + sector;

                TextBox3.Text = GridView1.SelectedRow.Cells[1].Text;
                TextBox4.Text = GridView1.SelectedRow.Cells[2].Text;
            }
            else
            {
                Label2.Text = "No se ha seleccionado ninguna fila.";
            }
                
            
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataSource1.Update();
            }
            catch (Exception ex)
            {
                Label1.Text = "Error: " + ex.Message;
            }
        }
    

        protected void Button4_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataSource1.FilterExpression = string.Empty;
                SqlDataSource1.FilterParameters.Clear();
            }
            catch (Exception ex)
            {
                Label1.Text = "Error: " + ex.Message;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataSource1.FilterExpression = "id =" + DropDownList2.SelectedValue;
            }
            catch (Exception ex)
            {
                Label1.Text = "Error: " + ex.Message;
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            try
            {
                string rutaCompleta = @"C:\Users\Ulises\Desktop\BDparcial\RegistroEmpleados.txt";

                using (StreamWriter arch = new StreamWriter(rutaCompleta, true))
                {
                    arch.WriteLine(Label2.Text);
                }

                Label3.Text = "Datos Registrados";
            }
            catch (Exception ex)
            {
                Label3.Text = "Error al registrar datos: " + ex.Message;
            }

        }
    }
}