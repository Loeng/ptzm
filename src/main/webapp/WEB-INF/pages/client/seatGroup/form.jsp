<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="../../Css/purge.css">
    <link rel="stylesheet" href="../../Css/Pagestyle.css">
    <link rel="stylesheet" href="../../Css/buttons.css">
    <link rel="stylesheet" href="../../Css/Popup.css">
   
</head>
<body class="wrap">

    <script src="../../content/scripts/common/form.js"></script>
	<script src="../../content/scripts/common/formUtils.js"></script>
<script type="text/javascript">
var saveUrl = "saveDate";
var entityUrl = "entity";
//var serverValidateName = '<s:url action="validatename" namespace="/itinfo/borrow" />';

var saveSucInfo = "保存坐席组信息";
var nameRequire = true;
var nameMaxLength = 100;
var nameServerValidate = false;
var descriptionLengthValidate = true;
var descriptionMaxLength = 250;
var saveClearForm=true;

function formLoaded(data){
	//alert(data);
}

function saveDate(){
	var deptName = $("#deptName").val();
	if(!deptName){
		alert("坐席组名必填！");
		return;
	}
	
	$.ajax({
            type: "POST",
            dataType: "json",
            url: "/client/seatGroup/saveDate" ,//url
            data: $('#frm').serialize(),
            success: function (result) {
            	if(result.success){
            		alert("数据提交成功！");
            		top.closeDialog();
            		top.fwin.$('#tbl').datagrid("reload");
            	}else{
            		alert("异常！");
            	}
            },
            error : function() {
                alert("异常！");
            }
        });
	
}

</script>
    
   <div class="wrap">
    <div class="main">
    	 <form method="post" id="frm">
        	<div class="title">
            	<span>基本信息</span>
        	</div>
        <div class="Input">
            <div class="InputContent">
                <p>部门名称</p>
                <input readonly type="text" name="deptName" id="deptName">
            </div>

            <div class="InputContent">
                <p>坐席组名</p>
                <input type="text" name="name" id="name">
            </div>
 			<input hidden type="text" name="deptId" id="deptId">
            <input hidden type="text" name="id" id="id">
          </div>
         </form>
        <div class="Button">
            <a href="javascript:saveDate();" class="button button-action button-pill">保存</a>
            <a href="" class="button button-border button-pill button-action">重置</a>
        </div>
    </div>
   </div>
</body>

</html>