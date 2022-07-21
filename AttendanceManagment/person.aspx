<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="person.aspx.cs" Inherits="AttendanceManagment.person" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #btn-submit {
            margin-top: 29px;
        }
        #person-modal-btn {
            margin-left: 20px;
        }

        #person-table {
            margin-top: 20px;
        }

        #person-table {
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
    <!-- Persona modal -->
    <button type="button" id="person-modal-btn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
        <i class="fa fa-plus-circle"></i> Add Person Information
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <h5 class="modal-title" id="exampleModalLabel">Person Information</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <section class="content">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="name">Employee Name</label>
                                        <input type="text" class="form-control form-control-sm" id="empname" placeholder="Enter Employee Name">
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="fathername">Father Name</label>
                                        <input type="text" class="form-control form-control-sm" id="fathername" placeholder="Enter Father Name">
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="mothername">Mother Name</label>
                                        <input type="text" class="form-control form-control-sm" id="mothername" placeholder="Enter Mother Name">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="dateofbirth">Date Of Birth</label>
                                        <input type="text" id="dateofbirth" class="datepicker form-control form-control-sm" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="materialstatus">Marital Status</label>
                                        <select id="materialstatus" class="form-control form-control-sm">
                                            <option value="na">Select Married Status</option>
                                            <option value="married">Married</option>
                                            <option value="unmarried">Unmarried</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="religion">Religion</label>
                                        <select id="religion" class="form-control form-control-sm">
                                            <option value="na">Select Religion Status</option>
                                            <option value="islam">Islam</option>
                                            <option value="hindu">Hindu</option>
                                            <option value="christian">Christian</option>
                                            <option value="duddhist">Buddhist</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="gender">Gender</label>
                                        <select id="gender" class="form-control form-control-sm">
                                            <option value="na">Select Gender</option>
                                            <option value="male">Male</option>
                                            <option value="female">Female</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="nationalid">National ID</label>
                                        <input type="text" class="form-control form-control-sm" id="nationalid" placeholder="Enter National ID">
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="contact">Contact Number</label>
                                        <input type="text" class="form-control form-control-sm" id="contact" placeholder="Enter Contact Number">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <input type="text" class="form-control form-control-sm" id="email" placeholder="Enter Contact Number">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="bloodgroup">Blood Group</label>
                                        <select id="bloodgroup" class="form-control form-control-sm">
                                            <option value="na">Select Blood Group</option>
                                            <option value="a+">A+</option>
                                            <option value="b+">B+</option>
                                            <option value="a-">A-</option>
                                            <option value="b-">B-</option>
                                            <option value="o+">O+</option>
                                            <option value="o-">O-</option>
                                            <option value="ab+">AB+</option>
                                            <option value="ab-">AB-</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
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

   
     <section id="person-table">
        <div class="container-fluid">
            <div class="col-md-12">
                <table class="table table-bordered table-hover table-responsive text-center" id="show-person-table">
                    <thead class="bg-info">
                        <tr>
                            <th class="text-center">SL#</th>
                            <th class="text-center">Employee Name</th>
                            <th class="text-center">Father Name</th>
                            <th class="text-center">Mother Name</th>            
                            <th class="text-center">Date Of Birth</th>               
                            <th class="text-center">Metrial Status</th>
                            <th class="text-center">Religion</th>            
                            <th class="text-center">Gender</th>               
                            <th class="text-center">National ID</th> 
                            <th class="text-center">Contact</th>            
                            <th class="text-center">Email</th>               
                            <th class="text-center">Blood Group</th> 
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

            Get_All_PersonInfo();

            $("#btn-submit").on("click", function () {

                var obj = {
                    PersonID: parseInt($(this).attr("data-id")),
                    EmployeeName: $("#empname").val(),
                    FatherName: $("#fathername").val(),
                    MotherName: $("#mothername").val(),
                    DateOfBirth: $("#dateofbirth").val(),
                    MaterialStatus: $("#materialstatus>option:selected").val(),
                    Religion: $("#religion>option:selected").val(),
                    Gender: $("#gender>option:selected").val(),
                    NationalID: $("#nationalid").val(),
                    ContactNo: $("#contact").val(),
                    Email: $("#email").val(),
                    BloodGroup: $("#bloodgroup").val()
                    
                }

                if (obj.EmployeeName == '' || obj.FatherName == '' || obj.MotherName == '' || obj.DateOfBirth == '' || obj.MaterialStatus == '' || obj.Religion == '' || obj.Gender == '' || obj.NationalID == '' || obj.ContactNo == '' || obj.Email == '' || obj.BloodGroup == '') {

                    swal("Hi..", "Something Wrong", "warning");
                }
                else {

                    save_person_info(obj);
                }
            });

            $('.datepicker').daterangepicker({
                singleDatePicker: true,
                autoApply: true,
                locale: {
                    format: 'DD-MMM-YYYY'
                }
            });
        });


        function save_person_info(obj) {
            $.post('<%=Page.ResolveUrl("~/attendance_services.asmx/InsertUpdate_PersonInfo")%>', { insertObject: JSON.stringify(obj) }, function (data, status, xhr) {

                if (status == 'success') {

                    swal("Hi..", "Person Information Save Successfully", "success");
                }
                else {
                    swal("Hi", "something wrong", "warning");
                }
            });
        }


        function Get_All_PersonInfo() {
            $.getJSON('<%=Page.ResolveUrl("~/attendance_services.asmx/Get_PersonInfo")%>', function (data, status, xhr) {

                
                if (status == "success") {

                    var tbody_tr = '';
                    $.each(data, function (i, r) {

                        tbody_tr += '<tr><td>' + (i + 1) + '</td><td>' + r.EmployeeName + '</td><td>' + r.FatherName + '</td><td>' + r.MotherName + '</td><td>' + r.DateOfBirth + '</td><td>' + r.MaterialStatus + '</td><td>' + r.Religion + '</td><td>' + r.Gender + '</td><td>' + r.NationalID + '</td><td>' + r.ContactNo + '</td><td>' + r.Email + '</td><td>' + r.BloodGroup + '</td><td> <button type="button" class="btn btn-sm btn-info"><i class="fa fa-edit"></i></button> <button type="button" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></button> </td></tr>' 

                    });

                    $("#show-person-table>tbody").empty().append(tbody_tr);
                    $("#show-person-table").DataTable();
                }

            });
        }

    </script>

</asp:Content>
