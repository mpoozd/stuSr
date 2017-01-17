<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="StudentServices.Default" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="clearfix"></div>
    <div class="mj_slider">
        <!-- REVOLUTION SLIDER -->
        <div id="rev_slider_4_1_wrapper" class="rev_slider_wrapper fullwidthbanner-container" data-alias="classicslider1" style="margin: 0px auto; background-color: transparent; padding: 0px; margin-top: 0px; margin-bottom: 0px;">
            <div id="rev_slider_4_1" class="rev_slider fullwidthabanner" style="display: none;" data-version="5.0.7">
                <ul runat="server" id="Penner">
                </ul>
                <div class="tp-static-layers"></div>
                <div class="tp-bannertimer" style="height: 7px; background-color: rgba(255, 255, 255, 0.25);"></div>
            </div>
        </div>
        <!-- END REVOLUTION SLIDER -->
    </div>
    <div class="clearfix"></div>
    <div class="mj_lightgraytbg mj_toppadder80 mj_bottompadder80">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="mj_tabs mj_bottompadder50">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs mj_joblist" role="tablist">
                            <li role="presentation" class="active"><a href="#recentjobs" aria-controls="recentjobs" role="tab" data-toggle="tab">Recent Jobs</a>
                            </li>
                            <li role="presentation"><a href="#featuredjobs" aria-controls="featuredjobs" role="tab" data-toggle="tab">Featured Jobs</a>
                            </li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="recentjobs">
                                <div class="mj_tabcontent mj_toppadder30">
                                    <table class="table table-striped">
                                        <asp:Repeater ID="RepeaterRecentJobs" runat="server" DataSourceID="sqlGetRecentJobs">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><a href="#"><i class="fa fa-heart"></i></a>
                                                    </td>
                                                    <td>
                                                        <a href="#">
                                                            <img runat="server" id="imgLogo" src='<%# Bind("CompanyLogo") %>' class="img-responsive" alt="" width="70" height="70">
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <h4>
                                                            <asp:LinkButton ID="linkJobTitle" runat="server" Text='<%# Bind("JobTitle") %>' PostBackUrl='<%# Bind("URL") %>'></asp:LinkButton></h4>
                                                        <p style="margin-top: -22px">
                                                            <asp:Label ID="lblCompanyName" runat="server" Text='<%# Bind("CompanyNameEn") %>' Font-Size="14px" ForeColor="#959595"></asp:Label>
                                                        </p>
                                                    </td>
                                                    <td>
                                                        <i class="fa fa-map-marker"></i>
                                                        <p style="margin-top: -22px">
                                                            <asp:Label ID="lblCityName" runat="server" Text='<%# Bind("CityNameEn") %>' Font-Size="16px" ForeColor="#959595"></asp:Label>
                                                        </p>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="LinkTypesJobsDescription" runat="server" CssClass='<%# Bind("TypesJobsTheme") %>' Text='<%# Bind("TypesJobsDescriptionEn") %>' PostBackUrl='<%# Bind("URL") %>'></asp:LinkButton>
                                                    </td>
                                                    <td><span style="margin-top: -22px">
                                                        <asp:Label ID="lblSalary" runat="server" Text='<%# Bind("Salary") %>'></asp:Label></span>
                                                    </td>

                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </table>
                                    <asp:SqlDataSource ID="sqlGetRecentJobs" runat="server" ConnectionString='<%$ ConnectionStrings:StudentHubConnectionString %>' SelectCommand="SELECT [TypesJobsDescriptionEn], [CityNameEn], [CompanyNameEn], [JobTitle], 'Upload/'+[CompanyLogo] as CompanyLogo, [TypesJobsTheme], 'SAR ' +CONVERT(varchar,ExpectedSalary) as Salary, 'JobDetail.aspx?id='+CONVERT(varchar,[JobOpportunitiesId]) AS URL FROM [V_JobOpportunities]"></asp:SqlDataSource>
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-lg-offset-4 col-md-offset-4">
                                        <div class="mj_showmore">
                                            <a href="Jobs.aspx" class="mj_blackbtn mj_showmorebtn">Show More</a>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div role="tabpanel" class="tab-pane" id="featuredjobs">
                                <div class="mj_tabcontent mj_toppadder30">

                                    <table class="table table-striped">
                                        <asp:Repeater ID="RepeaterFeaturedJobs" runat="server" DataSourceID="SqlFeaturedJobs">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><a href="#"><i class="fa fa-heart"></i></a>
                                                    </td>
                                                    <td>
                                                        <a href="#">
                                                            <img runat="server" id="imgLogo" src='<%# Bind("CompanyLogo") %>' class="img-responsive" alt="" width="70" height="70">
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <h4>
                                                            <asp:LinkButton ID="linkJobTitle" runat="server" Text='<%# Bind("JobTitle") %>' PostBackUrl='<%# Bind("URL") %>'></asp:LinkButton></h4>
                                                        <p style="margin-top: -22px">
                                                            <asp:Label ID="lblCompanyName" runat="server" Text='<%# Bind("CompanyNameEn") %>' Font-Size="14px" ForeColor="#959595"></asp:Label>
                                                        </p>
                                                    </td>
                                                    <td>
                                                        <i class="fa fa-map-marker"></i>
                                                        <p style="margin-top: -22px">
                                                            <asp:Label ID="lblCityName" runat="server" Text='<%# Bind("CityNameEn") %>' Font-Size="16px" ForeColor="#959595"></asp:Label>
                                                        </p>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="LinkTypesJobsDescription" runat="server" CssClass='<%# Bind("TypesJobsTheme") %>' Text='<%# Bind("TypesJobsDescriptionEn") %>' PostBackUrl='<%# Bind("URL") %>'></asp:LinkButton>
                                                    </td>
                                                    <td><span style="margin-top: -22px">
                                                        <asp:Label ID="lblSalary" runat="server" Text='<%# Bind("Salary") %>'></asp:Label></span>
                                                    </td>

                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </table>





                                    <asp:SqlDataSource ID="SqlFeaturedJobs" runat="server" ConnectionString='<%$ ConnectionStrings:StudentHubConnectionString %>' SelectCommand="SELECT Top 2 [TypesJobsDescriptionEn], [CityNameEn], [CompanyNameEn], [JobTitle], 'Upload/'+[CompanyLogo] as CompanyLogo, [TypesJobsTheme], 'SAR ' +CONVERT(varchar,ExpectedSalary) as Salary, 'JobDetail.aspx?id='+CONVERT(varchar,[JobOpportunitiesId]) AS URL FROM [V_JobOpportunities] ORDER BY JobOpportunitiesId DESC"></asp:SqlDataSource>
                                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 col-lg-offset-4 col-md-offset-4">
                                        <div class="mj_showmore">
                                            <a href="Jobs.aspx" class="mj_blackbtn mj_showmorebtn">Show More</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0">
                    <div class="mj_mainheading mj_toppadder50 mj_bottompadder50">
                        <h1>M<span>eshjobs</span> S<span>ite</span> S<span>tats</span></h1>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mj_bottompadder20">
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="mj_countdiv">
                                <div class="mj_count_img">
                                    <img src="images/count1.png" class="img-responsive" alt="">
                                </div>
                                <div class="mj_countdata">
                                    <div id="JobsPostedNumber" runat="server"></div>
                                    <p>Jobs Posted</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="mj_countdiv">
                                <div class="mj_count_img">
                                    <img src="images/count2.png" class="img-responsive" alt="">
                                </div>
                                <div class="mj_countdata">
                                    <div id="CompaniesNumber" runat="server"></div>
                                    <p>Companies</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="mj_countdiv">
                                <div class="mj_count_img">
                                    <img src="images/count3.png" class="img-responsive" alt="">
                                </div>
                                <div class="mj_countdata">
                                    <div id="ResumesPostedNumber" runat="server"></div>
                                    <p>Resumes Posted</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                            <div class="mj_countdiv">
                                <div class="mj_count_img">
                                    <img src="images/count4.png" class="img-responsive" alt="">
                                </div>
                                <div class="mj_countdata">
                                    <div id="MembersNumber" runat="server"></div>
                                    <p>Members</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="mj_transprentbg">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="row">
                        <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 col-lg-offset-1 col-md-offset-1 col-sm-offset-0 col-xs-offset-0 mj_toppadder80 mj_bottompadder50">
                            <div class="mj_videosection_data mj_toppadder50">
                                <h1>H<span>ow</span> I<span>t</span> W<span>orks</span></h1>
                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Claritas est etiam processus dynamicus.</p>
                                <a href="#" class="mj_readmore">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="row">
                        <div class="mj_video">
                            <div class="mj_videodiv">
                                <img src="http://placehold.it/675X540" alt="work">
                                <div class="mj_overlay">
                                    <div class="mj_videooverlay_inner">
                                        <a href="#"><i class="fa fa-play-circle"></i></a>
                                        <p>
                                            Watch now this video about how works mesh<span class="mj_yellow_text">jobs</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <iframe id="video" src="http://player.vimeo.com/video/60707752" width="1200" height="482"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="mj_lightgraytbg mj_toppadder80 mj_bottompadder80">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0">
                    <div class="mj_mainheading mj_toppadder50 mj_bottompadder50">
                        <h1>P<span>artners</span></h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <asp:Repeater ID="RepeaterPartners" runat="server" DataSourceID="SqlGetPartners">
                    <ItemTemplate>
                        <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 mj_bottompadder50">
                            <div class="mj_clientlogo">
                                <a runat="server" id="lnk" href='<%# Bind("PartnerWebsite") %>' target="_blank">
                                    <img runat="server" id="img" src='<%# Bind("Logo") %>' class="img-responsive" alt='<%# Bind("PartnerNameEn") %>' style="width: 209px; height: 63px" />
                                </a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SqlGetPartners" runat="server" ConnectionString='<%$ ConnectionStrings:StudentHubConnectionString %>' SelectCommand="SELECT [PartnerId], [PartnerNameAr], [PartnerNameEn], [PartnerLogo], [PartnerWebsite], [PartnerEmail], [IsShowHomePage], 'Upload/' + PartnerLogo as Logo FROM [Partners]"></asp:SqlDataSource>
            </div>
        </div>
    </div>


    <div class="mj_lightgraytbg mj_toppadder50 mj_bottompadder40">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0">
                    <div class="mj_mainheading mj_toppadder50 mj_bottompadder50">
                        <h1>P<span>lans</span> &amp; P<span>ricing</span></h1>
                    </div>
                </div>
                <asp:SqlDataSource ID="SqlGetPackages" runat="server" ConnectionString='<%$ ConnectionStrings:StudentHubConnectionString %>' SelectCommand="SELECT [PackageId], [PackageTitleAr], [PackageSubTitleAr], [PackageTitleEn], [PackageSubTitleEn], [PackageStatus], [Price], [Theme], 'Checkout.aspx?Id='+CONVERT(varchar,PackageId) AS LinkChoose  FROM [V_PackagesInfo]"></asp:SqlDataSource>
                <asp:Repeater ID="RepeaterPackages" runat="server" DataSourceID="SqlGetPackages">
                    <ItemTemplate>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 mj_bottommargin60">
                            <asp:Panel ID="Panel1" runat="server" CssClass='<%# Bind("Theme") %>'>
                                <div class="mj_pricing_heading">
                                    <div class="mj_table_price">
                                        <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Price") %>' Font-Size="20pt"></asp:Label>
                                    </div>
                                    <h3>
                                        <asp:Label ID="lblTitlePackage" runat="server" Text='<%# Bind("PackageTitleEn") %>'></asp:Label></h3>
                                    <span>
                                        <asp:Label ID="lblSubTitlePackage" runat="server" Text='<%# Bind("PackageSubTitleEn") %>'></asp:Label></span>
                                </div>
                                <ul>
                                    <asp:HiddenField ID="HFPackageId" runat="server" Value='<%# Bind("PackageId") %>' />
                                    <asp:SqlDataSource ID="SqlGetPackageDetails" runat="server" ConnectionString='<%$ ConnectionStrings:StudentHubConnectionString %>' SelectCommand="SELECT PackageElements.PackageElementsTitleEn, PackageDetails.PackageDetailsValue FROM PackageElements INNER JOIN PackageDetails ON PackageElements.PackageElementsId = PackageDetails.PackageElementsId WHERE (PackageDetails.PackageId = @PackageId)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="HFPackageId" PropertyName="Value" Name="PackageId"></asp:ControlParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:Repeater ID="RepeaterPackageDetails" runat="server" DataSourceID="SqlGetPackageDetails">
                                        <ItemTemplate>
                                            <li>
                                                <asp:Label ID="lblElementsTitle" runat="server" Text='<%# Bind("PackageElementsTitleEn") %>'></asp:Label>
                                                (<asp:Label ID="lblDetailsValue" runat="server" Text='<%# Bind("PackageDetailsValue") %>'></asp:Label>)</li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                                <div class="mj_pricing_footer">
                                    <a id="btnChoose" runat="server" href='<%# Bind("LinkChoose") %>'><i class="fa fa-plus"></i>Choose Now</a>
                                </div>

                            </asp:Panel>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>


    <div class="mj_bluebg mj_toppadder80 mj_bottompadder80">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 col-sm-offset-0 col-xs-offset-0">
                    <div class="mj_addsection">
                        <h2 id="QuestionnairesTitleEn" runat="server"> </h2>
                        <asp:HiddenField ID="HFQuestionnairesId" runat="server" />
                        <ul style="text-align: left">
                            <asp:SqlDataSource ID="SqlGetVoteOption" runat="server" ConnectionString='<%$ ConnectionStrings:StudentHubConnectionString %>' SelectCommand="SELECT QuestionnaireOptionsTitleAr, QuestionnaireOptionsTitleEn, QuestionnaireOptionsId, QuestionnairesId FROM QuestionnaireOptions WHERE (QuestionnairesId = (SELECT TOP (1) QuestionnairesId FROM Questionnaires WHERE (QuestionnairesStatus = 1) ORDER BY QuestionnairesId DESC))">
                            </asp:SqlDataSource>
                            <asp:RadioButtonList ID="rblVote" CssClass="radio-list" runat="server" DataSourceID="SqlGetVoteOption" DataTextField="QuestionnaireOptionsTitleEn" DataValueField="QuestionnaireOptionsId"></asp:RadioButtonList>
                        </ul>
                        <div class="clearfix"></div>
                        <ul>
                            <li>
                                <asp:LinkButton ID="btnVote" runat="server" OnClick="btnVote_Click" CssClass="mj_mainbtn mj_btndefault" data-text="Vote"><span>Vote</span></asp:LinkButton>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>


    </div>
</asp:Content>
