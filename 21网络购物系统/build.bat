rem 请确保在此之前配置好jdk和tomcat环境

rem 请修改e:/tomcat4.1 为您的tomcat地址
set CLASSPATH=e:/tomcat4.1/common/lib/servlet.jar;%CLASSPATH%
rem 请修改e:/jdk1.4.1 为您的jdk地址
set PATH=E:/jdk1.4.1/bin;%PATH%
javac -d ..\WEB-INF\classes src/*.java   
