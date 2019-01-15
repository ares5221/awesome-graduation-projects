package com.kb.eis.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kb.eis.pojo.RuKu;
import com.kb.eis.pojo.Pojo;
import com.kb.eis.service.impl.RKServiceImpl;

public class RKServlet extends BaseServlet {
	
	protected void toShow(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//调用底层获取所有数据
		List<Pojo> rkList = new RKServiceImpl().show();
		//返回页面
		req.setAttribute("rkList", rkList);
		req.getRequestDispatcher("/stock/inbound.jsp").forward(req, resp);
	}
	

	/**
	 * 商品入库(添加入库商品信息到入库主表)
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void toInbound(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//获取表单数据
		String cgid = req.getParameter("id");
		String spid = req.getParameter("spid");
		double wf = Double.parseDouble(req.getParameter("wf"));
		double sf = Double.parseDouble(req.getParameter("sf"));
		String jsfs = req.getParameter("jsfs");
		//Date rkdate = Date.valueOf(req.getParameter("rkdate"));
		String czy = req.getParameter("czy");
		String jsr = req.getParameter("jsr");
		String gysname = req.getParameter("gysname");
		RuKu ruKu = new RuKu(cgid, spid, wf, sf, jsfs, czy, jsr, gysname);
		
		//调用业务层完成数据增加到入库主表
		int n = new RKServiceImpl().addRuKuInfo(ruKu);
		//页面跳转
		if(n>0) {
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.println("商品入库添加成功！");
			out.flush();
			out.close();
		} else {
			req.setAttribute("error", "入库信息录入失败！");
			resp.sendRedirect(req.getContextPath()+"/servlet/CGServlet?method=showAll");
		}
	}
	

	/**
	 * 显示所有已提交的记录
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void queryRecord(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//调用底层查询所有入库完毕的记录
		List<Pojo> rkList = new RKServiceImpl().queryRecord();
		req.setAttribute("rkList", rkList);
		req.getRequestDispatcher("/stock/inboundquery.jsp").forward(req, resp);
	}

	/**
	 * 删除已提交的记录
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void delete1(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String rkid = req.getParameter("rkid");
		//调用底层删除
		new RKServiceImpl().delete(rkid);
		resp.sendRedirect(req.getContextPath()+"/servlet/RKServlet?method=queryRecord");
	}
}
