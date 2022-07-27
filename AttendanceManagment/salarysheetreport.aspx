<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="salarysheetreport.aspx.cs" Inherits="AttendanceManagment.salarysheetreport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <style>
        #btn-salary {
            margin-top: 28px;
        }
    </style>
    <script>

        //$(document).ready(function () {
        //    var ddIYears = $("#SalaryYear");
        //    var currentYear = (new Date()).getFullYear();
        //    for (var i = 2016; i <= currentYear + 3; i++) {
        //        var option = $("<option />")
        //        option.html(i);
        //        option.val(i);
        //        ddIYears.append(option);
        //    };
        //});
    </script>
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

    <section class="content-header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="SalaryMonth">Month</label>
                        <asp:DropDownList runat="server" ID="SalaryMonth" CssClass="form-control" ClientIDMode="Static">
                            <asp:ListItem Value="January" Text="January"></asp:ListItem>
                            <asp:ListItem Value="February" Text="February"></asp:ListItem>
                            <asp:ListItem Value="March" Text="March"></asp:ListItem>
                            <asp:ListItem Value="April" Text="April"></asp:ListItem>
                            <asp:ListItem Value="May" Text="May"></asp:ListItem>
                            <asp:ListItem Value="June" Text="June"></asp:ListItem>
                            <asp:ListItem Value="July" Text="July"></asp:ListItem>
                            <asp:ListItem Value="August" Text="August"></asp:ListItem>
                            <asp:ListItem Value="September" Text="September"></asp:ListItem>
                            <asp:ListItem Value="October" Text="October"></asp:ListItem>
                            <asp:ListItem Value="November" Text="November"></asp:ListItem>
                            <asp:ListItem Value="December" Text="December"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <label for="SalaryYear">Year</label>
                        <asp:DropDownList runat="server" ID="SalaryYear" CssClass="form-control" ClientIDMode="Static">
                            <asp:ListItem Text="Select Salary Year" Value="0"></asp:ListItem>
                            <asp:ListItem Value="2018" Text="2018"></asp:ListItem>
                            <asp:ListItem Value="2019" Text="2019"></asp:ListItem>
                            <asp:ListItem Value="2020" Text="2020"></asp:ListItem>
                            <asp:ListItem Value="2021" Text="2021"></asp:ListItem>
                            <asp:ListItem Value="2022" Text="2022"></asp:ListItem>
                            <asp:ListItem Value="2023" Text="2023"></asp:ListItem>
                            <asp:ListItem Value="2024" Text="2024"></asp:ListItem>
                            <asp:ListItem Value="2025" Text="2025"></asp:ListItem>
                            <asp:ListItem Value="2026" Text="2026"></asp:ListItem>
                            <asp:ListItem Value="2027" Text="2027"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>


                <div class="col-md-4" id="btn-salary">
                    <asp:Button ID="Runreport" OnClick="show_salary_info_Click" runat="server" CssClass="btn btn-success" Text="Run Report" />
                </div>


            </div>

            <div class="row overflow-auto">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <rsweb:ReportViewer ID="ReportViewer1" runat="server"></rsweb:ReportViewer>

            </div>

        </div>
    </section>
</asp:Content>
