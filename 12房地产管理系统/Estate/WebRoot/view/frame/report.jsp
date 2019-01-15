<%@ page language="java" contentType="text/html; charset=GBK"%>  
<%@ page import = "javax.servlet.*" %>
<%@ page import="com.javareport.beans.*"%>  
<%@ page extends="com.javareport.http.WebReportEngine"%>  
<%!  
    public Report createReport(HttpServletRequest request) throws Exception{  
        //图片类型数组  
        int[] chartType = new int[]{  
         Chart.CHART_PIE3D//Chart.CHART_STACKBAR3D,  
        // Chart.CHART_CURVE,Chart.CHART_LINE,  
         //Chart.CHART_POINT,Chart.CHART_INVERTED_CURVE,  
        // Chart.CHART_INVERTED_LINE,Chart.CHART_INVERTED_STACKBAR  
        };  
        //单元数据的显示标签字符数组  
        String[] labels = new String[]{"三室一厅", "三室两厅", "两室一厅", "四室两厅"};  
        //实例化报表对象  
        Report report = new Report();  
        //在页眉中添加文本信息内容  
        report.addHeaderText("恒大集团房屋类型销量报表");  
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
                report.addText("报表中常见的报表统计图表（"+i+"）： ");  
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
    public Double[][] getData(HttpServletRequest request){  
        Double[][] data = new Double[1][4];  
        data[0][0] = new Double(50);  
        data[0][1] = new Double(50);  
        data[0][2] = new Double(35);  
        data[0][3] = new Double(55);  
        return data;  
    }  
  
    //定制Web报表在页面首部显示的工具栏为标准的样式，增加一个“返回”按钮，返回到首页  
   /*  public String getToolbarScript(HttpServletRequest request){  
        return "<a href=\"webChart.jsp\"><img src=\""+request.getRequestURI()+  
                "?op=Resource&name=/resource/back.gif\" border=\"0\" alt=\"返回\"></a>";  
    }   */
%> 