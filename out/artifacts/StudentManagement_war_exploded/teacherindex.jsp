<%@ page import="dao.StudentDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:useBean id="teacher" class="data.TeacherBean" scope="session"/>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   <%-- 在IE运行最新的渲染模式 --%>
    <meta name="viewport" content="width=device-width, initial-scale=1">   <%-- 初始化移动浏览显示 --%>
    <meta name="Author" content="Dreamer-1.">

    <!-- 引入各种CSS样式表 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">	<!-- 修改自Bootstrap官方Demon，你可以按自己的喜好制定CSS样式 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-change.css">	<!-- 将默认字体从宋体换成微软雅黑（个人比较喜欢微软雅黑，移动端和桌面端显示效果比较接近） -->

    <script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <%
        String name = teacher.getTname();
    %>

    <title>- 学生信息管理系统 -</title>
</head>

<body>
<!-- 顶部菜单（来自bootstrap官方Demon）==================================== -->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" >
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="teacherindex.jsp"><i class="fa fa-zhuye">&nbsp;主页</i></a>
        </div>

        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="login.jsp"><i class="fa fa-power-off"></i> 注销</a></li>
            </ul>

        </div>
    </div>
</nav>

<!-- 左侧菜单选项========================================= -->
<div class="container-fluid">
    <div class="row-fluie">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <!-- 一级菜单 -->
                <li class="active"><a href="#userMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
                    <i class="fa fa-user"></i>&nbsp; 个人信息 <span class="sr-only"></span></a>
                </li>
                <!-- 二级菜单 -->
                <!-- 注意一级菜单中<a>标签内的href="#……"里面的内容要与二级菜单中<ul>标签内的id="……"里面的内容一致 -->
                <ul id="userMeun" class="nav nav-list collapse menu-second">
                    <li><a href="###" onclick="showAtRight('${pageContext.request.contextPath}/teacher-infomation/teacherInfo.jsp')"><i class="fa fa-users"></i> 查看个人信息</a></li>
                </ul>

                <li><a href="#productMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
                    <i class="fa fa-cogs"></i>&nbsp; 学生信息管理 </a>
                </li>
                <ul id="productMeun" class="nav nav-list collapse menu-second">
                    <li><a href="###" onclick="showAtRight('${pageContext.request.contextPath}/teacher-infomation/onestudentgrade.jsp')"><i class="fa fa-cog"></i> 查看一个学生成绩</a></li>
                    <li><a href="###" onclick="showAtRight('${pageContext.request.contextPath}/teacher-infomation/allstudentgrade.jsp')"><i class="fa fa-cog"></i> 查看全部学生成绩</a></li>
                    <li><a href="###" onclick="showAtRight('${pageContext.request.contextPath}/teacher-infomation/addstudent.jsp')"><i class="fa fa-cog"></i> 添加学生账号</a></li>
                    <li><a href="###" onclick="showAtRight('${pageContext.request.contextPath}/teacher-infomation/deletestudent.jsp')"><i class="fa fa-cog"></i> 删除学生账号</a></li>
                    <li><a href="###" onclick="showAtRight('${pageContext.request.contextPath}/teacher-infomation/alterstudent.jsp')"><i class="fa fa-cog"></i> 修改学生信息</a></li>
                </ul>

                <li><a href="#idMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
                    <i class="fa fa-cogs"></i>&nbsp; 个人账号管理 </a>
                </li>
                <ul id="idMeun" class="nav nav-list collapse menu-second">
                    <li><a href="###" onclick="showAtRight('${pageContext.request.contextPath}/teacher-infomation/altertname.jsp')"><i class="fa fa-cog"></i> 修改名字</a></li>
                    <li><a href="###" onclick="showAtRight('${pageContext.request.contextPath}/teacher-infomation/alterphone.jsp')"><i class="fa fa-cog"></i> 修改电话</a></li>
                    <li><a href="###" onclick="showAtRight('${pageContext.request.contextPath}/teacher-infomation/alterpwd.jsp')"><i class="fa fa-cog"></i> 修改密码</a></li>
                </ul>

                <li><a href="login.jsp" class="nav-header menu-first collapsed">
                    <i class="fa fa-file-text"></i>&nbsp; 退出系统 </a>
                </li>

            </ul>

        </div>
    </div>
</div>

<!-- 右侧内容展示==================================================   -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h1 class="page-header"><i class="fa fa-cog fa-spin"></i>&nbsp;控制台<small>&nbsp;&nbsp;&nbsp;欢迎<%=name%>使用学生信息管理系统</small></h1>

    <!-- 载入左侧菜单指向的jsp（或html等）页面内容 -->
    <div id="content">
        <p>尊敬的用户您好！</p>
        <p>欢迎进入河南工业大学学生信息管理系统</p>
    </div>

</div>


<script type="text/javascript">

    /*
     * 对选中的标签激活active状态，对先前处于active状态但之后未被选中的标签取消active
     * （实现左侧菜单中的标签点击后变色的效果）
     */
    $(document).ready(function () {
        $('ul.nav > li').click(function (e) {
            //e.preventDefault();	加上这句则导航的<a>标签会失效
            $('ul.nav > li').removeClass('active');
            $(this).addClass('active');
        });
    });

    /*
     * 解决ajax返回的页面中含有javascript的办法：
     * 把xmlHttp.responseText中的脚本都抽取出来，不管AJAX加载的HTML包含多少个脚本块，我们对找出来的脚本块都调用eval方法执行它即可
     */
    function executeScript(html)
    {

        var reg = /<script[^>]*>([^\x00]+)$/i;
        //对整段HTML片段按<\/script>拆分
        var htmlBlock = html.split("<\/script>");
        for (var i in htmlBlock)
        {
            var blocks;//匹配正则表达式的内容数组，blocks[1]就是真正的一段脚本内容，因为前面reg定义我们用了括号进行了捕获分组
            if (blocks = htmlBlock[i].match(reg))
            {
                //清除可能存在的注释标记，对于注释结尾-->可以忽略处理，eval一样能正常工作
                var code = blocks[1].replace(/<!--/, '');
                try
                {
                    eval(code) //执行脚本
                }
                catch (e)
                {
                }
            }
        }
    }

    /*
     * 利用div实现左边点击右边显示的效果（以id="content"的div进行内容展示）
     * 注意：
     *   ①：js获取网页的地址，是根据当前网页来相对获取的，不会识别根目录；
     *   ②：如果右边加载的内容显示页里面有css，必须放在主页（即例中的index.jsp）才起作用
     *   （如果单纯的两个页面之间include，子页面的css和js在子页面是可以执行的。 主页面也可以调用子页面的js。但这时要考虑页面中js和渲染的先后顺序 ）
    */
    function showAtRight(url) {
        var xmlHttp;

        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlHttp=new XMLHttpRequest();	//创建 XMLHttpRequest对象
        }
        else {
            // code for IE6, IE5
            xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
        }

        xmlHttp.onreadystatechange=function() {
            //onreadystatechange — 当readystate变化时调用后面的方法

            if (xmlHttp.readyState == 4) {
                //xmlHttp.readyState == 4	——	finished downloading response

                if (xmlHttp.status == 200) {
                    //xmlHttp.status == 200		——	服务器反馈正常

                    document.getElementById("content").innerHTML=xmlHttp.responseText;	//重设页面中id="content"的div里的内容
                    executeScript(xmlHttp.responseText);	//执行从服务器返回的页面内容里包含的JavaScript函数
                }
                //错误状态处理
                else if (xmlHttp.status == 404){
                    alert("出错了☹   （错误代码：404 Not Found），……！");
                    /* 对404的处理 */
                    return;
                }
                else if (xmlHttp.status == 403) {
                    alert("出错了☹   （错误代码：403 Forbidden），……");
                    /* 对403的处理  */
                    return;
                }
                else {
                    alert("出错了☹   （错误代码：" + request.status + "），……");
                    /* 对出现了其他错误代码所示错误的处理   */
                    return;
                }
            }

        }

        //把请求发送到服务器上的指定文件（url指向的文件）进行处理
        xmlHttp.open("GET", url, true);		//true表示异步处理
        xmlHttp.send();
    }

</script>
<script type="text/javascript">
    function ajaxfindall() {
        $.ajax({
            type: "post",
            dataType:"json",
            url: "${pageContext.request.contextPath}/InfomationServlet",
            success: function (data) {
                var html = "<tr><td>学号</td><td>姓名</td><td>高数</td><td>java</td><td>os</td></tr>";
                for (var i=0;i<data.length;i++){
                    console.log(data[i].name+data[i].number);
                    html+="<tr>"+
                        "<td>"+data[i].number+"</td>"+
                        "<td>"+data[i].name+"</td>"+
                        "<td>"+data[i].math+"</td>"+
                        "<td>"+data[i].os+"</td>"+
                        "<td>"+data[i].java+"</td>"+
                        "</tr>";
                }
                $("#text").html(html);
            }
        });
    }

    function ajaxfindone() {
        var num = document.getElementById("osgt").value;
        if(num!=""){
            $.ajax({
                type: "post",
                dataType:"json",
                data:"num="+num,
                url: "${pageContext.request.contextPath}/InfomationServlet",
                success: function (data) {
                    var html = "<tr><td>学号</td><td>姓名</td><td>高数</td><td>java</td><td>os</td></tr>";
                    for (var i=0;i<data.length;i++){
                        console.log(data[i].name+data[i].number);
                        html+="<tr>"+
                            "<td>"+data[i].number+"</td>"+
                            "<td>"+data[i].name+"</td>"+
                            "<td>"+data[i].math+"</td>"+
                            "<td>"+data[i].os+"</td>"+
                            "<td>"+data[i].java+"</td>"+
                            "</tr>";
                    }
                    $("#text").html(html);
                }
            });
        }else {
            alert("学号输入不能为空！！！");
        }
    }

</script>
<%
    String flag = request.getParameter("flag");
    if (flag == null){
        flag="0";
    }
    if(flag.equals("1")){
%>
<script>
    alert("ヾ(๑╹◡╹)ﾉ\"修改完成！！！");
</script>
<%}else if (flag.equals("2")){%>
<script>
    alert("ヾ(๑╹◡╹)ﾉ\"电话修改完成！！！")
</script>
<%}else if (flag.equals("3")){%>
<script>
    alert("ヾ(๑╹◡╹)ﾉ\"密码修改完成！！！")
</script>
<%}else if (flag.equals("4")){%>
<script>
    alert("(╯﹏╰)b两次输入的密码不一致");
    showAtRight('${pageContext.request.contextPath}/teacher-infomation/alterpwd.jsp');
    var pwd= document.getElementById("sss");
    pwd.focus();
</script>
<%}else if (flag.equals("9")){%>
<script>
    alert("ヾ(๑╹◡╹)ﾉ\"添加完成！！！");
</script>
<%}else if (flag.equals("10")){%>
<script>
    alert("ヾ(๑╹◡╹)ﾉ\"修改完成！！！");
</script>
<%}%>
<%
    String delnum = request.getParameter("del");
    int k =0;
    if (delnum==null){delnum="";}
    else {
        StudentDAO.deleteStudentByID(delnum);
        k = 1;
    }
    if (k==1){
%>
<script>
    alert("删除成功！！！");
</script>

<% }%>





</body>
</html>