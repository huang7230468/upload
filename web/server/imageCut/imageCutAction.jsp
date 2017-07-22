<%@ page import="net.sf.json.JSONObject" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../imageCut/imageCut.jsp"%>
<%

    int x = Integer.valueOf(request.getParameter("x1").toString());
    int y = Integer.valueOf(request.getParameter("y1").toString());
    int w = Integer.valueOf(request.getParameter("w").toString());
    int h = Integer.valueOf(request.getParameter("h").toString());
    String imageUrl = request.getParameter("imageName").toString() ;

    String path = request.getSession().getServletContext().getRealPath("/");
    String descCutUrl = path +savePath+ "/" + imageUrl ;
    String filePath = path +imagePath+ "/" + imageUrl ;
    abscut(filePath,descCutUrl,x,y,w,h);
    JSONObject jsonObject = new JSONObject();
    jsonObject.put("path","/cut/11.jpg");
    out.println(jsonObject.toString());

%>
<%!
    public static String savePath = "/cut";
    public static String  imagePath = "/uploads";
%>