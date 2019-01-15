/**
 * 
 */
package com.bjsxt.work.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

/**
 * @author 李军伟
 * @function: 上传下载工具类
 * @date: 2017年8月31日
 */
public class UploadUtil {

	private UploadUtil() {
	}

	/**
	 * @return 文件上传对象
	 */
	public static ServletFileUpload getUpload() {
		// 1.创建一个FileItem工厂对象
		FileItemFactory factory = new DiskFileItemFactory();

		// 2.由FileItem工厂创建ServletUpload对象
		return new ServletFileUpload(factory);
	}

	/**
	 * @param fileSizeMax
	 *            单个文件的大小
	 * @param setSizeMax
	 *            总文件大小
	 * @return 得到FileItemList
	 */
	@SuppressWarnings("all")
	public static List<FileItem> getFileItemList(ServletFileUpload upload, HttpServletRequest request, Integer fileSizeMax, Integer setSizeMax, Integer num) {
		if (fileSizeMax == null) {
			fileSizeMax = 1024*1024;
		}

		if (num == null) {
			num = 1;
		}

		upload.setHeaderEncoding("utf-8");//解决File表单项的文件名中文乱码问题
		upload.setFileSizeMax(1024 * fileSizeMax);// 单个文件最大大小
		upload.setSizeMax(1024 * fileSizeMax * num);// 一次上传所有文件的最大总容量
		// 3.使用ServletUpload处理上传操作，负责将一个个表单项封装到一个个FileItem中
		List<FileItem> itemList = null;
		try {
			itemList = upload.parseRequest(request);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}

		return itemList;
	}

	// 上传文件的格式 
	private static String[] FILESUFFIXS = { "zip", "rar", "7Z" };
	// 得到规定的文件后缀格式
	public static String getSuffixs() {
		return Arrays.toString(UploadUtil.FILESUFFIXS).replace("[", "").replace("]", "");
	}
	
	/**
	 * @param item 文件项
	 * @return 是否是指定压缩文件格式中的一种
	 */
	public static String getFileSuffix(FileItem item) {
		String realName = item.getName();
		String extName = item.getName().substring(realName.lastIndexOf(".") + 1).toLowerCase();

		for (int i = 0; i < FILESUFFIXS.length; i++) {
			if (FILESUFFIXS[i].equalsIgnoreCase(extName)) {
				return FILESUFFIXS[i];
			}
		}
		
		return null;
	}
	
	/**
	 * 开始上传文件
	 * @param request
	 * @param response
	 * @param item  	文件项
	 * @param realPath  上传文件到某个位置
	 * @return			上传是否成功
	 */
	public static boolean uploadFile(HttpServletRequest request, HttpServletResponse response, FileItem item, String realPath) {
		File dir = new File(realPath);
		if(!dir.exists()){
			dir.mkdirs();
		}
		
		String realName = item.getName();  //文件名
		File file = new File(dir, realName);				
		//上传文件
		try {
			item.write(file);
		} catch (Exception e) {
			request.setAttribute("error", "<font color='red'>" + e.getMessage() + "</font>");
			e.printStackTrace();
			return false;
		}
		
		return true;
	}

	
	// 下载文件
	/**
	 * @param request
	 * @param response
	 * @param realPath   目标资源的路径
	 * @param filename	 目标资源文件名
	 * @param fileSuffix 文件类型 null
	 */
	public static void download(HttpServletRequest request, HttpServletResponse response,
								String realPath, String filename, String fileSuffix) {
		
		//解决中文文件下载的乱码问题  获得浏览器类型
		String browserType = request.getHeader("User-Agent").toLowerCase();
		try {
			// 如果浏览器是IE
			if(browserType.indexOf("msie") >= 0){
				// 转换字符
				filename = URLEncoder.encode(filename,"utf-8");
			}else{
				// 转换字符
				filename = new String(filename.getBytes("utf-8"),"iso-8859-1");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 设置文件的路径和名字
		File file = new File(realPath, filename);
		// 设置头部信息 有弹框提醒用户下载
		response.setHeader("Content-Disposition", "attachment;filename="+filename);
		// 文件类型
		if (fileSuffix != null) {
			response.setContentType(fileSuffix);
		}
		// 文件大小
		response.setContentLength((int)file.length());
		InputStream is = null;
		OutputStream os = null;
		try {
			// 对程序来说读入文件
			is = new FileInputStream(file);
			// 对程序来说输出文件
			os = response.getOutputStream();// 绑定输出流
			//3.2使用输入流和输出流
			IOUtils.copy(is, os);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//3.3关闭输入流和输出流
			closeIO(is, os);
		}
		
	}
	
	// 关闭IO流
	public static void closeIO(InputStream is, OutputStream os) {
		if (is != null) {
			try {
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		if (os != null) {
			try {
				os.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	
	public static void main(String[] args) {
		System.out.println(Arrays.toString(FILESUFFIXS).replace("[", "").replace("]", ""));
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
