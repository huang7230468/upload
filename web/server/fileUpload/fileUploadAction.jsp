<%@ page import="net.sf.json.JSONObject" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="fileUpload.jsp"%>
<%

    int num = uploadFile(request) ;
    System.out.println("上传文件数量"+ num);
    System.out.println(request.getAttribute("image"));
    JSONObject jsonObject = new JSONObject();
    String srcImageFile = request.getSession().getServletContext().getRealPath("/uploads")+"/IMG_1932.JPG";
    jsonObject.put("path",new File(srcImageFile).toString());
    out.print(jsonObject.toString());
%>