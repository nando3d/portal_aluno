<%-- 
    Document   : pesquisar
    Created on : 17/07/2016, 17:15:43
    Author     : Fernando
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>PESQUISA LIVRO</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Free HTML5 Website Template by FreeHTML5.co" />
        <meta name="keywords" content="free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
        <meta name="author" content="FreeHTML5.co" />


        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link rel="shortcut icon" href="favicon.ico">

        <link href="https://fonts.googleapis.com/css?family=Roboto:400,300,600,400italic,700" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">

        <!-- Animate.css -->
        <link rel="stylesheet" href="css/animate.css">
        <link type="text/css" rel="stylesheet" href="css/estilo.css" />
        <!-- Icomoon Icon Fonts-->
        <link rel="stylesheet" href="css/icomoon.css">
        <!-- Bootstrap  -->
        <link rel="stylesheet" href="css/bootstrap.css">
        <!-- Owl Carousel -->
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <!-- Theme style  -->
        <link rel="stylesheet" href="css/style.css">

        <!-- Modernizr JS -->
        <script src="js/modernizr-2.6.2.min.js"></script>
        <!-- FOR IE9 below -->
        <!--[if lt IE 9]>
        <script src="js/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>
        <div id="fh5co-page">
            <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
            <aside id="fh5co-aside" role="complementary" class="border js-fullheight">

                <h1 id="fh5co-logo"><a href="index.html"><img src="images/logo.png" alt="Free HTML5 Bootstrap Website Template"></a></h1>
                <nav id="fh5co-main-menu" role="navigation">
                    <ul>
                        <li class="fh5co-active"><a href="index.html">Início</a></li>
                        <li><a href="portfolio.html">Meu Perfil</a></li>
                        <li><a href="about.html">Sobre nós</a></li>
                        <li><a href="contact.html">Contato</a></li>
                    </ul>
                </nav>

                <div class="fh5co-footer">
                    <p><span><small>&copy; 2016 Portal do Aluno INF. Todos os direitos reservados.</small></span></p>

                </div>

            </aside>
            <script type="text/javascript">
                $(document).ready(function () {
                    $('button').corner("3px");
                    $('#principal').corner();
                    $('a').corner();
                });
            </script>
        </head>
        <body>
        <section id="team3" class="mt15">
            <div class="container">
                <div class="row mb40"> 

                    <br>
                    <br>
                    <br>
                    <h2>Pesquisar PDF's de Livros</h2>


                    <table id="tbl_cad">
                        <tr>
                            <th>Buscar pelo nome: </th>
                            <td><input type="text" id="txt_busca" title="Deixe em branco para todos" /></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td><button id="btn_buscar" onclick="pesquisaUsuario();">Buscar</button></td>
                        </tr>
                    </table>

                    <br>

                    <table id="tbl_aluno">
                    </table>

                    <br>
                    <br>
                    <br>
                    



                    <script type="text/javascript">
                        //Função para enviar requisições HTTP
                        function initXHR() {
                            // criando xhr de acordo com o browser
                            if (window.XMLHttpRequest) { // Nao microsoft
                                xhr = new XMLHttpRequest();
                            } else if (window.ActiveXObject) {
                                xhr = new ActiveXObject("Microsoft.XMLHttp");
                            }
                        }
                        //Este codigo e o initXHR sempre serão os mesmo. Não há necessidade de criar outro
                        function sendRequest(url, handler) {
                            initXHR();
                            // setando método de resposta no xhr
                            xhr.onreadystatechange = handler;
                            // abrindo requisição
                            xhr.open("GET", url, true);
                            // executando xhr
                            xhr.send(null);
                        }
                        function pesquisaUsuario() {
                            var nome = window.document.getElementById("txt_busca");

                            var url = "sBuscaLivro?usuario=" + nome.value;

                            sendRequest(url, ajaxBuscaUsuario);
                        }
                        function ajaxBuscaUsuario() {
                            if (xhr.readyState == 4) { // requisicao concluida
                                // status da resposta 200 = OK, (404 página não encontrada, 500 erro no servidor)
                                if (xhr.status == 200) {
                                    // setando valores de resposta do servlet na tabela inserindo as TD digitada no Servlet

                                    //Selecionando o ID da linha onde irá começar a exibir o resultado
                                    var valor = window.document.getElementById("tbl_aluno");
                                    //salvo em uma variável o retorno do Servlet
                                    var retorno = xhr.responseText;
                                    //Exibo no HTML o que foi retornado do Servlet
                                    valor.innerHTML = retorno;
                                }
                            }
                        }
                    </script>
                    </body>
                    </html>
