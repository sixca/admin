<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Date" %>

<script>
    let item_detail={
        init: function(){
            $('#update_btn').click(function(){
                item_detail.send();
            });
            $('#delete_btn').click(function(){
                var c = confirm("삭제 하시겠습니까?");   //confirm창 호출
                if(c == true){
                    location.href="/item/deleteimpl?id=${iteminfo.id}";
                }
            });
        },
        send: function(){
            $('#detail_form').attr({
                method:'post',
                action:'/item/updateimpl'
            });
            $('#detail_form').submit();
        }
    };
    $(function (){
        item_detail.init();
    });
</script>

    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Detail Item : ${iteminfo.id}</h1>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Detail Cust</h6>
            </div>
            <div class="card-body">
                    <form id="detail_form" class="form-horizontal well">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="item_img">IMG:</label>
                            <div class="col-sm-10">
                                <img id="item_img"  src="/uimg/${iteminfo.imgname}" style="width:50px; height:50px">
                                <input type="text" class="form-control" value="${iteminfo.imgname}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="id">ID:</label>
                            <div class="col-sm-10">
                                <input type="text" name="id" class="form-control" id="id" value="${iteminfo.id}" readonly>
                            </div>
                            <div class="col-sm-10">
                                <span id="check_id" class="bg-danger"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="name">NAME:</label>
                            <div class="col-sm-10">
                                <input type="text" name="name" class="form-control" id="name" value="${iteminfo.name}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="price">PRICE:</label>
                            <div class="col-sm-10">
                                <input type="text" name="price" class="form-control" id="price" value="${iteminfo.price}">
                            </div>
                        </div>
<%--                        <div class="form-group">--%>
<%--                            <label class="control-label col-sm-2" for="rdate">RDATE:</label>--%>
<%--                            <div class="col-sm-10">--%>
<%--                                <input type="text" name="rdate" class="form-control" id="rdate"--%>
<%--                                       value="<fmt:formatDate value="${iteminfo.rdate}" pattern="yyyy-MM-dd"/>" readonly>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                            <label class="control-label col-sm-2" for="rdate">RDATE:</label>--%>
<%--                            <div class="col-sm-10">--%>
<%--                                <input type="text" name="rdate" class="form-control" id="rdate"--%>
<%--                                       value="<fmt:formatDate value='${new Date()}' pattern='yyyy-MM-dd' />" readonly>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button id="update_btn" type="button" class="btn btn-default">Update 작동불가..</button>
                                <button id="delete_btn" type="button" class="btn btn-default">Delete</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
    <!-- /.container-fluid -->
</div>