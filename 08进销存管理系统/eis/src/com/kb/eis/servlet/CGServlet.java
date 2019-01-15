package com.kb.eis.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kb.eis.pojo.CG;
import com.kb.eis.pojo.Pojo;
import com.kb.eis.service.CGService;
import com.kb.eis.service.SPService;
import com.kb.eis.service.impl.CGServiceImpl;
import com.kb.eis.service.impl.SPServiceImpl;

public class CGServlet extends BaseServlet {

	/**
	 * 根据采购编号查询采购表，商品表，供应商表
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void showById(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 获取采购编号
		String id = req.getParameter("id");
		// 调用业务层查询信息
		List<Pojo> pojo = new CGServiceImpl().findById(id);

		// 返回信息
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String jsonStr = gson.toJson(pojo);
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println(jsonStr);
		out.flush();
		out.close();
	}

	/**
	 * 查询采购表，商品表和供应商表的信息
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void showAll(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 调用业务层查询信息
		List<Pojo> pjList = new CGServiceImpl().findAll();
		// 返回信息
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String jsonStr = gson.toJson(pjList);

		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println(jsonStr);
		out.flush();
		out.close();
	}

	// 查询所有采购单
	protected void queryAll(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 获取所有采购信息
		List<Pojo> cgList = new CGServiceImpl().findAllCG();
		// 页面跳转
		req.setAttribute("cgList", cgList);
		req.getRequestDispatcher("/cg/caigou-list.jsp").forward(req, resp);
	}

	protected void addCG(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String spid = req.getParameter("sp");
		String dj = req.getParameter("dj");
		String sl = req.getParameter("sl");
		String je = req.getParameter("je");
		String memo = req.getParameter("memo");
		Date cgDate = null;
		CG cg = new CG(spid, dj, sl, je, cgDate, memo);
		CGService cs = new CGServiceImpl();
		int n = cs.add(cg);

		req.getRequestDispatcher("/cg/replace.html").forward(req, resp);

	}

	protected void toAdd(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 获取所有商品信息
		SPService sps = new SPServiceImpl();
		List<Pojo> polist = sps.showAll();

		// 页面跳转
		req.setAttribute("polist", polist);
		req.getRequestDispatcher("/cg/addcaigou.jsp").forward(req, resp);
	}

	// 根据商品号，查询商品厂商
	protected void findCSById(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 获取商品号
		String sspid = req.getParameter("sp");

		// 获取所有商品信息
		SPService sps = new SPServiceImpl();
		List<Pojo> polist = sps.showAll();
		Map<String, String> map = new HashMap<String, String>();
		for (Pojo pojo : polist) {
			String key = pojo.getSpInfo().getSpId();
			String value = pojo.getSpInfo().getCs();
			map.put(key, value);
		}
		String content = map.get(sspid);
		// System.out.println(map);
		// 返回数据
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(content);
		out.flush();
		out.close();

	}

	// 查询采购单编号，进行采购单修改
	protected void queryId(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 获取采购编号
		String id = req.getParameter("id");
		CGService cs = new CGServiceImpl();
		CG cg = cs.queryByID(id);

		// 调用业务层查询信息
		List<Pojo> pojo = new CGServiceImpl().findById(id);
		for (Pojo pojo2 : pojo) {
			req.setAttribute("pojo2", pojo2);
		}

		req.setAttribute("cg", cg);
		req.getRequestDispatcher("/cg/updatecaigou.jsp").forward(req, resp);
	}

	// 修改采购单
	protected void updateCG(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String id = req.getParameter("id");
		String dj = req.getParameter("dj");
		String sl = req.getParameter("sl");
		String je = req.getParameter("je");
		String memo = req.getParameter("memo");
		String spid = null;
		Date cgDate = Date.valueOf("1999-09-09");

		CG cg = new CG(id, spid, dj, sl, je, cgDate, memo);

		CGService cs = new CGServiceImpl();
		int n = cs.update(cg);

		req.getRequestDispatcher("/cg/replace.html").forward(req, resp);
	}

	/**
	 * 已处理的采购单
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void queryiscg(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 获取所有采购信息
		List<Pojo> cgList = new CGServiceImpl().findIsCG();
		// 页面跳转
		req.setAttribute("cgList", cgList);
		req.getRequestDispatcher("/cg/iscaigou-list.jsp").forward(req, resp);
	}
}
