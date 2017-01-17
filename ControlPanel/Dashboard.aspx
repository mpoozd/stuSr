<%@ Page Title="" Language="C#" MasterPageFile="~/ControlPanel/MainPage.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="StudentServices.ControlPanel.Dashboard" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../css/Admin/style.css" rel="stylesheet" />
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-wrapper" style="font-size: 13px">
        <div class="container-fluid">

            <div class="row">
                <div class="col-md-12">

                    <h2></h2>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="panel panel-default">
                                        <div class="panel-body bk-primary text-light">
                                            <div class="stat-panel text-center" >
                                                <div class="stat-panel-number h1 ">24</div>
                                                <div class="stat-panel-title text-uppercase">New Users</div>
                                            </div>
                                        </div>
                                        <a href="#" class="block-anchor panel-footer">Full Detail <i class="fa fa-arrow-right"></i></a>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="panel panel-default">
                                        <div class="panel-body bk-success text-light">
                                            <div class="stat-panel text-center">
                                                <div class="stat-panel-number h1 ">8</div>
                                                <div class="stat-panel-title text-uppercase">New Mail</div>
                                            </div>
                                        </div>
                                        <a href="#" class="block-anchor panel-footer text-center">See All &nbsp; <i class="fa fa-arrow-right"></i></a>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="panel panel-default">
                                        <div class="panel-body bk-info text-light">
                                            <div class="stat-panel text-center">
                                                <div class="stat-panel-number h1 ">58</div>
                                                <div class="stat-panel-title text-uppercase">New Orders</div>
                                            </div>
                                        </div>
                                        <a href="#" class="block-anchor panel-footer text-center">See All &nbsp; <i class="fa fa-arrow-right"></i></a>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="panel panel-default">
                                        <div class="panel-body bk-warning text-light">
                                            <div class="stat-panel text-center">
                                                <div class="stat-panel-number h1 ">18</div>
                                                <div class="stat-panel-title text-uppercase">New Comments</div>
                                            </div>
                                        </div>
                                        <a href="#" class="block-anchor panel-footer text-center">See All &nbsp; <i class="fa fa-arrow-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">Jbos Report</div>
                                <div class="panel-body">
                                    <div class="chart">
                                        <canvas id="dashReport" height="310" width="600"></canvas>
                                    </div>
                                    <div id="legendDiv"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">Last Email</div>
                                <div class="panel-body">
                                   
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>From</th>
                                                <th>Date</th>
                                                <th>Subject</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th scope="row">1</th>
                                                <td>Mark</td>
                                                <td>11/11/2016</td>
                                                <td>jobs KNS</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">2</th>
                                                <td>Jacob</td>
                                                <td>12/11/2016</td>
                                                <td>New Order</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">3</th>
                                                <td>Larry</td>
                                                <td>30/11/2016</td>
                                                <td>Complaint</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <a href="#" class="block-anchor panel-footer text-center">See All &nbsp; <i class="fa fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="panel panel-default">
                                <div class="panel-heading">Pie Chart</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <ul class="chart-dot-list">
                                                <li class="a1">date 1</li>
                                                <li class="a2">data 2</li>
                                                <li class="a3">data 3</li>
                                            </ul>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="chart chart-doughnut">
                                                <canvas id="chart-area3" width="1200" height="900" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
    </div>


    <script>
        window.onload = function () {
            // Line chart from swirlData for dashReport
            var ctx = document.getElementById("dashReport").getContext("2d");
            window.myLine = new Chart(ctx).Line(swirlData, {
                responsive: true,
                scaleShowVerticalLines: false,
                scaleBeginAtZero: true,
            });

            // Pie Chart from doughutData
            var doctx = document.getElementById("chart-area3").getContext("2d");
            window.myDoughnut = new Chart(doctx).Pie(doughnutData, { responsive: true });

            // Dougnut Chart from doughnutData
            var doctx = document.getElementById("chart-area4").getContext("2d");
            window.myDoughnut = new Chart(doctx).Doughnut(doughnutData, { responsive: true });

        }
	</script>
</asp:Content>


