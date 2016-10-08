<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%><%@ 
	page contentType="text/html;charset=utf-8"%><%@
	page import="org.apache.commons.lang.StringUtils" %><%
/*	
	更新记录：
		2013-01-25 取消对SmartUpload的使用，改用commons-fileupload组件。因为测试发现SmartUpload有内存泄露的问题。
*/
//String path = request.getContextPath();
//String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String clientCookie = request.getHeader("Cookie");
%>
<html>
<head>
    <!--此页面实现Word图片自动批量上传的功能-->
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>WordPaster For eWebEditor9x</title>
    <link type="text/css" rel="Stylesheet" href="WordPaster/css/WordPaster.css" />
    <link type="text/css" rel="Stylesheet" href="WordPaster/js/skygqbox.css" />
    <script type="text/javascript" src="WordPaster/js/json2.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="WordPaster/js/jquery-1.4.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="WordPaster/js/WordPaster.js" charset="utf-8"></script>
    <script type="text/javascript" src="WordPaster/js/skygqbox.js" charset="utf-8"></script>
</head>
<body>
    <div style="font-size: medium; line-height: 130%;">
        <p>
            演示方法：
        </p>
        <ul style="list-style-type: decimal;">
            <li>打开Word文档，复制多张图片，在编辑器中按下 Ctrl + V 键，编辑器将自动上传所有图片。</li>
            <li>复制电脑中任意图片文件，然后点击编辑器中的粘贴图片按钮<img src="WordPaster/css/paster.png" width="16px" height="16px" />。</li>
            <li>通过QQ或其它软件截屏，复制图片，然后点击编辑器中的图片粘贴按钮<img src="WordPaster/css/paster.png" width="16px" height="16px" />。</li>
        </ul>
        <p>
            相关问题：
        </p>
        <ul style="list-style-type: decimal;">
            <li>下载exe安装程序可支持IE,Firefox,Chrome平台。<a target="_blank" href="http://yunpan.cn/lk/sVv4WAq9rSCec?sid=301"></a></li>
            <li>如果无法安装组件请下载进行安装<a target="_blank" href="http://yunpan.cn/lk/sV5IqqTYTmXXi">VC运行库</a></li>
            <li>如果有任何问题或建议请向我们<a target="_blank" href="http://www.ncmem.com/blog/guestbook.asp">反馈</a></li>
        </ul>
    </div>
    <!--创建FCKEditor控件-->
    <textarea name="content1" style="display:none"></textarea>
    <iframe id="eWebEditor1" src="ewebeditor.htm?id=content1&style=coolblue" frameborder="0" scrolling="no" width="600" height="350"></iframe>
    <script type="text/javascript">
        var pasterMgr = new WordPasterManager();
        pasterMgr.Config["PostUrl"] = "http://localhost:8080/WordPaster2EWebEditor9x/upload.jsp";
        pasterMgr.Config["Cookie"] = '<%=clientCookie%>';
        pasterMgr.Load();//加载控件

        function EWEBEDITOR_EVENT(ev)
        {
            if (ev.flag == "LoadComplete")
            {
                var editor = document.getElementById("eWebEditor1").contentWindow;
                pasterMgr.SetEditor(editor);
            }
        }
    </script>
</body>
</html>