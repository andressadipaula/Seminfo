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
    public partial class evento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SessionUsuario"] == null)
            {
                Response.Redirect("login.aspx");
            }

            if (Session["SessionUsuario"] == "Comum")
            {
                Response.Redirect("home.aspx");
            }
            this.preencheParticipante();
        }

        #region Método para preencher dropdown com Participantes
        //Melhorar isso, preenchendo direto da classe connection
        public void preencheParticipante()
        {
            String conexao = @"SERVER= localhost; port=3303; DATABASE=seminfo_bd; UID=root; PASSWORD=123456;";
            
            try
            {
                // Criar um conexão com o BD
                MySqlConnection con = new MySqlConnection(conexao);
                con.Open();// Abre a conexão 
                // Define o comando SQL
                MySqlCommand cmd = new MySqlCommand(
                   @"SELECT id, nome FROM palestrante
                ORDER BY nome ASC", con);
                DataTable dt = new DataTable(); // Define uma tabela genérica                
                MySqlDataAdapter da = new MySqlDataAdapter(cmd); // Define um adaptador dos dados
                da.Fill(dt); // Preenche a tabela genérica com o resultado da consulta
                ddlPalestrante.DataValueField = "id"; // Define o valor para o DDL (chave primária)
                ddlPalestrante.DataTextField = "nome"; // Define a coluna que será exibida na tela                
                ddlPalestrante.DataSource = dt; // Define a fonte de dados para o DDl
                ddlPalestrante.DataBind(); // Atualiza a página                
                ddlPalestrante.Items.Insert(1, "Selecione um Palestrante"); // Insere uma nova opção do DDL
                con.Close(); // Fecha a Conexão com o BD
            }
            catch (Exception erro)
            {
                Console.WriteLine(erro.Message);
            }
        }
        #endregion

        #region Método Cadastra
        public void cadastra()
        {
            connection _connection = new connection();
            _connection.executeQuery(@"INSERT INTO evento (descricao, data, horario, idPalestrante, tipo, local, observacoes)
                                VALUES('" + txtDescricao.Text + "', '" + txtData.Text + "', '" + txtHorário.Text + "', '" + ddlPalestrante.SelectedValue + "', '" + ddlTipo.SelectedValue + "', '" + txtLocal.Text + "', '" + txtObservacoes.Text + "')");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Alerta", "alert('Cadastro realizado com sucesso!'); window.location='" + Request.ApplicationPath + "home.aspx';", true);
        }
        #endregion

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }

        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            cadastra();
        }       
    }
}