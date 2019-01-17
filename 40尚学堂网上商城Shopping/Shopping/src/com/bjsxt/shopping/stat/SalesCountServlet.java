package com.bjsxt.shopping.stat;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;

import com.bjsxt.shopping.util.PropertyMgr;

public class SalesCountServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ok");
		CategoryDataset dataset = getDataSet();
		String fileName = "SalesCount.jpg";
		JFreeChart chart = ChartFactory.createBarChart3D("产品销量图", // 图表标题
				"产品", // 目录轴的显示标签
				"销量", // 数值轴的显示标签
				dataset, // 数据集
				PlotOrientation.VERTICAL, // 图表方向：水平、垂直
				true, // 是否显示图例(对于简单的柱状图必须是false)
				false, // 是否生成工具
				false // 是否生成URL链接
				);

		FileOutputStream fos_jpg = null;
		try {

			fos_jpg = new FileOutputStream(
					PropertyMgr.getProperty("statImagePath") + fileName);
System.out.println(PropertyMgr.getProperty("statImagePath"));

			ChartUtilities.writeChartAsJPEG(fos_jpg, 0.5f, chart, 400, 300,
					null);
		} finally {
			try {
				fos_jpg.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		request.setAttribute("imgName", fileName);
		this.getServletContext().getRequestDispatcher("/admin/SalesCount.jsp")
				.forward(request, response);

	}

	private CategoryDataset getDataSet() {
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		List<ProductStatItem> items = StatService.getProductsBySaleCount();
		for (int i = 0; i < items.size(); i++) {
			ProductStatItem p = items.get(i);
			dataset.addValue(p.getTotalSalesCount(), "销量", p.getProductName());
		}
		return dataset;
	}

}
