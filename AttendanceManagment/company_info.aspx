<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="company_info.aspx.cs" Inherits="AttendanceManagment.company_info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #btn-submit {
            margin-top: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Content Header (Page header) -->
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
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="companyname">Company Name</label>
                        <input type="text" class="form-control" id="companyname" placeholder="Enter Your Company Name">
                    </div>
                </div>
                <div class="col-md-6">
                    <label for="comapnaylogo">Select Logo</label>
                    <div class="custom-file mb-3">                   
                        <input type="file" class="custom-file-input" id="companylogo" required>
                        <label class="custom-file-label" for="validatedCustomFile">Choose Your file</label>                        
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="companyaddress">Address</label>
                        <textarea class="form-control form-control-sm" id="companyaddress" placeholder="Enter Your Company Address"></textarea>
                    </div>
                </div>
                <div class="col-md-6">
                    <button type="button" data-id="0" class="btn btn-sm btn-success" id="btn-submit"><i class="fa fa-save"></i> Submit</button>
                </div>
            </div>
        </div>
    </section>

     <section id="company-table">
        <div class="container-fluid">
            <div class="col-md-12">
                <table class="table table-bordered table-hover text-center" id="show-company-table">
                    <thead class="bg-info">
                        <tr>
                            <th class="text-center">SL#</th>
                            <th class="text-center">Company ID</th>
                            <th class="text-center">Comapny Name</th>
                            <th class="text-center">Company Logo</th>
                            <th class="text-center">Company Address</th>
                            <th class="text-center">Action</th>    
                        </tr>
                    </thead>
                    <tbody>
                        
                    </tbody>
                </table>
            </div>
        </div>
    </section>

    <script>
        $(document).ready(function () {

            Get_Company_Table_Info();

             $("#show-company-table").DataTable();
            $("#btn-submit").on("click", function () {
                var obj = {
                    CompanyID: parseInt($(this).attr("data-id")),
                    CompanyName: ($('#companyname').val()),
                    CompanyAddress: ($('#companyaddress').val()),
                    CompanyLogo: ($('#companylogo').val())                   
                    
                }

                if (obj.CompanyName == '' || obj.CompanyAddress == '' || obj.CompanyLogo == '') {
                  swal("Hi..", "Something Wrong!", "warning");
                    return false;
                }
                else {
                    save_company_info(obj);
                }
            });
        });

        function save_company_info(obj) {
            $.post('<%=Page.ResolveUrl("~/attendance_services.asmx/InsetAndUpdate_CompanyInfo")%>', { insertObject: JSON.stringify(obj) }, function (data, status, xhr) {
                if (status == 'success') {

                    Get_Company_Table_Info();

                    swal("Hi..!", "Company Information Save Successfully!", "success");
                    ResetDepartmentInfo();
                }
                else {
                     swal("Hi..!", "Something Wrong!", "warning");
                }
            });
        }

        function ResetDepartmentInfo() {
            $("#companynames, #companylogo, #companyaddress").val('');
        }


        function Get_Company_Table_Info() {
            $.getJSON('<%=Page.ResolveUrl("~/attendance_services.asmx/GetCompanyTableInfo")%>', function (data, status, xhr) {
                if (status == 'success') {
                    var tbody_tr = '';
                    $.each(data, function (i, r) {
                        tbody_tr += '<tr><td>' + (i + 1) + '</td><td>' + r.CompanyID + '</td><td>' + r.CompanyName + '</td><td>' + r.CompanyLogo + '</td><td>' + r.CompanyAddress + '</td><td><button type="button" class="btn btn-sm btn-info"><i class="fa fa-edit"></i></button> <button type="button" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></button></td></tr>'  
                    });
                    $("#show-company-table>tbody").empty().append(tbody_tr);
                    $("#show-company-table").DataTable();

                }
            });
        }
    </script>

</asp:Content>

