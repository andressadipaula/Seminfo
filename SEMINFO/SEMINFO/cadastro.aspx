<%@ Page Title="" Language="C#" MasterPageFile="masterPage.master" AutoEventWireup="true" CodeBehind="cadastro.aspx.cs" Inherits="SEMINFO.cadastro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="Estilos/cadastro.css" rel="stylesheet" />
    <div>
        <div class="container">
            <div class="col-md-offset-1 col-md-10">

                <%--Titulo--%>
                <div id="titulo" class="row">
                    <div class="jumbotron">
                        <h2>
                            <center><asp:Label ID="Label1" runat="server" Text="CADASTRO DE PARTICIPANTE" Font-Bold="True" ForeColor="#0066FF"></asp:Label></center>
                        </h2>
                    </div>
                </div>

                <%--Mensagem--%>
                <div id="mensagem" class="row">
                    <h3>Preencha o formulário de Cadastro:
                    </h3>
                </div>
                <hr />

                <%--Informações--%>
                <div id="informacoes">

                    <%--Linha 1 (CPF e EMAIL)--%>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="cpf">CPF:</label>
                            <asp:Label ID="lblCpf" runat="server" Text="" ForeColor="Red"></asp:Label>
                            <asp:TextBox ID="txtCPF" runat="server" placeholder="Apenas números*" CssClass="form-control" MaxLength="11"></asp:TextBox>

                        </div>
                        <div class="form-group col-md-6">
                            <label for="email">E-mail:</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="*" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="txtEmail" runat="server" placeholder="Seu e-mail aqui*" CssClass="form-control"></asp:TextBox>
                            
                        </div>
                    </div>

                    <%--Linha 2 (NOME, PERIODO e SENHA)--%>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="nome">Nome:</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo obrigatório" ControlToValidate="txtNome" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtNome" runat="server" placeholder="Seu nome aqui*" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="form-group col-md-1">
                            <label for="periodo">Período:</label>
                            <asp:DropDownList ID="ddlPeriodo" runat="server" class="btn btn-default dropdown-toggle">
                                <asp:ListItem Value="1">1º</asp:ListItem>
                                <asp:ListItem Value="2">2º</asp:ListItem>
                                <asp:ListItem Value="3">3º</asp:ListItem>
                                <asp:ListItem Value="4">4º</asp:ListItem>
                                <asp:ListItem Value="5">5º</asp:ListItem>
                                <asp:ListItem Value="6">6º</asp:ListItem>
                                <asp:ListItem Value="7">7º</asp:ListItem>
                                <asp:ListItem Value="8">8º</asp:ListItem>
                                <asp:ListItem Value="9">9º</asp:ListItem>
                                <asp:ListItem Value="10">10º</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group col-md-5">
                            <label for="senha">Senha:</label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Campo obrigatório" ControlToValidate="txtSenha" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtSenha" runat="server" placeholder="Sua senha aqui*" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <hr />

                <%--Botões--%>
                <div class="col-md-8">
                    <%--<div class="alert alert-danger" role="alert">
                        <asp:Label ID="lblAlerta" runat="server" Visible="False"></asp:Label>
                    </div>--%>
                    <asp:Label ID="lblErro" runat="server" Text=""></asp:Label>
                </div>

                <div class="col-md-4">
                    <div id="botao" class="form-group">
                        <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar" CssClass="btn btn-primary" ToolTip="Cadastrar dados" OnClick="btnCadastrar_Click" />
                        <asp:Button ID="btnCancelar" runat="server" Text="Voltar" CssClass="btn btn-default" ToolTip="Cancelar Cadastro" OnClick="btnCancelar_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
