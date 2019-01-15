package com.kb.eis.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kb.eis.pojo.KuCun;
import com.kb.eis.pojo.Pojo;
import com.kb.eis.service.KuCunService;
import com.kb.eis.service.impl.KuCunServiceImpl;


public class KuCunServlet extends BaseServlet {
	
	/**
	 * 更新库存数据
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void updateStock(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//获取表单数据
		String id = req.getParameter("id");
		String spName = req.getParameter("spName");
		String jc = req.getParameter("jc");
		String cd = req.getParameter("cd");
		String gg = req.getParameter("gg");
		String dw = req.getParameter("dw");
		double dj = Double.parseDouble(req.getParameter("dj"));
		double xsjg = Double.parseDouble(req.getParameter("xsjg"));
		String spId = req.getParameter("spId");
		int kcsl = Integer.parseInt(req.getParameter("kcsl"));
		KuCun kuCun = new KuCun(id, spName, jc, cd, gg, dw, dj, xsjg, spId, kcsl);
		//调用业务层完成库存信息更新
		int n = new KuCunServiceImpl().updateStock(kuCun);
		//页面跳转
		if(n>0) {
			resp.sendRedirect("../files/replacePage.html");
		}else {
			req.setAttribute("error", "库存信息修改更新失败！");
			req.getRequestDispatcher("/servlet/KuCunServlet?method=findStockById&id="+id).forward(req, resp);
		}
	}
	/**
	 * 商品入库
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void add(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//商品入库通过商品入库单编号来入库
		String rkid = req.getParameter("rkid");
		//调用业务层
		KuCunService kc = new KuCunServiceImpl();
		int rs = kc.add(rkid);
		//返回操作结果返回
		resp.sendRedirect(req.getContextPath()+"/servlet/KuCunServlet?method=queryAll");
	}
	
	protected void queryAll(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		KuCunService kc = new KuCunServiceImpl();
		List<KuCun> kcList = kc.queryAll();
		//返回操作结果返回
		req.setAttribute("kcList", kcList);
		req.getRequestDispatcher("/stock/stockquery.jsp").forward(req, resp);
	}
	
	/**
	 * 据库存编号查询库存
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void findStockById(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//获取库存编号
		String id = req.getParameter("id");
		//调用业务层查询库存
		KuCun kuCun = new KuCunServiceImpl().findStockById(id);
		
		//页面跳转
		req.setAttribute("kuCun", kuCun);
		req.getRequestDispatcher("/stock/updateStockPrice.jsp").forward(req, resp);
	}
}
