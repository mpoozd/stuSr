<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="StudentServices.ControlPanel.Login" EnableEventValidation="false" %>

<!DOCTYPE html>

<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
    <meta charset="utf-8" />
    <title>Control Panel - Login</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta name="description" content="" />
    <meta name="keywords" content="">
    <meta name="author" content="" />
    <meta name="MobileOptimized" content="320">
    <!--srart theme style -->
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
    <!-- end theme style -->
    <!-- favicon links -->
    <link rel="shortcut icon" type="image/png" href="../images/favicon.png" />
</head>

<body>
    <form id="Frm" runat="server">
        <!--Loader Start -->
        <div class="mj_preloaded">
            <div class="mj_preloader">
                <div class="lines">
                    <div class="line line-1"></div>
                    <div class="line line-2"></div>
                    <div class="line line-3"></div>
                </div>

                <div class="loading-text">LOADING</div>
            </div>
        </div>
        <!--Loader End -->

        <div class="mj_lightgraytbg mj_bottompadder80">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0">
                        <div class="mj_mainheading mj_toppadder80 mj_bottompadder50">
                            <h1>l<span>ogin</span> c<span>ontrol</span> P<span>anel</span></h1>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-lg-offset-3 col-md-offset-3 col-sm-12 col-xs-12">
                        <div class="mj_pricingtable mj_greentable mj_login_form_wrapper">
                            <form>
                                <div class="mj_login_form">
                                    <div class="form-group">
                                        <asp:TextBox ID="txtUserName" runat="server" placeholder="Username or Email" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvQuestionnaireOptions" runat="server" InitialValue="0" ErrorMessage="Please Enter User Name" CssClass="validator" ValidationGroup="Login" ControlToValidate="txtUserName"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtPassword" runat="server" placeholder="Your Password" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="0" ErrorMessage="Please Enter Password" CssClass="validator" ValidationGroup="Login" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mj_toppadder20">
                                            <div class="form-group  pull-left">
                                                <div class="mj_checkbox">
                                                    <input type="checkbox" value="1" id="check2" name="checkbox">
                                                    <label for="check2"></label>
                                                </div>
                                                <span>remember me</span>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 mj_toppadder20">
                                            <div class="form-group pull-right">
                                                <span><a href="#">forget password ?</a></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="mj_pricing_footer">
                                    <asp:LinkButton ID="BtnLogin" runat="server" OnClick="BtnLogin_Click" ValidationGroup="Login">login Now</asp:LinkButton>
                                    <%--<a href="#">login Now</a>--%>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="mj_footer mj_toppadder80 mj_bottompadder80">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0">
                        <div class="mj_weight mj_bottompadder20">
                            <a href="index.html">
                                <img src="../images/logo.png" class="img-responsive" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="totop">
                        <div class="gototop">
                            <a href="#">
                                <i class="fa fa-angle-up"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Script Start -->
        <script src="../js/jquery-1.11.3.min.js" type="text/javascript"></script>
        <script src="../js/bootstrap.js" type="text/javascript"></script>
        <script src="../js/modernizr.custom.js" type="text/javascript"></script>
        <script type="text/javascript" src="../js/plugins/rsslider/jquery.themepunch.tools.min.js"></script>
        <script type="text/javascript" src="../js/plugins/rsslider/jquery.themepunch.revolution.min.js"></script>
        <script type="text/javascript" src="../js/plugins/rsslider/revolution.extension.layeranimation.min.js"></script>
        <script type="text/javascript" src="../js/plugins/rsslider/revolution.extension.navigation.min.js"></script>
        <script type="text/javascript" src="../js/plugins/rsslider/revolution.extension.parallax.min.js"></script>
        <script type="text/javascript" src="../js/plugins/rsslider/revolution.extension.slideanims.min.js"></script>
        <script src="../js/plugins/countto/jquery.countTo.js" type="text/javascript"></script>
        <script src="../js/plugins/owl/owl.carousel.js" type="text/javascript"></script>
        <script src="../js/plugins/bootstrap-slider/bootstrap-slider.js" type="text/javascript"></script>
        <script src="../js/plugins/fancybox/jquery.fancybox.js" type="text/javascript"></script>
        <script src="../js/plugins/fancybox/jquery.fancybox.pack.js" type="text/javascript"></script>
        <script src="../js/jquery.mixitup.js" type="text/javascript"></script>
        <script src="../js/plugins/jquery-ui/jquery-ui.js"></script>
        <script src="../js/plugins/isotop/isotope.pkgd.js"></script>
        <script src="../js/plugins/ckeditor/ckeditor.js"></script>
        <script src="../js/plugins/ckeditor/adapters/jquery.js"></script>
        <script src="../js/custom.js" type="text/javascript"></script>
        <!-- Script End -->

    </form>
</body>

</html>

