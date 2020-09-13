<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jinshen.bean.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>信息中心审核补交材料的进场数据</title>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/fullcalendar.css" />
<link rel="stylesheet" href="css/matrix-style.css" />
<link rel="stylesheet" href="css/matrix-media.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" href="css/jquery.gritter.css" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
<link type="text/css" rel="stylesheet" href="css/PrintArea.css" />  
    <link href="css/registe.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        .table_p{line-height: 28px;border-bottom: 1px #d0e6ec solid;position: relative;margin-bottom: 10px; 
            margin-top: 35px; margin-left:10px}
        .table_p span{border-bottom: 3px #42cdec solid;display: inline-block;position: absolute;bottom: -1px;font-weight: bold;font-size: 20px}
        .but_p button{width: 200px;height:50px}
        #h li{float: left; }
#h a{font-size:15px;width: 230px; height: 30px;padding: 10px 0;text-align: center;  background: #3c763d; display: block; text-decoration:none; color:white}
#h a:hover{color:white;background: green}
.table1{margin-left:auto; margin-right:auto;padding:10px;border-collapse:collapse}
.table2{width:70%; height:100px;margin-left:auto; margin-right:auto;padding:10px;border-collapse:collapse}
.btn{ 	
	font-family: "'微软雅黑','Helvetica Neue',Helvetica,Arial,sans-serif"; 	
	font-size: 20px!important; 	height: 30px; 	
	line-height: 18px!important; 	
	padding: 3px 18px; 	
	display: inline-block; 	vertical-align: middle; 	
	font-weight: normal; 	border-radius: 3px; 	
	margin: 0 8px 0 3px; 	
	border: 1px solid #3383da; 	
	color: #ffffff; 	
	background-color: #3383da; 	
	cursor: pointer; 
	width: 200px;
	height:50px
	}
</style>
    
<script type="text/javascript">
var k=100;

function aaad()
{
 	var str="<tr id="+k+" display:block;><td style='font-size:20px;'><input type='checkbox' style='width:20px;height:20px;' value="+k+">树材种<span></span>"
          +"<select style='width: 180px' name='treetype' id='sss"+k+"'>"
          +"<option>--请选择--</option>"
          +"<option value='杉木'>--杉木--</option>"
          +"<option value='松木'>--松木--</option>"
          +"<option value='杂木'>--杂木--</option></select>"
        +"检尺长(米)<span></span><input type='text' style='width: 180px' name='tdouble' id='td"+k+"'>检尺径(厘米)<span></span>"
          +"<input type='text' style='width: 180px' name='tradius' id='tr"+k+"'>根数<span></span><input type='text' style='width: 180px' name='num' id='n"+k+"'>"
             +"材积(立方米)<span></span><input type='text' style='width: 180px' name='tvolume' id='tv"+k+"' onclick='vvvolume("+k+")'></td></tr>";
             k=Number(k)+Number(1);
            $("#ttt5").append(str);             
}
function dddelete()
{
	var ck= $("input[type='checkbox']:checked");
	for (var i=0;i<ck.length;i++)
		{
		     var j=$(ck[i]).val();
		     alert(j);
		     $("#"+j+"").empty();
		}
}
function deleteAll()
{
	var mk=$("input[type='checkbox']:checked");
	var index=$("input[type='checkbox']:not(:checked)");
	for (var i=0;i<mk.length;i++)
    {
	    var h=$(mk[i]).val();
	    
	     $("#"+h+"").empty();
	}
   for (var a=0;a<index.length;a++)
	{
	    var hh=$(index[a]).val();
	    $("#"+hh+"").empty();
	}
}
function vvvolume(id)
{
	var td=$("#td"+id+"").val();
	var tr=$("#tr"+id+"").val();
	var num=$("#n"+id+"").val();
	if(num!="" && td!="" && tr!="")
	{
	$.ajax({
        url:"treeServlet",
        data:{
            "action":"volume",
            "td":td,
            "tr":tr 
        },
        type: "POST",
        dataType:"html",
        success: function (data) {
        	document.getElementById("tv"+id+"").value=Number(data*num);
        }
    })}
	}
function makecount()
{
	var mk=$("input[type='checkbox']:checked");
	var index=$("input[type='checkbox']:not(:checked)");
	var totalt=Number(0);
	var totalst=Number(0);
	var total=Number(0);
	var tot=Number(0);
	//System.out.println("...." + mk + "...");
	for (var i=0;i<mk.length;i++)
    {
	     var h=$(mk[i]).val();
	     totalst+=Number(document.getElementById("tv"+h+"").value);
		 totalt+=Number(document.getElementById("n"+h+"").value);
	}
   for (var a=0;a<index.length;a++)
	{
	    var hk=$(index[a]).val();
	    total+=Number(document.getElementById("tv"+hk+"").value);
	    tot+=Number(document.getElementById("n"+hk+"").value);
	}
   document.getElementById("toltree").value=Number(totalt+tot);
   document.getElementById("tolstere").value=Number(totalst+total);
}
function treeAdd()
{
	var map={};
	var kk=Number(0),ki=Number(0);
	var workid=$("#wworkid").val();
	var cutnum=$("#ccutnum").val();
	var cutsite=$("#ccutsite").val();
	var yarddate=$("#yyarddate").val();
	var yard=$("#yyard").val();
	var carnumber=$("#ccarnumber").val();
	var section=$("#ssection").val();
	var surveyor=$("#ssurveyor").val();
	var toltree=$("#toltree").val();
	var tolstere=$("#tolstere").val();
	//var cutnum=document.getElementById("cutnum").value;
	if(workid=="")
		{
		alert("请先输入工单号！");
		}
	else{
    $("input[type='checkbox']:checked").each(function(i){
    	var group=[];
    	var id=$(this).val();
    	alert(id);
    	    group[0]=document.getElementById("sss"+id+"").value;
    	    group[1]=document.getElementById("td"+id+"").value;
    	    group[2]=document.getElementById("tr"+id+"").value;
    	    group[3]=document.getElementById("n"+id+"").value;
    	    group[4]=document.getElementById("tv"+id+"").value;
    	    //System.out.println("...." + group[4] + "...");
    	    if(group[0]==""|| group[1]==""|| group[2]=="" || group[3]==""|| group[4]=="")
    	    	{
    	    	alert("请将信息填写完整！");
    	    	}
    	      else{
               map[i]=group;
               kk=Number(i)+Number(1);
    	    }
    });
    $("input[type='checkbox']:not(:checked)").each(function(j){
    	var group=[];
    	var id=$(this).val();
    	    group[0]=document.getElementById("sss"+id+"").value;
    	    group[1]=document.getElementById("td"+id+"").value;
    	    group[2]=document.getElementById("tr"+id+"").value;
    	    group[3]=document.getElementById("n"+id+"").value;
    	    group[4]=document.getElementById("tv"+id+"").value;
    	    if(group[0]=="" || group[1]=="" ||group[2]=="" || group[3]=="" || group[4]=="")
	    	{
	    	alert("请将信息填写完整！");
	    	}
	        else{ 
        map[kk+j]=group;
        ki=Number(j)+Number(1);
	    }
    }); 
    var mymap=JSON.stringify(map);
    $.ajax({
        url:"treeServlet",
        data:{
            "action":"inyardupdate2",
            "newtree":mymap,
            "id":ki+kk,
            "workid":workid,
            "cutnum":cutnum,
            "cutsite":cutsite,
            "yarddate":yarddate,
            "yard":yard,
            "carnumber":carnumber,
            "section":section,
            "surveyor":surveyor,
            "toltree":toltree,
            "tolstere":tolstere,     
        },
        type: "POST",
        dataType:"html",
        success: function (data) {
        	alert(data);
        	/*if(data>0)
        		{
        	        alert("添加成功！");
        		}
        	else{
        		 alert("请检查输入的材积是否已经超标");
        	}*/
        }
    })
    }
}
function inputNull(form){
	for(i=0;i<form.length;i++){
            //form属性的elements的首字母e要小写
		if(form.elements[i].value == ""){ 
			alert("" + form.elements[i].placeholder + "不能为空");
			form.elements[i].focus();	
			return false;
		}
	}
	}
function yes(){
	var workid=document.getElementById("wworkid").value;
	//var rejectreason=document.getElementById("rejectreason").value;
	//var designum=$("designum").val();
	$.ajax({
		url:"treeServlet?action=inyardyesornoxiu&type=yes",
        //url:"cutnumServlet",
        data:{
            //"action":"applyyesorno&type=yes",
            "workid":workid,
        },
        type: "POST",
        dataType:"html",
        success: function (data) {
        	if(data>0){
        		alert("审核通过");
        		window.location.href = 'InyardShenheinfo.jsp';
        	}
        	else{
        		alert("审核保存失败");
        		window.location.href = 'InyardShenheinfo.jsp';
        	}
        }
    })
}
function not(){
	var workid=document.getElementById("wworkid").value;
	//var rejectreason=document.getElementById("rejectreason").value;
	$.ajax({
        url:"treeServlet?action=inyardyesornoxiu&type=not",
        data:{
            //"action":"applyyesorno&type=not",
            "workid":workid,
        },
        type: "POST",
        dataType:"html",
        success: function (data) {
        	if(data>0){
        		alert("反馈成功");
        		window.location.href = 'InyardShenheinfo.jsp';
        	}
        	else{
        		alert("反馈失败");
        		window.location.href = 'InyardShenheinfo.jsp';
        	}
        }
    })
}
</script>
</head>
<body>
<% inyard c=(inyard)request.getAttribute("inyard"); 
List<tree> t=null;
t=(List<tree>)request.getAttribute("tree");
%>
<% workpageStatus w=(workpageStatus)request.getAttribute("workpageStatus");%>
<% workpage o=(workpage)request.getAttribute("workpage");%>
  <div id="header">
  <h1><a href="dashboard.html">伐区监管平台</a></h1>
</div>
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
  </ul>
</div>
<!--close-top-Header-menu-->

<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> 仪表盘</a>
  <ul>
    <li><a href="workpageShenheinfo.jsp"><i class="icon icon-home"></i> <span>审核进场工单</span></a> </li>
    <li class="active"><a href="InyardShenheinfo.jsp"><i class="icon icon-home"></i> <span>审核木材数据</span></a> </li>
    <li><a href="compareTreeinfo.jsp"><i class="icon icon-home"></i><span>审核装车照片</span></a></li>
  </ul>
</div>
<!--sidebar-menu-->
<!--main-container-part-->
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="infoCenter.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>首页</a></div>
  </div>
  <div class="container-fluid">
            <div id="divprint">
                <div class="top">
                <table class="table2">
                <caption class="book_h01">信息中心反馈被退回工单原因</caption>
                <tr>
                 <td style="font-size:20px">未通过审核原因:</td><td><input style="width:400px;font-size:20px" type="text" name="rejectreason" id="rejectreason" value="<%=w.getRejectreason() %>"></td>
                </tr>
                  </table>
                   <p class="table_p"><span>采伐工单信息</span></p>
                       <table class="table1">
                         <tr>
                         <td>工单号<span></span></td>
                          <td>
                          <input name="workid" type="text" maxlength="32" id="wworkid" readonly value="<fmt:formatNumber value="<%=o.getWorkid()%>" pattern="#0.##"/>" />
                          <%--  <input type="text" name="workid" id="wworkid" value="<%=o.getWorkid() %>">--%>
                          </td>
                          <td>采伐证号<span></span></td>
                          <td>
                          <input type="text" name="cutnum" id="ccutnum" value="<%=o.getCutNum() %>">
                           </td>
                           <td>采伐地点<span></span></td>
                          <td>
                          <input type="text" name="cutsite" id="ccutsite" value="<%=o.getCutSite() %>">
                           </td>
                           <td>货场地点<span></span></td>
                              <td>
                              <input type="text" name="yard" id="yyard" value="<%=o.getCheckSite() %>">
                              </td>
                           </tr>
                           <tr>
                              <td>车牌号<span></span></td>
                              <td>
                              <input type="text" name="carnumber" id="ccarnumber" value="<%=o.getCarNumber() %>">
                              </td>
                              <td>采伐时间<span></span></td>
                              <td>
                              <input  name="cutdate" id="cutdate" value="<%=o.getCutdate() %>">
                              </td>
                              <td>进场时间<span></span></td>
                              <td>
                              <input  name="yarddate" id="yyarddate" value="<%=c.getYarddate() %>">
                              </td>
                              <td>伐区监管员<span></span></td>
                              <td>
                              <input type="text" name="forester" id="forester" value="<%=o.getForester() %>">
                              </td>
                           </tr>
                        </table>
                        <p class="table_p"><span>树材信息</span></p>
                        <table class="table" id="table5" style="width:100%;height:auto">
                           <tbody id="ttt5">
                                <% int i=1;%>
                                <c:forEach items="${tree}" var="b">      
                            <tr id="<%=i%>" display:block;><td style='font-size:20px;'>
                           <input type="checkbox" style='width:20px;height:20px;' value="<%=i%>">树材种<span></span>
                           <input style="width: 180px" name="treetype" id="sss<%=i%>" value="${b.getTreetype()}">                      
                                                                                            检尺长(米)<input type='text' style='width: 180px' name='tdouble' id='td<%=i%>' value="${b.getTlong()}">
                                                                                            检尺径(厘米)<span></span><input type='text' style='width: 180px' name='tradius' id='tr<%=i%>' value="${b.getTradius()}">
                                                                                            根数<span></span><input type='text' style='width: 180px' name='num' id='n<%=i%>' value="${b.getNum()}">
                                                                                            材积(立方米)<span></span><input type='text' style='width: 180px' name='tvolume' id='tv<%=i%>' value="${b.getTvolume()}"></td></tr>
                         <%i++; %>
                         </c:forEach>
                                </tbody>
                            </table>  
                            <table class="table1" >
                                <tbody>
                                <p class="table_p" style="margin-top: 65px;"><span>合计信息</span></p>
                                <tr>
                                    <td style="font-size:20px;width:auto">合计树材<span></span>
                                        <input type="text" style="width:120px; font-size:20px" name="toltree" id="toltree" value="<%=c.getTolTree()%>" onclick="makecount()">根(块、件)<span></span></td>
                                    <td style="font-size:20px">合计树材<span></span>
                                        <input type="text" style="width:120px; font-size:20px" name="tolstere" id="tolstere" value="<%=c.getTolStere()%>">立方米(吨、根)<span></span></td>
                                         <td style="font-size:20px">货场分区<span></span>
                                       <input name="section" id="ssection" value="<%=c.getSection()%>"></td>
                                     <td style="font-size:20px">检尺员<span></span>
                                      <input type="text" name="surveyor" id="ssurveyor" value="<%=c.getSurveyor() %>"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div><p class="table_p" style="margin-top: 65px;font-size:20px"><span style="align:left">请审核工单</span></p></div>
                <div style="text-align:center">
                  <button style="margin-right:20px" class="btn" type="button" onclick="yes()" value="审核通过">审核通过</button>
                 <button class="btn" type="button"  onclick="not()" value="审核未通过">审核未通过 </button>
         </div>
    </div>
</div>
    
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
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/jQuery.print.js"></script>
<script src="js/jquery.PrintArea.js" type="text/JavaScript"></script>

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
  
$(function(){
    $("#btnPrint").click(function(){ $("#divprint").printArea(); });
});
</script> 
</body>
</html>