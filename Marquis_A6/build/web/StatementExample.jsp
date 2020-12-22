<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
    <head>
        <title>Statement Example</title>
    </head>
    <body>
        <sql:update var="updatedTable" scope="page" dataSource="jdbc/DataSourceExample">
            INSERT INTO stock_tbl (symbol, name) VALUES (?, ?)
            <sql:param value="${param.symbol}" />
            <sql:param value="${param.name}" />
        </sql:update>
        <c:if test="${updatedTable>=1}">
            Data successfully inserted into database
        </c:if>
        <c:if test="${exception!=null}">
            <c:out value="Data was not inserted into database. Reason for failure is unknown" />
        </c:if>
    </body>
</html>