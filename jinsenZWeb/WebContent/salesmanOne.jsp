<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>一道结算员</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/fullcalendar.css" />
<link rel="stylesheet" href="css/matrix-style.css" />
<link rel="stylesheet" href="css/matrix-media.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" href="css/jquery.gritter.css" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
</head>
<body>

<!--Header-part-->
<div id="header">
  <h1><a href="dashboard.html">木材产销管理平台导航</a></h1>
</div>
<!--close-Header-part--> 


<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
    <li  class="dropdown" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text">欢迎使用者</span><b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a href="#"><i class="icon-user"></i> 我的个人资料 </a></li>
        <li class="divider"></li>
        <li><a href="#"><i class="icon-check"></i> 我的任务</a></li>
        <li class="divider"></li>
        <li><a href="login.jsp"><i class="icon-key"></i> 注销</a></li>
      </ul>
    </li>
    <li class="dropdown" id="menu-messages"><a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle"><i class="icon icon-envelope"></i> <span class="text">消息</span> <span class="label label-important">5</span> <b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a class="sAdd" title="" href="#"><i class="icon-plus"></i> 系的消息</a></li>
        <li class="divider"></li>
        <li><a class="sInbox" title="" href="#"><i class="icon-envelope"></i> 收件箱</a></li>
        <li class="divider"></li>
        <li><a class="sOutbox" title="" href="#"><i class="icon-arrow-up"></i> 发件箱</a></li>
        <li class="divider"></li>
        <li><a class="sTrash" title="" href="#"><i class="icon-trash"></i> 垃圾箱</a></li>
      </ul>
    </li>
    <li class=""><a title="" href="#"><i class="icon icon-cog"></i> <span class="text">设置</span></a></li>
    <li class=""><a title="" href="login.jsp"><i class="icon icon-share-alt"></i> <span class="text">注销</span></a></li>
    <li><%String staff_id = request.getSession().getAttribute("staff_id").toString();%>您好，<%=staff_id %>欢迎登录</li>
  </ul>
</div>
<!--close-top-Header-menu-->
<!--start-top-serch-->
<div id="search">
  <input type="text" placeholder="Search here..."/>
  <button type="submit" class="tip-bottom" title="Search"><i class="icon-search icon-white"></i></button>
</div>
<!--close-top-serch-->
<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> 仪表盘</a>
  <ul>
    <li class="submenu"> <a href="#"><i class="icon icon-home"></i> <span>合同管理</span> <span class="label label-important">1</span></a>
     <ul>
        <li><a href="salaryContract.jsp">创建合同</a></li>
      </ul>
     </li>
    <li class="submenu"> <a href="#"><i class="icon icon-home"></i> <span>客户信息管理</span> <span class="label label-important">2</span></a>
     <ul>
        <li><a href="productowner.jsp">创建客户信息</a></li>
        <li><a href="productownerSee.jsp">查看客户信息</a></li>
      </ul>
     </li>
  </ul>
</div>
<!--sidebar-menu-->

<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="salesmanOne.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>首页</a></div>
  </div>
<!--End-breadcrumbs-->

<!--Action boxes-->
  <div class="container-fluid">
    <div class="quick-actions_homepage">
      <ul class="quick-actions">
        <li class="bg_lb"> <a href="salaryContract.jsp"> <i class="icon-dashboard"></i>创建合同 </a> </li>
        <li class="bg_lg span3"> <a href="salaryContractList.jsp"><i class="icon-signal"></i> <span>查看合同</span> <span class="label label-important">2</span></a></li>
        <li class="bg_ly span3"> <a href="productowner.jsp"> <i class="icon-inbox"></i><span class="label label-success"></span>创建客户信息</a> </li>
        <li class="bg_lo"> <a href="productownerSee.jsp"> <i class="icon-th"></i>查看客户信息</a> </li>

      </ul>
    </div>
<!--End-Action boxes-->    

<!--Chart-box-->    
    <div class="row-fluid">
      <div class="widget-box">
        <div class="widget-title bg_lg"><span class="icon"><i class="icon-signal"></i></span>
          <h5>客户信息</h5>
        </div>
        <div class="widget-content" >
          <div class="row-fluid">
            <div class="table-con">
        <table id="table1" class="table-style"></table>
    </div>
            
          </div>
        </div>
      </div>
    </div>
<!--End-Chart-box--> 
    <hr/>
  </div>
</div>

<!--end-main-container-part-->

<!--Footer-part-->


<!--end-Footer-part-->

<script src="js/excanvas.min.js"></script> 
<script src="js/jquery.min.js"></script> 
<script src="js/jquery.ui.custom.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/jquery.flot.min.js"></script> 
<script src="js/jquery.flot.resize.min.js"></script> 
<script src="js/jquery.peity.min.js"></script> 
<script src="js/fullcalendar.min.js"></script> 
<script src="js/matrix.js"></script> 
<script src="js/matrix.dashboard.js"></script> 
<script src="js/jquery.gritter.min.js"></script> 
<script src="js/matrix.interface.js"></script> 
<script src="js/matrix.chat.js"></script> 
<script src="js/jquery.validate.js"></script> 
<script src="js/matrix.form_validation.js"></script> 
<script src="js/jquery.wizard.js"></script> 
<script src="js/jquery.uniform.js"></script> 
<script src="js/select2.min.js"></script> 
<script src="js/matrix.popover.js"></script> 
<script src="js/jquery.dataTables.min.js"></script> 
<script src="js/matrix.tables.js"></script> 
<script src="js/jquery.js"></script>
<script src="js/bstable/js/bootstrap.min.js"></script>
<script src="js/bstable/js/bootstrap-table.js"></script>
<script src="js/bstable/js/bootstrap-table-zh-CN.min.js"></script>
<script>
    $(function(){
        table1();
    })
    function table1(){
        $('#table1').bootstrapTable({
            method: "get",
            striped: true,
            singleSelect: false,
            url: "salaryServlet?action=findcustomer",
            data:{},
            dataType: "json",
            pagination: true, //分页
            pageSize: 8,
            pageNumber: 1,
            search: true, //显示搜索框
            contentType: "application/x-www-form-urlencoded",
            showRefresh: true,                      //是否显示刷新按钮
            showToggle: true,                    //是否显示详细视图和列表视图的切换按钮
            detailView: true,
            columns: [
            	{
                    checkbox: "true",
                    field: 'check',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: "客户姓名",
                    field: 'kname',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '销售合同编号',
                    field: 'contractnum',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '公司名称',
                    field: 'company',
                    align: 'center',
                    valign: 'middle'
                },
                {
                    title: '地址',
                    field: 'address',
                    align: 'center'
                },
                {
                    title: '身份证号',
                    field: 'iDCard',
                    align: 'center'
                },
                {
                    title: '联系电话',
                    field: 'telephone',
                    align: 'center'
                },
                {
                    title: '发货地址',
                    field: 'shipaddress',
                    align: 'center'
                }
            ]
        });
    }
  </script>
<script type="text/javascript">
// This function is called from the pop-up menus to transfer to
// a different page. Ignore if the value returned is a null string:
function goPage (newURL) {

    // if url is empty, skip the menu dividers and reset the menu selection to default
    if (newURL != "") {
    
        // if url is "-", it is this page -- reset the menu:
        if (newURL == "-" ) {
            resetMenu();            
        } 
        // else, send page to designated URL            
        else {  
          document.location.href = newURL;
        }
    }
}

//resets the menu selection upon entry to this page:
function resetMenu() {
 document.gomenu.selector.selectedIndex = 2;
}
</script>
</body>
</html>
