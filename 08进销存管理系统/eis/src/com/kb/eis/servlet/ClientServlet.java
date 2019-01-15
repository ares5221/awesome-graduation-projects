package com.kb.eis.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kb.eis.pojo.KhInfo;
import com.kb.eis.service.ClientService;
import com.kb.eis.service.impl.ClientServiceImpl;
import com.kb.eis.util.PageBean;

public class ClientServlet extends BaseServlet {
	/**
	 * 添加客户
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	private ClientService cs = new ClientServiceImpl();

	protected void add(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String khname = req.getParameter("khname");
		String jian = req.getParameter("jian");
		String address = req.getParameter("address");
		String bianma = req.getParameter("bianma");
		String tel = req.getParameter("tel");
		String fax = req.getParameter("fax");
		String lian = req.getParameter("lian");
		String ltel = req.getParameter("ltel");
		String mail = req.getParameter("mail");
		String yinhang = req.getParameter("yinhang");
		String hao = req.getParameter("hao");
		KhInfo kh = new KhInfo(khname, jian, address, bianma, tel, fax, lian, ltel, mail, yinhang, hao);
		int rs = cs.add(kh);
		if(rs>0){
			req.getRequestDispatcher("/client/replace.html").forward(req, resp);
		}else{
			req.setAttribute("error", "添加失败！");
			req.getRequestDispatcher("/client/client-add.jsp").forward(req, resp);
		}
	}

	/**
	 * 更新信息
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void update(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String khname = req.getParameter("khname");
		int khid = Integer.parseInt(req.getParameter("khid"));
		String jian = req.getParameter("jian");
		String address = req.getParameter("address");
		String bianma = req.getParameter("bianma");
		String tel = req.getParameter("tel");
		String fax = req.getParameter("fax");
		String lian = req.getParameter("lian");
		String ltel = req.getParameter("ltel");
		String mail = req.getParameter("email");
		String yinhang = req.getParameter("yinhang");
		String hao = req.getParameter("hao");
		KhInfo kh = new KhInfo(khname, jian, address, bianma, tel, fax, lian, ltel, mail, yinhang, hao);
		kh.setKhid(khid);
		int rs = cs.update(kh);
		if(rs>0){
			req.getRequestDispatcher("/client/replace.html").forward(req, resp);
		}else{
			req.setAttribute("error", "修改失败！");
			req.getRequestDispatcher("/client/client-add.jsp").forward(req, resp);
		}
	}
	/**
	 * 预修改客户信息
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void toupdate(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String khid = req.getParameter("id");
		int id = Integer.parseInt(khid);
		KhInfo kh = cs.toupdate(id);
		req.setAttribute("kh", kh);
		req.getRequestDispatcher("/client/client-update.jsp").forward(req, resp);
	}

	/**
	 * 根据ID删除客户
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void delete(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		int khid = Integer.parseInt(req.getParameter("id"));
		cs.delete(khid);
		resp.setContentType("text/html;charset=utf-8");
		resp.getWriter().print("1");
	}
	
	/**
	 * 批量删除
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void deletes(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String[] idarr = req.getParameterValues("idarr");
		int rs = cs.deletes(idarr);
		resp.sendRedirect(req.getContextPath()+"/servlet/ClientServlet?method=show");
	}

	/**
	 * 多条件分页查询显示
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void show(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<KhInfo> khList = cs.show();
		req.setAttribute("khList", khList);
		req.getRequestDispatcher("/client/client-list.jsp").forward(req, resp);
	}
}
