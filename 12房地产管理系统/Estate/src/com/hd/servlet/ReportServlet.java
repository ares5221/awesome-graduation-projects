/**
 * @author Administrator
 * @date 2017年8月14日
 */
package com.hd.servlet;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.hd.entity.HouseType;
import com.hd.service.HouseInfoService;
import com.hd.service.impl.HouseInfoServiceImpl;
import com.javareport.beans.Chart;
import com.javareport.beans.Report;
import com.javareport.http.WebReportEngine;

/**
 * @author Administrator
 *
 */
public class ReportServlet extends WebReportEngine {
	HouseInfoService his = new HouseInfoServiceImpl();
	List<Integer> intList;
	int sum = 0;
	public Report createReport(HttpServletRequest request) throws Exception{  
        //图片类型数组  
		sum=0;
        int[] chartType = new int[]{  
         Chart.CHART_PIE3D//Chart.CHART_STACKBAR3D,  
        // Chart.CHART_CURVE,Chart.CHART_LINE,  
         //Chart.CHART_POINT,Chart.CHART_INVERTED_CURVE,  
        // Chart.CHART_INVERTED_LINE,Chart.CHART_INVERTED_STACKBAR  
        };  
        //单元数据的显示标签字符数组  ,数据库读取所有房屋信息
        
        // select one.*,h.type_name,h.is_used from (select type_id,count(1) num from house_info group by type_id) one join house_type h on (one.type_id=h.type_id);
       
        List<HouseType> list = his.findHouseNum();
       
        List<String> strList = new ArrayList<String>();
         intList= new ArrayList<Integer>();
        for(int i = 0;i<list.size();i++){
        	strList.add(list.get(i).getType_name());
        	intList.add(list.get(i).getNum());
        	
        	sum+=list.get(i).getNum();
        }
        String[] labels = new String[strList.size()];
        
        for(int i = 0;i<strList.size();i++){
        	
        	labels[i] = strList.get(i);
        }
        
        //String[] labels = new String[]{"三室一厅", "三室两厅", "两室一厅", "四室两厅"};  
        //实例化报表对象  
        Report report = new Report();  
        //在页眉中添加文本信息内容  
        report.addHeaderText("恒大集团房屋类型报表");  
        //在报表表的页眉添加一条横线  
        report.addHeaderSeparator(1);  
        //在页尾添加一条直线  
        report.addFooterSeparator(1);  
        //在页尾添加文本信息内容  
        //report.addFooterText("第{P}页， 共{N}页");  
        //循环输出各种类型的图片  
        for(int i=0;i<chartType.length;i++){  
            try{  
                //实例化一个图表对象  
                Chart chart = new Chart((Number[][])getData(request));  
                //设置图表中的单元数据的显示的标签  
                chart.setLabels(labels);  
                //设置统计图的类型  
                chart.setStyle(chartType[i]);  
                //设置统计图中显示的时候把具体的数值也显示出来  
                chart.setShowValue(true);  
                //在报表中添加文本信息内容  
                report.addText("恒大集团持有房屋类型比例图： ");  
                //在报表中添加图表信息内容  
                report.addChart(chart);  
                //在报表中添加换行符号  
                report.addBreak();  
                report.addBreak();  
                report.addBreak();  
            }  
            catch(Exception e){  
                e.printStackTrace();  
            }  
        }  
        return report;  
    }  
  
  //读者可根据需要设置数组的值，或从数据库中取出值放入数组中以动态显示数据  
	//数据库读取所有房屋的销量
   public Double[][] getData(HttpServletRequest request){
        Double[][] data = new Double[1][intList.size()];  
      
        for(int i = 0;i<intList.size();i++){
        	
        	  double d = new Double(intList.get(i)*100.0d/sum);  
        	//保留两位小数
        	 BigDecimal   b   =   new   BigDecimal(d);  
        	 data[0][i]=   b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue(); 
        }
        
       
       
        return data;  
   }    

}


