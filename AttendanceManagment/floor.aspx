﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="floor.aspx.cs" Inherits="AttendanceManagment.floor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style>
        #btn-submit {
            margin-top: 29px;
        }

        #floor-table {
            margin-top: 20px;
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
                        <label for="floorname">Floor Name</label>                        
                        <input type="text" class="form-control form-control-sm" id="floorname" placeholder="Enter Your Floor Name">
                    </div>
                </div>
                <div class="col-md-4">
                    <button type="button" data-id="0" class="btn btn-sm btn-success" id="btn-submit"><i class="fa fa-save"></i> Submit</button>
                </div>
            </div>                            
        </div>
    </section>


     <section id="floor-table">
        <div class="container-fluid">
            <div class="col-md-12">
                <table class="table table-bordered table-hover text-center" id="show-floor-table">
                    <thead class="bg-info">
                        <tr>
                            <th class="text-center">SL#</th>
                            <th class="text-center">Floor ID</th>
                            <th class="text-center">Floor Name</th>               
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
            $("#btn-submit").on("click", function () {
                var obj = {
                    FloorID: parseInt($(this).attr("data-id")),
                    FloorName: ($("#floorname").val())
                }
                if (obj.FloorName == '') {

                    swal("Hi!", "Something Wrong!", "warning");
                    return false;
                }
                else {
                    save_floor_info(obj);
                }
            });

             $(document).on('click', '.tableid', function () {
                var tableid = parseInt($(this).attr('data-floorid'));
                swal({
                    title: "Are you sure?",
                    text: "You will not be able to deleted this file!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                    .then((willDelete) => {
                        if (willDelete) {
                            DeletedFloorTable(tableid);

                            swal("Poof! Your file has been deleted!", {
                                icon: "success",
                            });
                        } else {
                            swal("Your file is safe!");
                        }
                    });
               
            });

            $(document).on('click', '.btn-edit', function () {
                $("html, body").animate({ scrollTop: 0 }, 50);
                $('#floorname').val($(this).attr('data-floorname'));
                $('#btn-submit').attr('data-id', $(this).attr('data-floorid')).html('<i class="fa-solid fa-edit"></i> Update');
                
            })
        });

        function save_floor_info(obj) {
            $.post('<%=Page.ResolveUrl("~/attendance_services.asmx/InsertUpdate_FloorInfo")%>', { insertObject: JSON.stringify(obj) }, function (data, status, xhr) {

                if (status == 'success') {

                    swal("Hi", "Floor Name Save Successfully", "success");
                }
                else {
                    swal("Hi", "Something Wrong", "warning");
                }

            });
        }


        function reDrawTable() {
            FoorInfo.page('first').draw();
        }

        var FloorInfo = $("#show-floor-table").DataTable({
            "oLanguage": {
                "sEmptyTable": "No Information available"
            },
            "bProcessing": true,
            "bServerSide": true,
            "sAjaxSource": '<%= Page.ResolveUrl("~/attendance_services.asmx/Get_floorInfo")%>',
            "sServerMethod": 'post',
            "order": [[0, "desc"]],
            "aaSorting": [],
            "lengthMenu": [[10, 50, 100, -1], [10, 50, 100, "All"]], //value:item pair
            "columnDefs": [
                { "targets": [0, 1, 2,3], "bSortable": false }
            ],
            "columns": [
                { 'data': 'Rownum', class: 'text-center' },
                { 'data': 'FloorID', class: 'text-center' },
                { 'data': 'FloorName', class: 'text-center' },
                
                {
                    'data': null, //its null here because history column will contain the mRender
                    "mRender": function (data) {
                        return '<button data-toggle="modal" class="btn btn-edit btn-info p-0 px-2" type="button" data-deptid="' + data.Id + '" data-floorid="' + data.FloorID + '" data-floorname="' + data.FloorName + '"><i class="fa fa-edit"></i></button> <button class="btn btn-danger tableid p-0 px-2" type="button" data-id"' + data.Id + '" data-floorid="' + data.FloorID + '"><i class="fas fa-trash"></i></button>';
                    }
                }
            ]
        });

        function DeletedFloorTable(tableid) {
            $.post('<%=Page.ResolveUrl("~/attendance_services.asmx/DeletedFloorId")%>', { floorid: tableid }, function (data, status, xhr) {

                if (status == 'success') {

                     reDrawTable();

          
                }
            });
        }


    </script>
</asp:Content>
