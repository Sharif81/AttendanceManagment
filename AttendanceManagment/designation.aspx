<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="designation.aspx.cs" Inherits="AttendanceManagment.designation" %>
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
                        <asp:DropDownList runat="server" CssClass="form-control form-control-sm" ClientIDMode="Static" ID="departmentname"></asp:DropDownList> 
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <label for="designationname">Designation Name</label>
                        <input type="text" class="form-control form-control-sm" id="designationname" placeholder="Enter Your Designation Name">
                    </div>
                </div>               
                <div class="col-md-4">
                    <button type="button" data-id="0" class="btn btn-sm btn-success" id="btn-submit"><i class="fa fa-save"></i> Submit</button>
                </div>
            </div>                            
        </div>
    </section>


    <section id="designation-table">
        <div class="container-fluid">
            <div class="col-md-12">
                <table class="table table-bordered table-hover text-center" id="show-designation-table">
                    <thead class="bg-info">
                        <tr>
                            <th class="text-center">SL#</th>
                            <th class="text-center">Department</th>
                            <th class="text-center">Designation</th>               
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

            //Get_Designation_Table_Info();

            $("#btn-submit").on("click", function () {

                var obj = {
                    DesignationID: parseInt($(this).attr("data-id")),
                    DepartmentID: parseInt($('#departmentname>option:selected').val()),
                    DesignationName: ($("#designationname")).val()
                }
                if (obj.DepartmentName == '' || obj.DesignationName == '') {

                    swal("Hi!", "Something Wrong!", "warning");
                    return false;
                }
                else {
                    save_designation_info(obj);
                }
            });
        });
        
        function ResetDesignationForm() {
            $("#departmentname").val('0');
            $("#designationname").val('');
        }

        function save_designation_info(obj) {
            $.post('<%=Page.ResolveUrl("~/attendance_services.asmx/InsertUpdate_DesignationInfo")%>', { insertObject: JSON.stringify(obj) }, function (data, status, xhr) {
                if (status == 'success') {

                    swal("Hi", "Designation Name Save Successfully", "success");
                    reDrawTable();
                    ResetDesignationForm();
                }
                else {
                    swal("Hi", "Something Wrong", "warning");
                }

            });
        }

        <%--function Get_Designation_Table_Info() {
            $.getJSON('<%=Page.ResolveUrl("~/.asmx/")%>', function (data, status, xhr) {
                if (status == 'success') {
                    var tbody_r = '';
                    $.each(data, function (i, r) {

                        tbody_r += '</tr><td>' + (i + 1) + '</td><td>' + r.DepartmentName + '</td><td>' + r.DesignationName + '</td><td>  <button type="button" class="btn btn-sm btn-info"><i class="fa fa-edit"></i></button> <button type="button" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></button> </td></tr>'

                    });
                    $("#show-designation-table>tbody").empty().append(tbody_r);
                    $("#show-designation-table").DataTable();
                }
            });
        }--%>

        function reDrawTable() {
            designationTable.page('first').draw();
        }

        var designationTable = $("#show-designation-table").DataTable({
            "oLanguage": {
                "sEmptyTable": "No Information available"
            },
            "bProcessing": true,
            "bServerSide": true,
            "sAjaxSource": '<%= Page.ResolveUrl("~/attendance_services.asmx/GetDepartmentAndDesignationInfo")%>',
            "sServerMethod": 'post',
            "order": [[0, "desc"]],
            "aaSorting": [],
            "lengthMenu": [[10, 50, 100, -1], [10, 50, 100, "All"]], //value:item pair
            "columnDefs": [
                { "targets": [0, 1, 2,3], "bSortable": false }
            ],
            "columns": [
                { 'data': 'Rownum', class: 'text-center' },
                { 'data': 'DepartmentName', class: 'text-center' },
                { 'data': 'DesignationName', class: 'text-center' },
                
                {
                    'data': null, //its null here because history column will contain the mRender
                    "mRender": function (data) {
                        return '<button data-toggle="modal" class="btn btn-edit btn-info p-0 px-2" type="button" data-deptid="' + data.Id + '"><i class="fa fa-edit"></i></button> <button class="btn btn-danger p-0 px-2" type="button" data-id"' + data.Id + '" ><i class="fas fa-trash"></i></button>';
                    }
                }
            ]
        });
        

    </script>
</asp:Content>
