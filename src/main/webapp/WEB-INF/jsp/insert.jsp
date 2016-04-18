<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="include/header.jsp" %>
<div class="row">
     <div class="col-xs-12">
          <div class="box">
               <div class="box-header">
	               <h3 class="box-title">
		              <c:if test="${create == true}">新增道具</c:if>
		              <c:if test="${create != true}">编辑道具</c:if>
	               </h3>
	            </div>
	            <div class="box-body">
	                 <form method="post" name="itemForm" <c:if test="${create == true}">action="${pageContext.request.contextPath}/insert"</c:if><c:if test="${create != true}">action="${pageContext.request.contextPath}/update"</c:if>>
	                       <input type="hidden" value="${item.id}" id="id" name="id"/>
	                       <div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>productid：</label>
										<input type="number" class="form-control" id="productid" name="productid" value='${item.productid}'>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>道具名称：</label>
										<input type="text" class="form-control" id="giftname" name="giftname" value='${item.giftname}' placeholder="格式为   道具名字*道具个数   例如：黑狮钥匙*10   注意:道具名字不能太长">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>一折价格：</label>
										<input type="number" class="form-control" id="point5" name="point5" value='${item.point5 }'>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>原价：</label>
										<input type="number" class="form-control" id="point" name="point" value='${item.point}'>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>道具ID：</label>
										<input type="text" class="form-control" id="itemids" name="itemids" value='${item.itemids}' placeholder="格式为   道具ID:道具个数   例如：19980:10">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>gaapid：</label>
										<input type="number" class="form-control" id="gaapid" name="gaapid" value='${item.gaapid}'>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>图片地址：</label>
										<input type="text" class="form-control" id="imgurl" name="imgurl" value='${item.imgurl}'>
									</div>
								</div>
								<div class="form-group">
								     <label>是否上架：</label>
								     <label>
										<input type="radio" name="status" value="0" <c:if test="${item.status==0}">checked</c:if> >是
									 </label>
									 <label>
										<input type="radio" name="status" value="1" <c:if test="${item.status==1}">checked</c:if> >否
									 </label>
								</div>
							</div>
							<div>
								<button type="button" class="btn btn-success btn-lg" id="save">保存</button>
							</div>
	                 </form>
	            </div>
          </div>
     </div>
</div>
<script>
$(document).ready(function() {
	  $("#save").click(function(){
		  var productId=$.trim($("#productid").val());
		  var point5=$.trim($("#point5").val());
		  var point=$.trim($("#point").val());
		  var gaapId=$.trim($("#gaapid").val());
		  var imgurl=$.trim($("#imgurl").val());
		  var status=$('input:radio[name="status"]:checked').val();//如果为null表示没有选中
		  var giftName=$.trim($("#giftname").val());
		  var itemId=$.trim($("#itemids").val());
		  
		  if(productId==""){
			  alert("请输入productid");
			  return false;
		  }
		  
		  if(giftName==''){
			  alert("请输入道具名称");
			  return false;
		  }
		  if(giftName.indexOf("*")==-1){
			  alert("道具的名字请输入正确的格式");
			  return false;
		  }
		  var name=giftName.split("*")[0];
		  var end=giftName.split("*")[1];
		  if(name==="" || end===""){
			  alert("道具的名字请输入正确的格式");
			  return false;
		  }
		  var regChinese=/^[\u4e00-\u9fa5]+$/;
		  if(!regChinese.test(name) || isNaN(end)){
			  alert("道具的名字请输入正确的格式");
			  return false;
		  }
		  
		  if(point5==""){
			  alert("请输入一折价格");
			  return false;
		  }
		  
		  if(point==""){
			  alert("请输入原价");
			  return false;
		  }
		  
		  if(itemId==""){
			  alert("请输入道具ID");
			  return false;
		  }
		  if(itemId.indexOf(":")==-1){
			  alert("道具ID请输入正确的格式");
			  return false;
		  }
		  var item=itemId.split(":")[0];
		  var count=itemId.split(":")[1];
		  if(item==="" || count===""){
			  alert("道具ID请输入正确的格式");
			  return false;
		  }
		  if(isNaN(item) || isNaN(count)){
			  alert("道具ID请输入正确的格式");
			  return false;
		  }
		  
		  if(gaapId==""){
			  alert("请输入gaap");
			  return false;
		  }
		  
		  if(imgurl==""){
			  alert("请输入道具图片地址");
			  return false;
		  }
		  
		  if(status==null){
			  alert("请点击是否上架");
			  return false;
		  }
		  
		  document.itemForm.submit();
		  
	  })
});
</script>
<%@include file="include/footer.jsp" %>