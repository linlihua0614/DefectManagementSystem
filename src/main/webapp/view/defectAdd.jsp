<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link type="text/css" rel="stylesheet"  href="/css/addpage.css">
  <script type="text/javascript" src="/js/jquery-1.4.2.min.js"></script>

  <script type="text/javascript" src="/js/img.js"></script>
  <script type="text/javascript" src="/js/ajaxfileupload.js"></script>
  <script type="text/javascript" src="/js/check.js"></script>
<style>
  .div1{
    width: 111px;
    height: 70px;
    border:none;
  }

  .div2{
    width:111px;
    height:60px;
    border:none;
  }

  .div3{
    width:111px;
    height:10px;
    border:none;
    font: 1em sans-serif;
    font-size: 6px;
  }
</style>
  <script>
    function dealDefect(opt){
      var projId = $("#projId").val();
      if(is_empty(projId)){
        alert("项目不能为空！");
        return;
      }

      var module = $("#module").val();
      if(is_empty(module)){
        alert("模块不能为空！");
        return;
      }
      if(!is_allow_length(module,20)){
        alert("模块不能超过20个字符！");
        return;
      }


      var step = $("#step").val();
      if(is_empty(step)){
        alert("操作步骤不能为空！");
        return;
      }
      if(!is_allow_length(step,3000)){
        alert("操作步骤不能超过3000个字符！");
        return;
      }

      var actualResult = $("#actualResult").val();
      if(!is_empty(actualResult)){
        if(!is_allow_length(actualResult,100)){
          alert("实际结果不能超过100个字符！");
          return;
        }
      }
      var expectResult = $("#expectResult").val();
      if(!is_empty(expectResult)){
        if(!is_allow_length(expectResult,100)){
          alert("预期结果不能超过100个字符！");
          return;
        }
      }

      var remark = $("#remark").val();
      if(!is_empty(remark)){
        if(!is_allow_length(remark,100)){
          alert("备注不能超过100个字符！");
          return;
        }
      }

      if(opt==1){
        var next_user = $("#next_user").val();
        if(is_empty(next_user)){
          alert("提交操作必须制定下一步处理人！");
          return;
        }
        if(!is_allow_length(next_user,15)){
          alert("下一步处理人不能超过15个字节！");
          return;
        }

        $.ajax({
          url: "/defect/checkNextUser?v="+Math.random(),    //请求的url地址
          data:{"userName":next_user,"nextState":"open"},
          async:false,
          dataType: "text",   //返回格式为json
          type: "GET",   //请求方式
          success: function(ret) {
            if(ret=='1'){
              $("#nextUser").val(next_user);
              $("#newState").val("open");
              $("#form1").submit();
            }else{
              alert("请确认下一步处理人是否存在，且角色只能为缺陷确认人员！");
              return;
            }

          },
          error: function() {
            alert("系统异常，请联系管理员处理！");
            return;
          }
        });
      }

      if(opt==0){
        var next_user = $("#next_user").val();
        $("#nextUser").val('');
        $("#newState").val("new");
        $("#form1").submit();
      }

    }
  </script>
</head>
<body>
<div class="div">
  <form id="form1" action="${pageContext.request.contextPath}/defect/add" method="post">
    <input id="nextUser"  type="hidden" name="nextUser"  class="input"/>
    <input id="newState" type="hidden" name="newState" class="input">
    <table>
      <tr>
        <td><label class="label"><span style="color: red;">*</span>项目:</label></td>
        <td colspan="3">
          <select id="projId" name="projId" class="select" style="width: 400px;">
            <c:forEach items="${projs}" var="p">
              <option value="${p.id}">${p.projName}</option>
            </c:forEach>
          </select>
          </td>
      </tr>
      <tr>
        <td><label class="label"><span style="color: red;">*</span>所处项目阶段:</label></td>
        <td>
          <select id="atProjState" name="atProjState" class="select">
            <option value="2">需求</option>
            <option value="3">设计</option>
            <option value="4" selected>开发</option>
            <option value="5">测试</option>
            <option value="6">实施</option>
            <option value="7">维护</option>
          </select>
        </td>
        <td><label class="label"><span style="color: red;">*</span>模块:</label></td>
        <td><input id="module" type="text" name="module" class="input"/></td>
      </tr>

      <tr>
        <td><label class="label"><span style="color: red;">*</span>缺陷类型:</label></td>
        <td>
          <select id="type" name="type" class="select">
            <option value="1" selected>缺陷</option>
            <option value="2">优化</option>
            <option value="3">建议</option>
            <option value="4">需求</option>
          </select>
        </td>
        <td><label class="label"><span style="color: red;">*</span>复现率:</label></td>
        <td>
          <select id="recurrenceRate" name="recurrenceRate" class="select">
            <option value="0">0%</option>
            <option value="5">5%</option>
            <option value="10">10%</option>
            <option value="15">15%</option>
            <option value="20">20%</option>
            <option value="25">25%</option>
            <option value="30">30%</option>
            <option value="35">35%</option>
            <option value="40">40%</option>
            <option value="45">45%</option>
            <option value="50">50%</option>
            <option value="55">55%</option>
            <option value="60">60%</option>
            <option value="65">65%</option>
            <option value="70">70%</option>
            <option value="75">75%</option>
            <option value="80">80%</option>
            <option value="85">85%</option>
            <option value="90">90%</option>
            <option value="95">95%</option>
            <option value="100" selected>100%</option>
          </select>
        </td>
    </tr>

      <tr>
        <td><label class="label"><span style="color: red;">*</span>重要性:</label></td>
        <td>
          <select id="seriousness" name="seriousness" class="select">
            <option value="1">非常严重</option>
            <option value="2" selected>比较严重</option>
            <option value="3">一般</option>
            <option value="4">轻微</option>
          </select>
        </td>
        <td><label class="label"><span style="color: red;">*</span>优先级:</label></td>
        <td>
          <select id="priority" name="priority" class="select">
            <option value="1">立即解决</option>
            <option value="2" selected>高优先级</option>
            <option value="3">正常处理</option>
            <option value="4">低优先级</option>
          </select>
        </td>
     </tr>

      <tr>
        <td><label class="label"><span style="color: red;">*</span>操作步骤:</label></td>
        <td colspan="3"><textarea id="step" name="step" class="textarea" style="height: 9em"></textarea></td>
      </tr>

      <tr>
        <td><label class="label">实际结果:</label></td>
        <td colspan="3"><textarea id="actualResult" name="actualResult" class="textarea" style="height: 3em"></textarea></td>
      </tr>

      <tr>
        <td><label class="label">预期结果:</label></td>
        <td colspan="3"><textarea id="expectResult" name="expectResult" class="textarea" style="height: 3em"></textarea></td>
      </tr>

      <tr>
        <td><label class="label">备注:</label></td>
        <td colspan="3"><textarea id="remark" name="remark" class="textarea" style="height: 3em"></textarea></td>
      </tr>
    </table>
  </form>
  <table>
    <tr>
      <td><label class="label">截图（每张不超1M）:</label></td>

      <td>
        <div class="div1">
          <div class="div2">
            <img id="img1" onclick="imgShow('1');"  height="60" width="60" src="/defect/imgGetFromSession?imgId=img1"/>
          </div>
          <div class="div3"> <a href="#" onclick="imgUpload('1')" >上传</a>&nbsp;<a  href="#" onclick="imgDel('1');">删除</a></div>
        </div>
      </td>

      <td>
        <div class="div1">
          <div class="div2">
            <img id="img2" onclick="imgShow('2');" height="60" width="60" src="/defect/imgGetFromSession?imgId=img2"/>
          </div>
          <div class="div3"> <a href="#" onclick="imgUpload('2')" >上传</a>&nbsp;<a  href="#" onclick="imgDel('2');">删除</a></div>
        </div>
      </td>
      <td>
        <div class="div1">
          <div class="div2">
            <img id="img3" onclick="imgShow('3');"  height="60" width="60" src="/defect/imgGetFromSession?imgId=img3"/>
          </div>
          <div class="div3"><a href="#" onclick="imgUpload('3')">上传</a>&nbsp;<a  href="#" onclick="imgDel('3');">删除</a></div>
        </div>
      </td>
      <td>
        <div class="div1">
          <div class="div2">
            <img id="img4" onclick="imgShow('4');" height="60" width="60" src="/defect/imgGetFromSession?imgId=img4"/>
          </div>
          <div class="div3"> <a href="#" onclick="imgUpload('4')" >上传</a>&nbsp;<a  href="#" onclick="imgDel('4');">删除</a></div>
        </div>
      </td>
      <td>
        <div class="div1">
          <div class="div2">
            <img id="img5" onclick="imgShow('5');"  height="60" width="60" src="/defect/imgGetFromSession?imgId=img5"/>
          </div>
          <div class="div3"> <a href="#" onclick="imgUpload('5')">上传</a>&nbsp;<a  href="#" onclick="imgDel('5');">删除</a></div>
        </div>
      </td>
      <td>
        <div class="div1">
          <div class="div2">
            <img id="img6" onclick="imgShow('6');"  height="60" width="60" src="/defect/imgGetFromSession?imgId=img6"/>
          </div>
          <div class="div3"> <a href="#" onclick="imgUpload('6')">上传</a>&nbsp;<a  href="#" onclick="imgDel('6');">删除</a></div>
        </div>
      </td>
    </tr>
    <tr style="line-height: 12px;height: 12px;">
      <td>
        <input id="upfile1"  type="file" name="upfile1" style="display:none;"  accept="image/jpeg,image/png,image/bmp,image/gif">
        <input id="upfile2"  type="file" name="upfile2" style="display:none;"  accept="image/jpeg,image/png,image/bmp,image/gif">
        <input id="upfile3"  type="file" name="upfile3" style="display:none;"  accept="image/jpeg,image/png,image/bmp,image/gif">
        <input id="upfile4"  type="file" name="upfile4" style="display:none;"  accept="image/jpeg,image/png,image/bmp,image/gif">
        <input id="upfile5"  type="file" name="upfile5" style="display:none;"  accept="image/jpeg,image/png,image/bmp,image/gif">
        <input id="upfile6"  type="file" name="upfile6" style="display:none;"  accept="image/jpeg,image/png,image/bmp,image/gif">
      </td>
    </tr>
  </table>
</div>

<div class="div" style="margin-top: 9px;">
  <table align="center">

    <tr>
      <td><input id="next_user" type="text" name="next_user" class="input" style="width: 150px;" placeholder="指定下一步处理人"/></td>
      <td  align="center"  valign="middle">
        <input type="button"  onclick="dealDefect(0);"  value="保存" class="button"/>
      </td>
      <td  align="center"  valign="middle">
        <input type="button"  onclick="dealDefect(1);"  value="提交" class="button"/>
      </td>
    </tr>
  </table>
</div>

<div id="outerdiv" style="position:fixed;top:0;left:0;background:rgba(0,0,0,0.7);z-index:2;width:100%;height:100%;display:none;">
  <div id="innerdiv" style="position:absolute;">
    <img id="bigimg" style="border:5px solid #fff;" src="" />
  </div>
</div>
</body>
</html>
