<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.io.*" %>
<%!
public static String savePath = "/uploads";

public static int uploadFile(HttpServletRequest request) {
	int result = 0;
	// 获取应用的跟路径对应的物理路径
	String path = request.getSession().getServletContext().getRealPath(savePath);
	// 创建文件上传工厂
	//String path="/opt/ftp/upload";
	//path = path + "/file_material";
	// 	String path="D://";  //本地测试
	DiskFileItemFactory factory = new DiskFileItemFactory();
	// 设置上传路径
	factory.setRepository(new File(path));
	// 设置默认内存大小
	factory.setSizeThreshold(1024*1024*10);
	// 创建文件上传对象
	ServletFileUpload upload = new ServletFileUpload(factory);
	// 设置中文编码
	upload.setHeaderEncoding("utf-8");
	InputStream is = null;
	OutputStream os = null;
	try{
		List<FileItem> list = upload.parseRequest(request);
		String name, value;
		for(FileItem item : list) {
			name = item.getFieldName();
			if(item.isFormField()) {
				request.setAttribute(name, item.getString("UTF-8"));
			} else {
				value = item.getName();
					if(value != null && !"".equals(value.trim())) {
				        if(value.toLowerCase().endsWith("jpg")||value.toLowerCase().endsWith("png")||value.toLowerCase().endsWith("gif")){
								value = value.substring(value.lastIndexOf("\\") + 1);
								//value = value.substring(value.lastIndexOf("."));
								//value =  new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + value;
								// 保存文件
								os = new FileOutputStream(new File(path, value));
								// 获取文件上传流
								is = item.getInputStream();
								byte[] b = new byte[1024];
								// 读文件
								int len = 0;
								while((len = is.read(b)) > 0) {
									os.write(b, 0, len); // 保存文件
								}
								item.write(new File(path, value));
								request.setAttribute(name, path + "/" + value);
								result++;
				        }else{
				        	
				        	return -1;
				        }
					}
			}
		}
		return result;
	} catch (Exception e) {
		e.printStackTrace();
		return result;
	} finally {
		try {
			if(is != null) is.close();
		} catch (Exception e) {}
		try {
			if(os != null) os.close();
		} catch (Exception e) {}
	}
}
%>
