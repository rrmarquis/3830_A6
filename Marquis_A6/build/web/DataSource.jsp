<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
    <head>
        <title>DB Example</title>
    </head>
    <body>
        <h1>DB Example</h1>

        <sql:setDataSource var="db" 
                           url="jdbc:derby://localhost:1527/sample;user=app;password=app"
                           user="app"  password="app"/>

        <table width="100%" border="1">
            <tr align="left">
                <th>Customer Num</th><th>Name</th><th>email</th>
            </tr>

            <sql:query dataSource="${db}" var="rs">
                SELECT * from CUSTOMER
            </sql:query>
            <c:forEach var="table" items="${rs.rows}">
                <tr>
                    <td><c:out value="${table.customer_id}"/></td>
                    <td><c:out value="${table.Name}"/></td>
                    <td><c:out value="${table.Email}"/></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
