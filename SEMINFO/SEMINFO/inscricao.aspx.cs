using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//Usa Referencia do MySql
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Data;

namespace SEMINFO
{
    public partial class inscricao : System.Web.UI.Page
    {
        static string conexao = @"SERVER= localhost; port=3303; DATABASE=seminfo_bd; UID=root; PASSWORD=123456;";
        MySqlConnection con = new MySqlConnection(conexao);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SessionUsuario"] == null)
            {
                Response.Redirect("login.aspx");
            }
            preencheGrid();
        }

        public void preencheGrid()
        {
            try
            {
                con.Open(); //abre a conexao
                MySqlCommand cmd = new MySqlCommand(@"SELECT * FROM evento", con); //define o comando sql                
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);//define um adaptador de dados a partir da consulta SQL                
                DataTable dt = new DataTable();//cria um dataTable                
                da.Fill(dt);//adicionar os dados no Data Table                
                gvEvento.DataSource = dt;//define a fonte de dados para o grid view 
                gvEvento.DataBind();//carrega os dados para o grid view                
            }
            catch (Exception erro)
            {
                Console.WriteLine(erro.Message);
                throw;
            }
            finally
            {
                con.Close();
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }

        protected void gvEvento_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[0].Width = 50;
            e.Row.Cells[1].Visible = false;
            e.Row.Cells[2].Width = 150;
            e.Row.Cells[3].Width = 100;
            e.Row.Cells[4].Width = 100;
            e.Row.Cells[5].Visible = false;
            e.Row.Cells[6].Width = 100;
            e.Row.Cells[7].Width = 100;
            e.Row.Cells[8].Width = 250;
        }
    }
}