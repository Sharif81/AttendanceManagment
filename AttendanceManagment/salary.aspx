<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="salary.aspx.cs" Inherits="AttendanceManagment.salary" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #btn-submit {
            margin-top: 29px;
        }

        #generate-salary {
            margin-top: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4><%:Page.Title %></h4>

                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active"><%:Page.Title %></li>
                    </ol>
                </div>
            </div>
        </div>
    </section>

    <!-- Main content -->

    <section class="content">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                         <label for="month">Month</label>
                    <select class="form-control" id="salmonth">
                        <option value="NA">Select Salary Process Month</option>
                        <option value="January">January</option>
                        <option value="February">February</option>
                        <option value="March">March</option>
                        <option value="April">April</option>
                        <option value="May">May</option>
                        <option value="June">June</option>
                        <option value="July">July</option>
                        <option value="August">August</option>
                        <option value="September">September</option>
                        <option value="October">October</option>
                        <option value="November">November</option>
                        <option value="December">December</option>
                    </select>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <label for="year">Year</label>
                        <select class="form-control" id="year">
                            <option value="NA">Select Salary Process Year</option>
                        </select>
                    </div>
                </div>

                <div class="col-md-4">
                    <button type="button" id="generate-salary" class="btn btn-success"><i class="fas fa-file-pdf"></i> Generate Sheet</button>
                </div>

            </div>      
        </div>
    </section>

    
    



    <script>

        $(document).ready(function () {
            var ddIYears = $("#year, #SalaryYear");
            var currentYear = (new Date()).getFullYear();
            for (var i = 2016; i <= currentYear + 3; i++) {
                var option = $("<option />")
                option.html(i);
                option.val(i);
                ddIYears.append(option);
            };

            $('#generate-salary').on('click', function () {
                var obj = {
                    Salary_month: $('#salmonth>option:selected').val(),
                    Salary_year: $('#year>option:selected').val()
                }

                if (obj.Salary_month == 'NA' || obj.Salary_year == 'NA') {

                    swal("Hi", "Something Wrong", "warning");
                }
                else {
                    generate_salary(obj);
                }

            })



        });


        function generate_salary(obj) {
            $.post('<%=Page.ResolveUrl("attendance_services.asmx/Process_Salary")%>', { salaryobj: JSON.stringify(obj) }, function (data, status, xhr) {

                 if (status == "success") {

                      swal("Hi", "Salary Sheet Process Successfully", "success");
                 }
                 else {
                     swal("Hi", "Something Wrong", "warning");
                 }

            });
        }
 

    </script>

</asp:Content>
