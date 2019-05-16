<%--
  Created by IntelliJ IDEA.
  User: teela
  Date: 2017/3/30
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title></title>
  <link href="../js/jQueryLigerUI1.3.3/lib/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" />
  <script src="../js/jQueryLigerUI1.3.3/lib/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>
  <script src="../js/jQueryLigerUI1.3.3/lib/ligerUI/js/core/base.js" type="text/javascript"></script>
  <script src="../js/jQueryLigerUI1.3.3/lib/ligerUI/js/plugins/ligerGrid.js" type="text/javascript"></script>
  <%--<script src="../../static/js/jQueryLigerUI1.3.3/demos/grid/CustomersData.js" type="text/javascript"></script>--%>
  <script type="text/javascript">
    var grid = null;
    var CustomersData =
    {Rows:${result.roleList},Total:${result.role.totalRows}};
    $(function () {

      grid = $("#maingrid4").ligerGrid({
        columns: [
          { display: '角色名称', name: 'roleName' },
          { display: '角色描述', name: 'desc' },
          { display: '是否启用', name: 'enabled',render:function(rowData){
            if(rowData.enabled=='0'){
              return '否';
            }else if(rowData.enabled=='1'){
              return '是';
            }
          } },
          { display: '是否管理权限', name: 'isSys',render:function(rowData){
            if(rowData.isSys=='0'){
              return '否';
            }else if(rowData.isSys=='1'){
              return '是';
            }
          } }
        ],  pageSize:${result.role.pageSize},where : f_getWhere(),
        data: CustomersData,
        width: '100%',height:'100%',
        toolbarShowInLeft: true,
        toolbar: {
          items: [{
            text: '添   加', click: function () {
              $.ligerDialog.open({ width: 200, height: 300, title: '添   加', url: '' });
            }, icon: 'add'
          },
            {
              text: '删   除', click: function () {
              $.ligerDialog.confirm('确定删除?', function (yes) {
                if (yes) {
                  var _Rows = Grid.getSelectedRows(), _keys = [];
                  for (var i = 0; i < _Rows.length; i++) {
//                    _keys.push(_Rows[i][options.editor.para[0]]);
                  }
//                  getAjax(options.ajaxURL + "?type=delete&id=" + _keys.join(','), options.param, function (data) {
//                    if (data.success)
//                      $.ligerDialog.success('删除成功');
//                    else
//                      $.ligerDialog.error('删除失败');
//                  });
                }
              });
            }, icon: 'delete'
            }
          ]
        }
      });


      $("#pageloading").hide();
    });
    function itemclick(item)
    {
      alert(item.text);
    }
    function f_search()
    {
      grid.options.data = $.extend(true, {}, CustomersData);
      grid.loadData(f_getWhere());
    }
    function f_getWhere()
    {
      if (!grid) return null;
      var clause = function (rowdata, rowindex)
      {
        var rolename = $("#roleName").val();
        return rowdata.roleName.indexOf(rolename) > -1;
      };
      return clause;
    }
  </script>
</head>
<body style="padding:6px; overflow:hidden;">
<div id="searchbar" style="margin-bottom: 10px;">
  角色名称：<input id="roleName" type="text" />
  <input id="btnOK" type="button" value="查询" onclick="f_search()" />
</div>
<%--<div class="l-loading" style="display:block" id="pageloading"></div>--%>
<%--<a class="l-button" style="width:120px;float:left; margin-left:10px; display:none;" onclick="deleteRow()">删除选择的行</a>--%>


<div class="l-clear"></div>

<div id="maingrid4" style="margin:0; padding:0"></div>


<div style="display:none;">
  <!-- g data total ttt -->
</div>

</body>
</html>

