<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="include/header.jsp" %>
<div class="row">
     <div class="col-xs-12">
         <div style="height: 50px;">
			<a href="${pageContext.request.contextPath}/hlg/toInsertLiBaoItem?giftType=${giftType}&flag=1" type="button" class="btn btn-primary">新增礼包道具</a>
			<span style="color:red;">背景色为灰色的代表已经上架，您可以对其进行修改</span>
		</div>
		
		<div class="box">
		     <div class="box-body" style="min-height: 400px;">
		          <table class="table table-striped">
		                 <thead>
							<tr>
								<th>id</th>
								<th>道具名称</th>
								<th>itemcode</th>
								<th>itemtype</th>
								<th>gifttype</th>
								<th>是否上架</th>
								<th>image</th>
								<th>icon</th>
								<th>操作</th>
							</tr>
						 </thead>
						 <tbody>
						   <c:forEach items="${items}" var="item">
							    <tr <c:if test="${item.status==1}">style="background:#DDDDDD;"</c:if>>
							       <td>${item.id}</td>
							       <td>${item.itemName}</td>
							       <td>${item.itemCode}</td>
							       <td>${item.itemType}</td>
							       <td>${item.giftType}</td>
							       <td>
							           <c:if test="${item.status==0}">下架</c:if>
							           <c:if test="${item.status==1}">上架</c:if>
							       </td>
							       <td>${item.image}</td>
							       <td>${item.icon}</td>
							       <td>
							          <a href="${pageContext.request.contextPath}/hlg/toLiBaoItemDetails?id=${item.id}&giftType=${item.giftType}" class="btn btn-primary btn-sm">编辑</a>
							       </td>
							    </tr>
						    </c:forEach>
						 </tbody>
		          </table>
		     </div>
		     <div class="box-footer">
		          <nav>
		              <ul class="pagination">
		                  <c:if test="${page.pageIndex > 1}">
		                     <li>
		                        <a href="${pageContext.request.contextPath}/hlg/liBaoItems?pageIndex=${page.pageIndex-1}&giftType=${giftType}"><span>&laquo;</span></a>
		                     </li>
		                  </c:if>
		                  <c:forEach items="${pageList}" var="pageList">
		                     <li <c:if test="${pageList == page.pageIndex}">class="active"</c:if>><a href="${pageContext.request.contextPath}/hlg/liBaoItems?pageIndex=${pageList}&giftType=${giftType}">${pageList}</a></li>
		                  </c:forEach>
		                  <c:if test="${page.pageIndex < page.totalPage}">
		                     <li>
		                        <a href="${pageContext.request.contextPath}/hlg/liBaoItems?pageIndex=${page.pageIndex+1}&giftType=${giftType}"><span>&raquo;</span></a>
		                     </li>
		                  </c:if>
		              </ul>
		          </nav>
		     </div>
		</div>
     </div>
</div>
<%@include file="include/footer.jsp" %>