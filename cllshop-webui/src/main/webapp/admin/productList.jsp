<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>书本列表</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/layui/css/layui.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/global.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/icheck/minimal/red.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <%@include file="common.jsp"%>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
        <fieldset class="layui-elem-field">
            <legend>内容管理 - 商品列表</legend>
            <div class="layui-field-box">
              <form action="#" style="text-align: center">
		    		<input type="hidden" name="method" value="queryData">
		    	类别查询:<select name="cid" id="c_id">
		    		<option value="">请选择</option>
		    		<c:forEach items="${categoryList }" var="category">
		    			<option value="${category.cid }">${category.cname }</option>
		    		</c:forEach>
		    	</select>
	    			 <div class="layui-inline" style="text-align:left;">
                    <div class="layui-input-inline">
                      <button class="layui-btn"><i class="layui-icon">&#xe615;</i>查询</button>
                    </div>
                  </div>
	    		</form>
              <hr>
              <div class="layui-btn-group">
                  <button class="layui-btn layui-btn-xs layui-btn-normal dw-dailog" dw-url="#" dw-title="新增商品" dw-width="100%" dw-height="100%">
                      <i class="layui-icon">&#xe654;</i>新增
                  </button>
                  <button class="layui-btn layui-btn-xs dw-refresh">
                      <i class="layui-icon">&#x1002;</i>刷新
                  </button>
              </div>
              <hr>
              <table class="layui-table">
                  <thead>
                      <tr>
			   			<th>编号</th>
			   			<th>商品名称</th>
			   			<th>描述</th>
			   			<th>价格(元)</th>
			   			<th>商品图片</th>
			   			<th>库存</th>
			   			<th>子类别</th>
			   			<th>父类别</th>
                        <th>商家名称</th>
			   			<th>是否热销</th>
                        <th>热销时间</th>
                        <th>创建时间</th>
                        <th>更新时间</th>
                        <th>状态</th>
			   			<th>操作</th>
			   		</tr> 
                  </thead>
                  <tbody>
	                  <c:forEach items="${pageInfo.data }" var="product" varStatus="v">
	                  <tr>
		   				<td>${v.count }</td>
		   				<td>${product.name }</td>
		   				<td>${product.description }</td>
		   				<td>${product.price / 100 }</td>
		   				<td>${product.images }</td>
		   				<td><fmt:formatDate value="${product._date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		   				<td>${book.category.cname }</td>
		   				<td>
		   					<c:if test="${book.hot==0 }">否</c:if>
		   					<c:if test="${book.hot!=0 }">是</c:if>
		   				</td>
		   				<td class="text-center">
	                        <div class="layui-btn-group">
	                          <button class="layui-btn layui-btn-xs layui-btn-normal dw-dailog" dw-url="${pageContext.request.contextPath }/book.action?method=goEditPage&bid=${book.bid}" dw-title="编辑用户" dw-width="80%" dw-height="80%">
	                            <i class="layui-icon">&#xe642;</i>编辑
	                          </button>
	                          <button class="layui-btn layui-btn-xs layui-btn-danger dw-delete" dw-url="${pageContext.request.contextPath }/book.action?method=deleteBook&bid=${book.bid}" dw-title="${book.bname }">
	                            <i class="layui-icon">&#xe640;</i>删除
	                          </button>
	                        </div>
	                      </td>
		   				</tr>
	                  </c:forEach>
	                  <tr>
					<td colspan="9" style="text-align: center">
		    	 	 	<c:choose>
		    	 	 	<c:when test="${pageInfo.curPage==1 }">
		    	 	 		首页&nbsp;
		    	 	 		上一页
		    	 	 	</c:when>
		    	 	 	<c:otherwise>
		    	 	 		<a href="${pageContext.request.contextPath }/book.action?method=bookList&curPage=${pageInfo.firstPage }">首页</a>&nbsp;
		    	 			<a href="${pageContext.request.contextPath }/book.action?method=bookList&curPage=${pageInfo.prePage }">上一页</a>&nbsp;
		    	 	 	</c:otherwise>
		    	 	 </c:choose>
		    	 	 <c:choose>
		    	 	 	<c:when test="${pageInfo.curPage==pageInfo.totalPage }">
		    	 	 		下一页&nbsp;
		    	 	 		尾页
		    	 	 	</c:when>
		    	 	 	<c:otherwise>
		    	 	 		<a href="${pageContext.request.contextPath }/book.action?method=bookList&curPage=${pageInfo.nextPage }">下一页</a>&nbsp;
		    	 			<a href="${pageContext.request.contextPath }/book.action?method=bookList&curPage=${pageInfo.totalPage }">尾页</a>&nbsp;
		    	 	 	</c:otherwise>
		    	 	 </c:choose>
						 当前第${pageInfo.curPage }页/共${pageInfo.totalPage }页&nbsp;
						共${pageInfo.totalCount }条数据&nbsp;
						每页显示${pageInfo.pageSize }条&nbsp;
						跳转到第<input type="text" size="2" id="toPage" name="toPage" onblur="_toPage()"/>页
						</td>
				</tr>
                  </tbody>
              </table>
            </div>
        </fieldset>
    </div>
  </div>
  
</div>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/javascript/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/icheck/icheck.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/admin/javascript/dw.js"></script>
<script type="text/javascript">
  	function _toPage(){
		var toPage = document.getElementById("toPage").value;
    		var reg = /^[1-9][0-9]?$/;
    		if(!reg.test(toPage)){
    			alert("错误参数");
    			document.getElementById("toPage").value="1";
    			return;
    		}
    		//输入的页面不能大于总页码
    		var totalPage = "${pageInfo.totalPage}";
    		if(toPage>totalPage){
    			alert("不能大于总页数!");
    			document.getElementById("toPage").value="1";
    			return;
    		}
    		var url = "${pageContext.request.contextPath }/book.action?method=bookList&curPage="+toPage;
    		window.location.href = url;
	}
	
  </script>
</body>
</html>