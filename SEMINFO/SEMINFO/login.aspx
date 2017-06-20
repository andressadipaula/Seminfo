<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="SEMINFO.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Semana da Informática</title>
    <!--define a viewport-->
    <meta name="viewport" content="width-device-width, inicial-scale=1.0">
    <!--adicionar CSS bootstrap-->
    <link type="text/css" rel="stylesheet" href="Bootstrap/bootstrap.min.css" media="screen" />
    <link href="Estilos/estiloLogin.css" rel="stylesheet" />

    <%--Coloca icone na Aba html--%>
    <link rel="shortcut icon" href="../Imagens/logo-UEMG-JPEG.jpg"/>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container" runat="server">
                <div class="col-md-10 col-xs-10 col-sm-10 col-md-offset-1 col-xs-offset-1 col-sm-offset-1">
                    <br />
                    <div class="row">
                        <div class="jumbotron">
                            <h3><asp:Label ID="Label1" runat="server" Text="FORMULÁRIO DE CADASTRO SEMANA DA INFORMÁTICA" Font-Bold="True" ForeColor="#0066FF"></asp:Label>
                            </h3>
                        </div>
                    </div>
                    <div class="row">
                        <h3>Faça Login ou Cadastre-se:</h3>
                        <hr />
                    </div>
                    <br />

                    <%--Dados de Preenchimento Login--%>
                    <div class="row">
                        <div class="col-lg-offset-2 col-lg-8 col-md-offset-2 col-md-8 col-sm-offset-2 col-sm-8 col-xs-offset-2 col-xs-8">
                            <div class="col-md-4">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Imagens/lock-open-blue.png" Height="146px" Width="157px" />

                            </div>
                            <div class="form-group col-md-8">
                                <label for="email">E-mail:</label>
                                <asp:TextBox ID="txtEmail" runat="server" placeholder="Seu e-mail aqui" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group col-md-8">
                                <label for="senha">Senha:</label>
                                <asp:TextBox ID="txtSenha" runat="server" placeholder="Sua senha aqui" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            </div>

                            <%--Botões--%>
                            <div id="botaoLogin" class="form-group col-md-12">
                                <asp:Label ID="lblErro" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                <asp:Button ID="btnEntrar" runat="server" Text="Entrar" CssClass="btn btn-primary" ToolTip="Fazer Login no Sistema" OnClick="btnEntrar_Click" />
                                <asp:Button ID="btnLimpar" runat="server" Text="Limpar" CssClass="btn btn-default" ToolTip="Limpar dados" OnClick="btnLimpar_Click" />
                                <br /><br />
                                <asp:HyperLink ID="hlCadastre" runat="server" ToolTip="Faça seu cadastro" NavigateUrl="~/cadastro.aspx">É novo por aqui? Cadastre-se</asp:HyperLink>
                            </div>

                        </div>
                    </div>

                    <hr />

                    <%--Rodapé--%>
                    <div id="rodape">
                        <div class="col-md-offset-3 col-md-6">
                            <div class="col-md-1">
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Imagens/logo-UEMG-JPEG.jpg" Height="34px" Width="34px" />
                            </div>
                            <div class="col-md-11">
                                <div class="row">Universidade do Estado de Minas Gerais</div>
                                <div class="row">Av. Juca Stockler, 1130 | Bairro Belo Horizonte | Passos/MG</div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </form>

    <%--JavaScript e JQuery--%>
    <script type="text/javascript" src="Bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript" src="Bootstrap/jquery-3.1.1.js"></script>
</body>
</html>
