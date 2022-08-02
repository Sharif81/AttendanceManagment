<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="employee.aspx.cs" Inherits="AttendanceManagment.employee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #btn-submit {
            margin-top: 29px;
        }

        #emp-modal-btn {
            margin-left: 18px;
        }
        #employee-table {
            margin-top: 20px;
            font-size: 12px;
           
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
    <!-- Employee modal -->
    <button type="button" class="btn btn-primary" id="emp-modal-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">
        <i class="fa fa-plus-circle"></i> Add Employee Information
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h5 class="modal-title" id="exampleModalLabel">Employee Information</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <section class="content">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="name">Employee Name</label>
                                        <asp:DropDownList runat="server" CssClass="form-control form-control-sm" ClientIDMode="Static" ID="empname"></asp:DropDownList>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="cardno">Card No</label>
                                        <input type="text" class="form-control form-control-sm" id="cardno" placeholder="Enter Card Number">
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group mb-1">
                                        <label for="department">Department</label>

                                        <asp:DropDownList runat="server" CssClass="form-control form-control-sm" ClientIDMode="Static" ID="departmentname"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="designation">Designation</label>
                                        <select class="form-control form-control-sm" id="designation"></select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label for="floor">Floor</label>
                                    <asp:DropDownList runat="server" CssClass="form-control form-control-sm" ClientIDMode="Static" ID="floorname"></asp:DropDownList>
                                </div>
                                <div class="col-md-4">
                                    <label for="line">Line</label>
                                    <select class="form-control form-control-sm" id="line"></select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="Gross">Gross</label>
                                        <input type="text" class="form-control form-control-sm" id="gross" placeholder="Enter Gross Salary" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="dateofjoin">Date Of Join</label>
                                        <input type="text" class="datepicker form-control form-control-sm" id="dateOfJoin" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="dateofresign">Resign Date</label>
                                        <input type="text" class="form-control form-control-sm" id="resignDate" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="bankaccount">Bank Account</label>
                                        <input type="text" class="form-control form-control-sm" id="bankaccount" placeholder="Enter Bank Account">
                                    </div>
                                </div>

                                  <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="compnay">Company Name</label>
                                        <asp:DropDownList runat="server" CssClass="form-control form-control-sm" ClientIDMode="Static" ID="companyname"></asp:DropDownList>
                                </div>
                                 </div>

                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label for="status">Employee Status</label>
                                        <select id="empstatus" class="form-control form-control-sm">
                                            <option value="na">Select Employee Status</option>
                                            <option value="active">Active</option>
                                            <option value="inactive">Inactive</option>
                                        </select>
                                    </div>
                                </div>                               

                                <div class="col-md-3">
                                    <button type="button" data-id="0" class="btn btn-sm btn-success" id="btn-submit"><i class="fa fa-save"></i> Submit</button>
                                </div>
                                    </div>
                           
                        </div>
                    </section>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-primary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


    
     <section id="employee-table">
        <div class="container-fluid">
            <div class="col-md-12">
                <table class="table table-bordered table-hover text-center table-responsive" id="show-employee-table">
                    <thead class="bg-info">
                        <tr>
                            <th class="text-center">SL#</th>
                            <th class="text-center">Employee Name</th>
                            <th class="text-center">Card NO</th>
                            <th class="text-center">Department</th>
                            <th class="text-center">Designation</th>
                            <th class="text-center">Floor</th>
                            <th class="text-center">Line</th>               
                            <th class="text-center">Gross</th>
                            <th class="text-center">Date Of Join</th>            
                            <th class="text-center">Bank Account</th>                           
                            <th class="text-center">Resign Date</th>               
                            <th class="text-center">Status</th>
                            <th class="text-center">Company Name</th>
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

            Get_All_Employee_Info();

            $("#btn-submit").on("click", function () {

                var obj = {

                    EmpID: parseInt($(this).attr('data-id')),
                    EmpName: parseInt($("#empname").val()),
                    CardNo: $("#cardno").val(),
                    Department: parseInt($("#departmentname>option:selected").val()),
                    Designation: parseInt($("#designation>option:selected").val()),
                    Floor: parseInt($("#floorname>option:selected").val()),
                    Line: parseInt ($("#line>option:selected").val()),
                    Gross: $("#gross").val(),
                    DateOfJoin: $("#dateOfJoin").val(),
                    ResignDate: $("#resignDate").val(),
                    BankAccount: $("#bankaccount").val(),
                    CompanyName: $("#companyname>option:selected").val(),
                    EmpStatus: $("#empstatus>option:selected").val()

                }

                if ( obj.EmpName == 0 || obj.CardNo == '' || obj.Department == 0 || obj.Designation == 0 || obj.Floor == 0 || obj.Line == 0 || obj.Gross == '' || obj.DateOfJoin == '' || obj.BankAccount == '' || obj.CompanyName == 'NA' || obj.EmpStatus == 'NA') {

                      swal("Hi..", "Something Wrong", "warning");
                }
                else {

                    save_employee_info(obj);
                
                }
            });

            $('.datepicker').daterangepicker({
                singleDatePicker: true,
                autoApply: true,
                locale: {
                    format: 'DD-MMM-YYYY'
                }
            });

            $('#departmentname').on('change', function () {
                var deptid = parseInt($(this).val());
                get_designation_name_by_department_id(deptid);

            });

            $("#floorname").on("change", function () {
                var floorID = parseInt($(this).val());
                get_line_name_by_floor_id(floorID);
            });

            $('#resignDate').daterangepicker({
                autoUpdateInput: false,
                singleDatePicker: true,
                autoApply: true,               
                locale: {
                    cancelLabel: 'Clear',
                    format: 'DD-MMM-YYYY'
                }
      
            });

            $('#resignDate').on('apply.daterangepicker', function (e, p) {
                $(this).val(p.startDate.format('DD-MMM-YYYY'));
            });
          });


          function get_designation_name_by_department_id(id) {
              $.getJSON('<%=Page.ResolveUrl("~/attendance_services.asmx/GetAllDesignationName_ByDepartmentID")%>', { deptid: id }, function (data, status, xhr) {
                  if (status == 'success') {
                      var option = '<option value="0">SELECT DESIGNATION</option>';
                      $.each(data, function (i, r) {
                          option += '<option value="' + r.DesignationID + '">' + r.DesignationName + '</option>';
                      });
                      $('#designation').empty().append(option);
                  }
              });
          }


          function get_line_name_by_floor_id(id) {
              $.getJSON('<%=Page.ResolveUrl("~/attendance_services.asmx/GetAllLine_ByFloorID")%>', { floorID: id }, function (data, status, xhr) {
                  if (status == 'success') {
                      var option = '<option value="0">SELECT LINE</option>';
                      $.each(data, function (i, r) {
                          option += '<option value="' + r.LineID + '"> ' + r.LineName + ' </option>';
                      });
                      $("#line").empty().append(option);
                  }
              });
            }


        function Get_All_Employee_Info() {
            $.getJSON('<%=Page.ResolveUrl("~/attendance_services.asmx/Get_EmployeeInfoTable")%>', function (data, status, xhr) {

                if (status == 'success') {
                    var tbody_tr = '';
                    $.each(data, function (i, r) {
                        tbody_tr += '<tr><td>' + (i + 1) + '</td><td>' + r.EmpName + '</td><td>' + r.CardNo + '</td><td>' + r.Department + '</td><td>' + r.Designation + '</td><td>' + r.Floor + '</td><td>' + r.Line + '</td><td>' + r.Gross + '</td><td>' + r.DateOfJoin + '</td><td>' + r.ResignDate + '</td><td>' + r.BankAccount + '</td><td>' + r.EmpStatus + '</td><td>' + r.CompanyName + '</td><td> <button type="button" class="btn btn-edit btn-sm btn-info"><i class="fa fa-edit"></i></button>  <button type="button" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></button> </td></tr>'

                    });
                    $("#show-employee-table>tbody").empty().append(tbody_tr);
                    $("#show-employee-table").DataTable();

                }

            });
        }


        function save_employee_info(obj) {
            $.post('<%=Page.ResolveUrl("~/attendance_services.asmx/InsertUpdate_EmployeeInfo")%>', { insertObject: JSON.stringify(obj) }, function (data, status, xhr) {

                if (status == 'success') {
                    swal("Hi..", "Employee Information Save Successfully", "success");

                    Get_All_Employee_Info();
                }
                else {
                    swal("Hi", "something wrong", "warning");
                }
            });
        }
    </script>
</asp:Content>
