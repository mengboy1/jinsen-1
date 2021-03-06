<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>货场经理</title>
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
    	theadClasses: "thead-blue",//设置thead-blue为表头样式
	    classes: "table table-bordered table-striped table-sm table-dark",
        method: "get",
        striped: true,
        singleSelect: false,
        url: "workpageSevrlet?action=writepage&type=passall",
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
                title: "工单号",
                field: 'workid',
                align: 'center',
                valign: 'middle'
            },
            {
                title: '采伐证号',
                field: 'cutnum',
                align: 'center',
                valign: 'middle'
            },
            {
                title: '采伐时间',
                field: 'cutdate',
                align: 'center',
                valign: 'middle'
            },
            {
                title: '采伐地点',
                field: 'cutsite',
                align: 'center',
                valign: 'middle'
            },
            {
                title: '伐区监管员',
                field: 'forester',
                align: 'center'
            },
            {
                title: '操作',
                field: 'opr',
                width: 180,
                align: 'center',
                formatter: function (cellval, row) {
                    //var  d = '<a href="workpageSevrlet?action=single&workid=\''+ row.workid + '\'"><button  id="add" data-id="98" class="btn btn-xs btn-primary">查看</button></a>';
                    var  d = '<a href="workpageSevrlet?action=finishWorkpage&workid=\''+ row.workid + '\'"><button  id="add" data-id="98" class="btn btn-xs btn-primary">查看</button></a>';
                    //var  d = '<a href="workpageSevrlet?action=alldelete&workid=\''+ row.workid + '\'"><button  id="id="delete" data-id="98" class="btn btn-xs btn-primary">删除</button></a>';
                    return  d;
                }
            },
        ]
    });
}
 </script>
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
      <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i> <span>货场费用</span> <span class="label label-important">2</span></a>
       <ul>
        <li><a href="goodsYardCost.jsp">费用结算</a></li>
        <li><a href="yardInventoryBootstrapDirector.jsp">货场盘点</a></li>
      </ul>
     </li>
     <li><a href="workpageTreeBuyDirector.jsp"><i class="icon icon-th-list"></i> <span>木材收购单</span></a></li>
    <li><a href="compareTreeListDirector.jsp"><i class="icon icon-th-list"></i> <span>木材装车对比</span></a></li>
    <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i> <span>录入数据</span> <span class="label label-important">2</span></a>
       <ul>
        <li><a href="passworkpageDirector.jsp">录入进场木材数据</a></li>
        <li><a href="treeoutDirector.jsp">录入出场木材数据</a></li>
      </ul>
     </li>
     <li><a href="InyardShenhesuDirector.jsp"><i class="icon icon-th-list"></i> <span>查看进场木材反馈</span></a></li>
    <li><a href="yardinfo.jsp"><i class="icon icon-home"></i> <span>新增货场信息</span></a> </li>
   <li><a href="cancellingStocksTable.jsp"><i class="icon icon-home"></i> <span>货场报损</span></a> </li>
   <li><a href="yardMoneryDirector.jsp"><i class="icon icon-home"></i> <span>货场费用报表</span></a> </li>
  </ul>
</div>
<!--sidebar-menu-->

<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="yardDirector.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>首页</a></div>
  </div>
<!--End-breadcrumbs-->

<!--Action boxes-->
  <div class="container-fluid">
    <div class="quick-actions_homepage">
      <ul class="quick-actions">
        <li class="bg_lb"> <a href="yardInventoryBootstrapDirector.jsp"> <i class="icon-dashboard"></i>货场盘点</a> </li>
        <li class="bg_lg span3"> <a href="workpageTreeBuyDirector.jsp"><i class="icon-signal"></i> <span>木材收购单</span></a></li>
        <li class="bg_ly"> <a href="passworkpageDirector.jsp"> <i class="icon-inbox"></i><span class="label label-success"></span>录入进场木材数据</a> </li>
        <li class="bg_lo"> <a href="treeoutDirector.jsp"> <i class="icon-th"></i>录入出场木材数据</a> </li>
        <li class="bg_ls"> <a href="cancellingStocksTable.jsp"> <i class="icon-fullscreen"></i>货场报损</a> </li>
      </ul>
    </div>
<!--End-Action boxes-->    

<!--Chart-box-->    
    <div class="row-fluid">
      <div class="widget-box">
        <div class="widget-title bg_lg"><span class="icon"><i class="icon-signal"></i></span>
          <h5>工单列表</h5>
        </div>
        <div class="widget-content" >
          <div class="row-fluid">
            <div class="span12">
              <div class="table-con">
               <table id="table1" class="table-hover"></table>
            </div>
            </div>
          </div>
        </div>
      </div>
    </div>
<!--End-Chart-box--> 
    <hr/>
    <!--Chart-box-->    
    <div class="row-fluid">
      <div class="widget-box">
        <div class="widget-title bg_lg"><span class="icon"><i class="icon-signal"></i></span>
          <h5>木材进场库存分析</h5>
        </div>
        <div class="widget-content" >
          <div class="row-fluid">
            <div id="myPieDiv" style="height:400px; display:inline-block" class="span9">
            <script src="js/echarts.js"></script>
            <script src="js/echarts.min.js"></script>
              <script type="text/javascript">
              function loadDate(option){
            		$.ajax({
            			type:"get",
            			async : false,
            			url:"chartServlet?action=treetype",
            		    data:{},
            		    dataType:"json",
            		    success:function(result){
            		    	if(result){
            		    		option.xAxis[0].data=[];
            		    		 for(var i=0;i<result.length;i++){
            		    			 option.xAxis[0].data.push(result[i].treetype);
            		    			 //yarddate.push(result[i].yarddate);
            		                 //names.push(result[i].name);
            		    			 //alert(result[i].yarddate);
            		               }
            		    		  option.series[0].data=[];
            		               for(var i=0;i<result.length;i++){
            		            	   option.series[0].data.push(result[i].num);
            		            	   //price.push(result[i].price);
            		            	   //alert(result[i].price);
            		               }
            		        }
            		     },
            		     error : function(errorMsg) {
            		          //请求失败时执行该函数
            		      alert("图表请求数据失败!");
            		      //mychart.hideLoading();
            		    }
            		})
            		}


            		var mychart = echarts.init(document.getElementById('myPieDiv'));
            		var option={
            				title:{
            					text:"木材进场库存"
            				},
            				tooltip:{
            					show: true
            				},
            				grid: {
            		            containLabel: true
            		        },
            				legend:{
            					data:['数量']
            				
            				},
            				xAxis:[{
            					type: 'category',
            				        //data: [],
            				}],
            				yAxis : [ {
            					type : 'value',
            					axisLabel: {
            				        formatter: '{value} 根'
            				        },
            				} ],
            				series : [ {
            					name : '数量',
            					type : 'bar',
            					color: 'red',
            		            smooth: true,
            		           // data:[]
            				} ]
            		};
            		//加载数据到option
            		loadDate(option);
            		//设置option
            		mychart.setOption(option);
          </script>
            </div>
          </div>
        </div>
      </div>
    </div>
    <hr/>
</div>
</div>

<!--end-main-container-part-->

<!--Footer-part-->


<!--end-Footer-part-->

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

// resets the menu selection upon entry to this page:
function resetMenu() {
   document.gomenu.selector.selectedIndex = 2;
}
</script>
</body>
</html>