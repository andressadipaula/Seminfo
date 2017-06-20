using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SEMINFO
{
    public partial class cadastro : System.Web.UI.Page
    {
        //Todo usuário ao se cadastrar, recebe a permissa 0 (Usuário Comum)
        //Somente tem permissão 1 (Usuário Administrador), aquele que tem sua permissão alterada no banco de dados.
        int permissao = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            txtCPF.Focus();
            escondePainel();          
        }

        #region Método Esconde Painel
        public void escondePainel()
        {
            Panel panelMenu = (Panel)Master.FindControl("panelMenu");//cria uma instancia para o painel de menu            
            panelMenu.Visible = false;//esconde o painel
        }
        #endregion

        #region Método Verifica CPF

        public static bool validarCPF(string CPF)
        {
            int[] mt1 = new int[9] { 10, 9, 8, 7, 6, 5, 4, 3, 2 };
            int[] mt2 = new int[10] { 11, 10, 9, 8, 7, 6, 5, 4, 3, 2 };
            string TempCPF;
            string Digito;
            int soma;
            int resto;

            CPF = CPF.Trim();
            CPF = CPF.Replace(".", "").Replace("-", "");

            if (CPF.Length != 11)
                return false;

            if ((CPF.Length != 11) || (CPF == "00000000000") || (CPF == "11111111111") || (CPF == "22222222222")
                || (CPF == "33333333333") || (CPF == "44444444444") || (CPF == "55555555555") || (CPF == "66666666666")
                || (CPF == "77777777777") || (CPF == "88888888888") || (CPF == "99999999999"))
            {
                return false;
            }

            TempCPF = CPF.Substring(0, 9);
            soma = 0;
            for (int i = 0; i < 9; i++)
                soma += int.Parse(TempCPF[i].ToString()) * mt1[i];

            resto = soma % 11;
            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;

            Digito = resto.ToString();
            TempCPF = TempCPF + Digito;
            soma = 0;

            for (int i = 0; i < 10; i++)
                soma += int.Parse(TempCPF[i].ToString()) * mt2[i];

            resto = soma % 11;
            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;

            Digito = Digito + resto.ToString();

            return CPF.EndsWith(Digito);
        }
        #endregion

        #region Método Cadastra
        public void cadastra()
        {
            connection _connection = new connection();
            if (validarCPF(txtCPF.Text))
            {
                _connection.executeQuery(@"INSERT INTO participante(cpf, email, nome, periodo, senha, permissao)
                                VALUES('" + txtCPF.Text + "', '" + txtEmail.Text + "', '" + txtNome.Text + "', '" + ddlPeriodo.SelectedValue + "', '" + txtSenha.Text + "', '" + permissao + "')");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Alerta", "alert('Cadastro realizado com sucesso!'); window.location='" + Request.ApplicationPath + "login.aspx';", true);
            }

            if (validarCPF(txtCPF.Text) == false)
            {
                txtCPF.Focus();
                lblCpf.Text = "CPF Inválido";
            }
        }
        #endregion

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            cadastra();
        }        
    }
}