<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="palestrante.aspx.cs" Inherits="SEMINFO.palestrante" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Estilos/palestrante.css" rel="stylesheet" />
    <div>
        <div class="container">
            <div class="col-md-offset-1 col-md-10">

                <%--Titulo--%>
                <div id="titulo">
                    <div class="row">
                        <div class="jumbotron">
                            <%--<div class="col-md-1">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Imagens/addUser.jpg" Height="82px" Width="83px" />
                        </div>--%>
                            <div class="col-lg-12 col-md-12 col-xm-12 col-xs-12">
                                <h2>
                                    <center><asp:Label ID="Label1" runat="server" text-align="left" Text="CADASTRO DE PALESTRANTE" Font-Bold="True" ForeColor="#0066FF"></asp:Label></center>
                                </h2>
                            </div>
                        </div>
                    </div>
                </div>

                <%--Mensagem--%>
                <div id="mensagem" class="row">
                    <h3>Preencha os dados para cadastrar um Palestrante:
                    </h3>
                </div>
                <hr />

                <%--Informações--%>
                <div id="informacoes">

                    <%--Linha 1 (NOME e TELEFONE)--%>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="nome">Nome:</label>
                            <asp:TextBox ID="txtNome" runat="server" placeholder="Nome completo*" CssClass="form-control"></asp:TextBox>

                        </div>
                        <div class="form-group col-md-6">
                            <label for="telefone">Telefone:</label>
                            <asp:TextBox ID="txtTelefone" runat="server" placeholder="Telefone ou Celular*" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <%--Linha 2 (EMAIL e CURRICULO)--%>
                    <div class="row">
                        <div class="form-group col-md-6">
                            <label for="email">Email:</label>
                            <asp:TextBox ID="txtEmail" runat="server" placeholder="E-mail*" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="form-group col-md-6">
                            <label for="curriculo">Currículo:</label>
                            <asp:TextBox ID="txtCurriculo" runat="server" placeholder="Breve resumo do Currículo*" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <hr />

                <%--Botões--%>
                <div id="botao" class="form-group col-md-8">
                    <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar" CssClass="btn btn-primary" ToolTip="Cadastrar Participante" OnClick="btnCadastrar_Click" />
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-default" ToolTip="Cancelar" OnClick="btnCancelar_Click" />
                </div>

            </div>
        </div>
    </div>

</asp:Content>
