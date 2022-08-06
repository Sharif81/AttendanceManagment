<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="department.aspx.cs" Inherits="AttendanceManagment.department" %>
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
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="departmentname">Department Name</label>
                        <input type="text" class="form-control form-control-sm" id="departmentname" placeholder="Enter Your Department Name">
                    </div>
                </div>
                <div class="col-md-4">
                    <button type="button" data-id="0" class="btn btn-sm btn-success" id="btn-submit"><i class="fa fa-save"></i> Submit</button>
                </div>
            </div>                            
        </div>
    </section>

    <section id="department-table">
        <div class="container-fluid">
            <div class="col-md-12">
                <table class="table table-bordered table-hover text-center" id="show-department-table">
                    <thead class="bg-info">
                        <tr>
                            <th class="text-center">SL#</th>
                            <th class="text-center">Department ID</th>
                            <th class="text-center">Department Name</th>               
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

            $("#btn-submit").on("click", function () {
                var obj = {
                    DepartmentID: parseInt($(this).attr('data-id')),
                    DepartmentName: ($('#departmentname').val())
                }
                if (obj.DepartmentName == '') {
                    swal("Hi!", "Something Wrong!", "warning");
                    return false;
                }
                else {
                    save_department_info(obj);
                }

            });

             $(document).on('click', '.tableid', function () {
                var tableid = parseInt($(this).attr('data-id'));
                swal({
                    title: "Are you sure?",
                    text: "You will not be able to deleted this file!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                    .then((willDelete) => {
                        if (willDelete) {
                           DeletedDepartmentTable(tableid);

                            swal("Poof! Your file has been deleted!", {
                                icon: "success",
                            });
                        } else {
                            swal("Your file is safe!");
                        }
                    });
               
            });


             $(document).on('click', '.edit-btn', function () {
                $("html, body").animate({ scrollTop: 0 }, 50);
                $('#departmentname').val($(this).attr('data-departmentname'));
                $('#btn-submit').attr('data-id', $(this).attr('data-departmentid')).html('<i class="far fa-edit"></i> Update');
                
            })
        });

        function save_department_info(obj) {
            $.post('<%=Page.ResolveUrl("~/attendance_services.asmx/InsertUpdate_DepartmentInfo")%>', { insertObject: JSON.stringify(obj) }, function (data, status, xhr) {
                if (status == 'success') {

                    Get_Company_Table_Info();

                    swal("Hi", "Department Name Save Successfully", "success");
                    ResetDepartmentInfo();
                }
                else {
                    swal("Hi", "Something Wrong", "warning");
                }
            });
        }

        function ResetDepartmentInfo() {
            $("#departmentname").val('');
        }
        
        function Get_Company_Table_Info() {
            $.getJSON('<%=Page.ResolveUrl("~/attendance_services.asmx/GetDepartmentTableInfo")%>', function (data, status, xhr) {
                if (status == 'success') {
                    var tbody_tr = '';
                    $.each(data, function (i, r) {

                        tbody_tr += '<tr><td>' + (i + 1) + '</td><td>' + r.DepartmentID + '</td><td>' + r.DepartmentName + '</td><td> <button type="button" data-departmentid="'+r.DepartmentID+'" data-departmentname="'+r.DepartmentName+'" class="btn edit-btn btn-sm btn-info"><i class="fa fa-edit"></i></button>  <button type="button" data-id="'+r.DepartmentID+'" class="btn btn-sm btn-danger tableid"><i class="fa fa-trash"></i></button> </td></tr>'
                    });
                    $("#show-department-table>tbody").empty().append(tbody_tr);
                    $("#show-department-table").DataTable();
                }

            });
        }
        function DeletedDepartmentTable(tableid) {
            $.post('<%=Page.ResolveUrl("~/attendance_services.asmx/DeletedDepartment")%>', { deptid: tableid }, function (data, status, xhr) {

                if (status == 'success') {

               Get_Company_Table_Info();


          
                }
            });
        }
    </script>
</asp:Content>
