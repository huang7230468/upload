<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="net.sf.json.JSONArray" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  JSONArray jsonArray = new JSONArray();
  JSONObject jsonObject = new JSONObject();
  String srcImageFile = "/uploads/IMG_1932.JPG";
  jsonObject.put("src",srcImageFile);
  jsonObject.put("name","IMG_1932.JPG");
  jsonObject.put("id",Math.random());
  jsonArray.add(jsonObject);
  jsonObject = new JSONObject();
  srcImageFile = "/uploads/IMG_1958.JPG";
  jsonObject.put("src",srcImageFile);
  jsonObject.put("name","IMG_1958.JPG");
  jsonObject.put("id",Math.random());
  jsonArray.add(jsonObject);
  jsonObject = new JSONObject();
  srcImageFile = "/uploads/IMG_1943.JPG";
  jsonObject.put("src",srcImageFile);
  jsonObject.put("name","IMG_1943.JPG");
  jsonObject.put("id",Math.random());
  jsonArray.add(jsonObject);

  out.print(jsonArray.toString());
%>