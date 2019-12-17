<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/11
  Time: 8:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="shortcut icon" href="#" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/info.css">

    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" ></script>
    <script type="text/javascript">
        function ajaxf() {
            document.getElementById("tablehead").style.display="table-row";
            $.ajax({
                type: "post",
                dataType:"json",
                url: "${pageContext.request.contextPath}/InfomationServlet",
                success: function (data) {
                    var html = "";
                    for (var i=0;i<data.length;i++){
                        console.log(data[i].name+data[i].number);
                        html+="<tr>"+
                            "<td>"+data[i].number+"</td>"+
                            "<td>"+data[i].name+"</td>"+
                            "<td>"+data[i].cname+"</td>"+
                            "<td style='width: 200px'>"+data[i].introduce+"</td>"+
                            "</tr>";
                    }
                    $("#content").html(html);
                }
            });
        }
    </script>
</head>
<body>
<div class="navbar">
    <p>(>ω･* )ﾉ导航栏</p>
    <input type="button" class="info" id="btn" value="获取数据" onclick="ajaxf()"/>
</div>

    <table>
        <tr id="tablehead"><td>学号</td><td>姓名</td><td>昵称</td><td style='width: 400px'>简介</td></tr>
        <tbody id="content">
        </tbody>
    </table>

</body>
</html>
