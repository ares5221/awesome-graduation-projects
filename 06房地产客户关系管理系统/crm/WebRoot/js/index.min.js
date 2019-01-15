/**
 * Created by xinliwei on 2016-01-21 0021.
 */
//计算月还款本息的工具对象
var loanTool = {
    /**
     * 计算并返回月还款本息的方法
     * @param loanAmount            贷款本金(也就是贷了多少款，比如，70万)
     * @param months                还款月数(也就是贷款周期，如20年，则此处为240个月)
     * @param annualInterestRate    年利率(比如，6.55%，则此处传入为6.55,应除以100以后转为0.0665再进行计算)
     */
    getPaymetnsPerMonth: function (loanAmount, months, annualInterestRate) {
        // 等额本息还款法计算公式：
        // -- 月还款本息=〔贷款本金×月利率×（1＋月利率）＾还款月数〕÷〔（1＋月利率）＾还款月数－1〕
        // -- 月利率=年利率÷12=0.0665÷12=0.005541667
        // -- 其中＾符号表示乘方
        var rateOfMonth = annualInterestRate / (12 * 100);
        // 将计算所得的月还款金额(本息)返回
        return (loanAmount * rateOfMonth * Math.pow((1 + rateOfMonth), months)) / (Math.pow((1 + rateOfMonth), months) - 1);
    }
};
//选项卡切换
$(function () {
    $("#tabs .title").find("li").each(function (index) {
        $(this).on("click", function () {
            $(this).siblings().find("a").removeClass("current");
            $(this).find("a").addClass("current");

            $("#content>div").eq(index).fadeIn().siblings().stop().hide();
        });
    });

    //计算方式
    $("#way input[type=radio]").on("change", function () {
        $(this).parents("dt").next().slideDown().siblings("dd").slideUp();
    });

    // 贷款利率----------------------------------------------------------------
    var loanRate = [
        ["6.80", "6.55", "6.15", "5.90"],
        ["4.70", "4.50", "4.25", "4.00"]
    ];

    function Interest() {
        var row = $("#myform input[name=dktype]:checked").val();
        var col = $("#myform select[name=dkll]").val();
        $("#myform input[name=dkll]").val(loanRate[row][col]);
    }

    Interest();
    $("#myform input[name=dktype]").on("change", function () {
        Interest();
    });
    $("#myform select[name=dkll]").on("change", function () {
        Interest();
    });
    /**
     *
     */
    $("#myform input[name=jsfs]").on("change", function () {
        $(this).parent().next().slideDown();
        $(this).parent().siblings("dt").next().hide();
    });

    $("#myform input[name=startCalc]").on("click", function () {
        var calcMode = $("#myform input[name=jsfs]:checked").val();

        switch (calcMode) {
            case "0":

                showLoanInfo(calcByAreaAndPrice());
                break;
            case "1":
                showLoanInfo(calcByLoanTotal());
                break;
        }
    });
    function calcByAreaAndPrice() {
        var loanInfo = {};

        var houseMoneyTotal = parseFloat($("#myform input[name=price]").val()) * parseFloat($("#myform input[name=area]").val());

        loanInfo.houseMoneyTotal = houseMoneyTotal;

        var ajcs = $("#myform select[name=ajcs]").val();
        var loanTotal = houseMoneyTotal * (parseInt(ajcs) / 100);
        loanInfo.loanTotal = loanTotal;
        loanInfo.initialPayment = houseMoneyTotal - loanTotal;

        var repaymentMonths = $("#myform select[name=ajns]").val();
        loanInfo.repaymentMonths = repaymentMonths;

        var interestRate = $("#myform input[name=dkll]").val();
        var repaymentPerMonth = loanTool.getPaymetnsPerMonth(loanTotal, repaymentMonths, interestRate);
        loanInfo.repaymentPerMonth = repaymentPerMonth;

        loanInfo.repaymentTotal = repaymentPerMonth * repaymentMonths;

        loanInfo.interestTotal = loanInfo.repaymentTotal - loanInfo.loanTotal;

        return loanInfo;
    }

    // 根据贷款总额计算贷款数据
    function calcByLoanTotal() {
        var loanInfo = {};

        // 计算房款总额：略
        loanInfo.houseMoneyTotal = "略";

        // 计算贷款总额
        var loanTotal = parseFloat($("#myform input[name=dkze]").val());
        loanInfo.loanTotal = loanTotal;

        // 计算首期付款：无
        loanInfo.initialPayment = 0;

        // 计算贷款月数：
        var repaymentMonths = $("#myform select[name=ajns]").val();
        loanInfo.repaymentMonths = repaymentMonths;

        // 计算月均还款额
        var interestRate = $("#myform input[name=dkll]").val();
        var repaymentPerMonth = loanTool.getPaymetnsPerMonth(loanTotal, repaymentMonths, interestRate);
        loanInfo.repaymentPerMonth = repaymentPerMonth;

        // 计算还款总额：月均还款额 * 贷款月数
        loanInfo.repaymentTotal = repaymentPerMonth * repaymentMonths;

        // 计算支付利息：还款总额 - 贷款总额
        loanInfo.interestTotal = loanInfo.repaymentTotal - loanInfo.loanTotal;

        return loanInfo;
    }

    // 显示最终贷款信息
    function showLoanInfo(loanInfo) {
        $("#myform input[name=fousex]").val(loanInfo.houseMoneyTotal)
        $("#myform input[name=loan]").val(loanInfo.loanTotal.toFixed(2))
        $("#myform input[name=refund]").val(loanInfo.repaymentTotal.toFixed(2))
        $("#myform input[name=pay]").val(loanInfo.interestTotal.toFixed(2))
        $("#myform input[name=first]").val(loanInfo.initialPayment.toFixed(2))
        $("#myform input[name=month]").val(loanInfo.repaymentMonths)
        $("#myform input[name=average]").val(loanInfo.repaymentPerMonth.toFixed(2))
    }
});