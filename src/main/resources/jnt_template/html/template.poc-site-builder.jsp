<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>${fn:escapeXml(renderContext.mainResource.node.displayableName)}</title>

    <c:if test="${jcr:isNodeType(renderContext.site, 'jmix:templateHeader')}">

        <c:set var="resfolder" value="${renderContext.site.properties['resourceFolder'].node}"/>
        <c:if test="${not empty resfolder}">
            <jcr:sql
                    var="files"
                    sql="SELECT * FROM [jnt:file] As node WHERE ISDESCENDANTNODE (node, '${resfolder.path}')"
            />
            <c:forEach items="${files.nodes}" var="file">
                <c:url var="fileUrl" value="${file.url}"/>
                <c:if test="${fn:endsWith(fileUrl, '.css')}">
                    <template:addResources type="css" resources="${fileUrl}"/>
                </c:if>
                <c:if test="${fn:endsWith(fileUrl, '.js')}">
                    <template:addResources type="javascript" resources="${fileUrl}"/>
                </c:if>
            </c:forEach>
        </c:if>

        ${renderContext.site.properties['head'].string}
    </c:if>
</head>

<body>


<template:area path="html" nodeTypes="jnt:htmlComponent"/>

<c:if test="${renderContext.editMode}">
    <template:addResources type="css" resources="edit.css" />
</c:if>


<c:if test="${jcr:isNodeType(renderContext.site, 'jmix:templateFooter')}">
    ${renderContext.site.properties['jsfooterfiles'].string}
</c:if>
</body>
</html>
