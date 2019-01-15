package com.kb.eis.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.kb.eis.pojo.GYS;
import com.kb.eis.service.GYSService;
import com.kb.eis.service.impl.GYSServiceImpl;

public class GYSServlet extends BaseServlet {

	// 点击左侧供应商信息，先查询所有的方法
	protected void query(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		GYSService gyss = new GYSServiceImpl();
		List<GYS> list = gyss.query();
		req.setAttribute("list", list);
		req.getRequestDispatcher("/cg/gys-list.jsp").forward(req, resp);
	}

	/**
	 * 添加供应商信息
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void add(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//获取数据
		String name = req.getParameter("name");
		String jc = req.getParameter("jc");
		String bianMa = req.getParameter("bianMa");
		String address = req.getParameter("address");
		String tel = req.getParameter("tel");
		String lian = req.getParameter("lian");
		String ltel = req.getParameter("ltel");
		String yh = req.getParameter("yh");
		String mail = req.getParameter("mail");
		GYS gys = new GYS(name, jc, address, bianMa, tel, lian, ltel, yh, mail);
		
		//调用业务层
		GYSService gysService = new GYSServiceImpl();
		int i = gysService.add(gys);
		
		//页面跳转
		if (i>0) {
			req.getRequestDispatcher("/cg/replace.html").forward(req, resp);
		} else {
			req.getRequestDispatcher("/").forward(req, resp);
		}
	}
	
	//
	protected void queryByName(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String gysname = req.getParameter("name");
		if(gysname==null){
			gysname="";
		}
		
		GYSService gyss = new GYSServiceImpl();
		List<GYS> list = gyss.queryByName(gysname);
		req.setAttribute("list", list);
		req.getRequestDispatcher("/cg/gys-list.jsp").forward(req, resp);
	}

	//删除供应商信息
	protected void deleteByID(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.getRequestDispatcher("/cg/gys-list.jsp").forward(req, resp);
	}
	
	//修改供应商信息
	protected void update(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String gyid = req.getParameter("gyid");
		String name = req.getParameter("name");
		String jc = req.getParameter("jc");
		String bianMa = req.getParameter("bianMa");
		String address = req.getParameter("address");
		String tel = req.getParameter("tel");
		String lian = req.getParameter("lian");
		String ltel = req.getParameter("ltel");
		String yh = req.getParameter("yh");
		String mail = req.getParameter("mail");
		GYS gys = new GYS(gyid, name, jc, address, bianMa, tel, lian, ltel, yh, mail);
		
		GYSService gyss = new GYSServiceImpl();
		int n = gyss.update(gys);
		
		req.setAttribute("gys", gys);
		//resp.sendRedirect(req.getContextPath()+"/files/replacePage.html");
		req.getRequestDispatcher("/cg/replace.html").forward(req, resp);
	}
	
	//修改供应商信息2
//	protected void update2(HttpServletRequest req, HttpServletResponse resp)
//			throws ServletException, IOException {
//		String gyid = req.getParameter("gyid");
//		String name = req.getParameter("name");
//		String jc = req.getParameter("jc");
//		String bianMa = req.getParameter("bianMa");
//		String address = req.getParameter("address");
//		String tel = req.getParameter("tel");
//		String lian = req.getParameter("lian");
//		String ltel = req.getParameter("ltel");
//		String yh = req.getParameter("yh");
//		String mail = req.getParameter("mail");
//		GYS gys = new GYS(gyid, name, jc, address, bianMa, tel, lian, ltel, yh, mail);
//		
//		GYSService gyss = new GYSServiceImpl();
//		int n = gyss.update(gys);
//		if(n>0){
//			resp.setContentType("text/html;charset=utf-8");
//			PrintWriter pw = resp.getWriter();
//			pw.println("<script type='text/javascript'>"
//					+"alert('更新成功');"
//					+"window.close();"
//					+"window.opener.location.reload();"
//					+"</script>");
//			pw.flush();
//			pw.close();
//		}
//		
//	}
	
	//根据ID查询供应商信息
	protected void queryByID(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String gyid = req.getParameter("gyid");
		GYSService gyss = new GYSServiceImpl();
		GYS gys = gyss.queryByID(gyid);
		req.setAttribute("gys", gys);
		req.getRequestDispatcher("/cg/updategys.jsp").forward(req, resp);
	}
	
	//根据ID查询供应商信息2（AJAX）
		protected void queryByID2(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
			String gyid = req.getParameter("gyid");
			GYSService gyss = new GYSServiceImpl();
			GYS gys = gyss.queryByID(gyid);
			
			resp.setContentType("text/html;charset=utf-8");
			Gson gson = new Gson();
			String strgys = gson.toJson(gys);
			
			PrintWriter pw = resp.getWriter();
//			StringBuffer strgys = new StringBuffer("{"); 
//			strgys.append("\"gyid\":"+gys.getGyid()+",");
//			strgys.append("\"name\":\""+gys.getName()+"\",");
//			strgys.append("\"jc\":\""+gys.getJc()+"\",");
//			strgys.append("\"bianMa\":\""+gys.getBianMa()+"\",");
//			strgys.append("\"address\":\""+gys.getAddress()+"\",");
//			strgys.append("\"tel\":\""+gys.getTel()+"\",");
//			strgys.append("\"lian\":\""+gys.getLian()+"\",");
//			strgys.append("\"ltel\":\""+gys.getLtel()+"\",");
//			strgys.append("\"yh\":\""+gys.getYh()+"\",");
//			strgys.append("\"mail\":\""+gys.getMail()+"\"");
//			pw.print(strgys.toString());
			pw.print(strgys);
			pw.flush();
			pw.close();
			
		}

}
