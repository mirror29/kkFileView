<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>PDF图片预览</title>
    <script src="js/lazyload.js"></script>
    <#include "*/commonHeader.ftl">
    <style>
        body {
            background-color: #404040;
        }
        .container {
            width: 100%;
            height: 100%;
            padding-left:0;
            padding-right:0;
        }
        .img-area {
            text-align: center;
        }
        .my-photo{
            width: 100%;
        }
        /*- scrollbar -*/
        ::-webkit-scrollbar {
            width: 5px;
            height: 5px;
        }
        ::-webkit-scrollbar-thumb {
            background-color: #999;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }
        ::-webkit-scrollbar-thumb:vertical:hover {
            background-color: #666;
        }
        ::-webkit-scrollbar-thumb:vertical:active {
            background-color: #333;
        }
        ::-webkit-scrollbar-button {
            display: none;
        }
        ::-webkit-scrollbar-track {
            background-color: #f1f1f1;
        }
        /*- scrollbar -*/

    </style>
</head>
<body>
<div class="container">
    <#list imgurls as img>
        <div class="img-area">
            <img class="my-photo" alt="loading"  data-src="${img}" src="images/loading.gif">
        </div>
    </#list>
</div>
<#if "false" == switchDisabled>
    <img src="images/pdf.svg" width="63" height="63" style="position: fixed; cursor: pointer; top: 4%; right: 20px; z-index: 999;" alt="使用PDF预览" title="使用PDF预览" onclick="changePreviewType('pdf')"/>
</#if>
<script>
    window.onload = function () {
        /*初始化水印*/
        initWaterMark();
        checkImgs();
    };
    window.onscroll = throttle(checkImgs)

    function changePreviewType(previewType) {
        var url = window.location.href;
        if (url.indexOf("officePreviewType=image") !== -1) {
            url = url.replace("officePreviewType=image", "officePreviewType="+previewType);
        } else {
            url = url + "&officePreviewType="+previewType;
        }
        if ('allImages' === previewType) {
            window.open(url)
        } else {
            window.location.href = url;
        }
    }
</script>
</body>
</html>