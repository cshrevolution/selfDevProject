<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	let message = "<c:out value='${message}'/>";
	let url = "<c:out value='${url}'/>";
	alert(message);
	location.href = url;
</script>