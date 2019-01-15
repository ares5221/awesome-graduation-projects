package com.kb.eis.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kb.eis.pojo.GYS;
import com.kb.eis.pojo.KhInfo;
import com.kb.eis.pojo.KuCun;
import com.kb.eis.pojo.Pojo;
import com.kb.eis.pojo.SPInfo;
import com.kb.eis.pojo.Sell;
import com.kb.eis.service.ClientService;
import com.kb.eis.service.GYSService;
import com.kb.eis.service.KuCunService;
import com.kb.eis.service.SPService;
import com.kb.eis.service.impl.ClientServiceImpl;
import com.kb.eis.service.impl.GYSServiceImpl;
import com.kb.eis.service.impl.KuCunServiceImpl;
import com.kb.eis.service.impl.SPServiceImpl;

public class SPServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	/**
	 * 清零
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void qs(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String id = req.getParameter("id");
		int rs = new SPServiceImpl().qs(id);
		req.getRequestDispatcher("/servlet/SPServlet?method=querySalesRecord").forward(req, resp);
	}
	/**
	 * 销售记录查询
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void querySalesRecord(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//调用业务层完成销售记录查询
		List<Sell> sellList = new SPServiceImpl().querySalesRecord();
		//页面跳转
		req.setAttribute("sellList", sellList);
		req.getRequestDispatcher("/product/querySalesRecord.jsp").forward(req, resp);
	}
	
	/**
	 * 添加销售记录
	 */
	protected void doSale(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//获取表单数据
		
		double xsje = Double.parseDouble(req.getParameter("xsje"));
		double ysje = Double.parseDouble(req.getParameter("ysje"));
		String khname = req.getParameter("khname");
		String czy = req.getParameter("czy");
		String jsr = req.getParameter("jsr");
		String jsfs = req.getParameter("jsfs");
		String spName = req.getParameter("spName");
		double xsdj = Double.parseDouble(req.getParameter("xsdj"));
		int xssl = Integer.parseInt(req.getParameter("xssl"));
		double wsje = Double.parseDouble(req.getParameter("wsje"));
		Sell sell = new Sell(xsje, ysje, khname, czy, jsr, jsfs,spName, xsdj, xssl, wsje);
		//获取库存id和库存数量，以便在商品销售后修改库存
		String kcid = req.getParameter("kcid");
		int kcsl1 = Integer.parseInt(req.getParameter("kcsl"));
		int kcsl = kcsl1 - xssl;
		
		//调用业务层完成销售
		int n = new SPServiceImpl().updateSell(sell);
		if(n>0) {
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.println("商品销售成功！");
			out.flush();
			out.close();
		} else {
			req.setAttribute("error", "商品未销售！");
			resp.sendRedirect(req.getContextPath()+"/product/queryInfo.jsp");
		}
		
		int i = new KuCunServiceImpl().updateSl(kcid,kcsl);
	
	}
	
	/**
	 * 查询客户信息
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void findAllClient(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//查询客户表
		ClientService clientService = new ClientServiceImpl();
		List<KhInfo> client = clientService.findAllClient();
		//返回信息
		Gson gson = new Gson();
		String jsonStr = gson.toJson(client);
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println(jsonStr);
		out.flush();
		out.close();
		
	}
	/**
	 * 按库存编号查询要销售的商品
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void findReadyGoodsById(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//获取库存编号
		String id = req.getParameter("id");
		//调用业务层完成查询工作
		KuCun kuCun = new KuCunServiceImpl().findStockById(id);
	
		//返回信息
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String jsonStr = gson.toJson(kuCun);
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println(jsonStr);
		out.flush();
		out.close();
	}
	/**
	 * 查询预销售商品信息
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void queryInfo(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<KuCun> kcList = new KuCunServiceImpl().queryAll();
		req.setAttribute("kcList", kcList);
		req.getRequestDispatcher("/product/queryInfo.jsp").forward(req, resp);
	}
	
	protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//
		String spId = req.getParameter("spId");
		//
		SPService spService = new SPServiceImpl();
		spService.delete(spId);
		//
		resp.setContentType("text/html;charset=utf-8");
		
	}
	
	/**
	 * 通过id查询商品
	 * 
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void showById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//
		String spId = req.getParameter("spId");
		//
		SPService spService = new SPServiceImpl();
		SPInfo sp = spService.queryById(spId);
		//
		req.setAttribute("sp", sp);
		req.getRequestDispatcher("/servlet/SPServlet?method=toUpdate").forward(req, resp);
	}
	
	/**
	 * 预添加操作    需要得到供应商名称
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void toAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//调用业务层得到供应商信息
		GYSService gysService = new GYSServiceImpl();
		List<GYS> gysList = gysService.query();
		
		//页面跳转
		req.setAttribute("gysList", gysList);
		req.getRequestDispatcher("/product/product-add.jsp").forward(req, resp);
	}
	/**
	 * 预添加修改
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void toUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//调用业务层得到供应商信息
		GYSService gysService = new GYSServiceImpl();
		List<GYS> gysList = gysService.query();
		
		//页面跳转
		req.setAttribute("gysList", gysList);
		req.getRequestDispatcher("/product/product-toUpdate.jsp").forward(req, resp);
	}
	/**
	 * 查询所有
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void showAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//调用业务层层
		SPService spService = new SPServiceImpl();
		List<Pojo> pojoList = spService.showAll();
		
		//页面跳转
		req.setAttribute("pojoList", pojoList);
		req.getRequestDispatcher("/product/product-list1.jsp").forward(req, resp);
	}
	/**
	 * 添加商品
	 * @param req
	 * @param resp
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//获取商品属性
		String spName = req.getParameter("spName");
		String jc = req.getParameter("jc");
		String cd = req.getParameter("cd");
		String dw = req.getParameter("dw");
		String gg = req.getParameter("gg");
		String ph = req.getParameter("ph");
		String memo = req.getParameter("memo");
		String gysId = req.getParameter("gyId");
		String bz = req.getParameter("bz");
		String cs = req.getParameter("cs");
		SPInfo spInfo = new SPInfo(spName, jc, cd, dw, gg, ph, memo, gysId, bz, cs);
		
		//调用业务层
		SPService spService = new SPServiceImpl();
		int i = spService.add(spInfo);
		
		//页面跳转
		if (i>0) {
			req.getRequestDispatcher("/files/replacePage.html").forward(req, resp);
		}
	}
	protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//获取需要修改的商品id
		String spId = req.getParameter("spId");
		String spName = req.getParameter("spName");
		String jc = req.getParameter("jc");
		String cd = req.getParameter("cd");
		String dw = req.getParameter("dw");
		String gg = req.getParameter("gg");
		String ph = req.getParameter("ph");
		String memo = req.getParameter("memo");
		String gysId = req.getParameter("gyId");
		String bz = req.getParameter("bz");
		String cs = req.getParameter("cs");
		SPInfo spInfo = new SPInfo(spId, spName, jc, cd, dw, gg, ph, memo, gysId, bz, cs);
		//调用业务层
		SPService spService = new SPServiceImpl();
		int i = spService.update(spInfo);
		//
		if (i>0) {
			req.getRequestDispatcher("/files/replacePage.html").forward(req, resp);
		}
	}
}
