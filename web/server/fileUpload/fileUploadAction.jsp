<%@ page import="net.sf.json.JSONObject" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="fileUpload.jsp"%>
<%

    int num = uploadFile(request) ;
    System.out.println("上传文件数量"+ num);
    System.out.println(request.getAttribute("image"));
    /*JSONObject jsonObject = new JSONObject();
    String srcImageFile = "/uploads/IMG_1932.JPG";
    jsonObject.put("src",srcImageFile);
    jsonObject.put("name","20012.JPG");
    jsonObject.put("id",Math.random());

    out.print(jsonObject.toString());*/
%>