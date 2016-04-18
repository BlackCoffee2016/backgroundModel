<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="include/header.jsp" %>
<div class="row">
     <div class="col-xs-12">
          <div class="box">
               <div class="box-header">
	               <h3 class="box-title">
		              <c:if test="${create == '1'}">新增道具</c:if>
		              <c:if test="${create == '0'}">编辑道具</c:if>
	               </h3>
	            </div>
	            <div class="box-body">
	                 <form method="post" name="itemForm" <c:if test="${create == '1'}">action="${pageContext.request.contextPath}/hlg/insertLiBaoItem"</c:if><c:if test="${create == '0'}">action="${pageContext.request.contextPath}/hlg/updateLiBaoItems"</c:if>>
	                       <input type="hidden" value="${items.id}" id="id" name="id"/>
	                       <div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>道具名称：</label>
										<input type="text" class="form-control" id="itemName" name="itemName" value="${items.itemName}">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>itemcode：</label>
										<input type="text" class="form-control" id="itemCode" value="${items.itemCode}" name="itemCode" placeholder="格式为:xxx:xxxx 例如:41744:5"/>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>itemtype：</label>
										<input type="number" class="form-control" value="${items.itemType}" id="itemType" name="itemType"/>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>image：</label>
										<input type="text" class="form-control" value="${items.image}" id="image" name="image">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>icon：</label>
										<input type="text" class="form-control" value="${items.icon}" id="icon" name="icon">
									</div>
								</div>
								<input type="hidden" value="${giftType}" name="giftType"> 
							</div>
							<div class="form-group">
								     <label>是否上架：</label>
								     <label>
										<input type="radio" name="status" value="0" <c:if test="${items.status==0}">checked</c:if> >下架
									 </label>
									 <label>
										<input type="radio" name="status" value="1" <c:if test="${items.status==1}">checked</c:if> >上架
									 </label>
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
		  
		  
		  
		  document.itemForm.submit();
		  
	  })
});
</script>
<%@include file="include/footer.jsp" %>