<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
</head>
<body>
<script>
var corList = [
   {corNo : 1, corArea : '대구', corSum : 1, corNew : 1},
   {corNo : 2, corArea : '대구2', corSum : 1, corNew : 1},
   {corNo : 3, corArea : '대구3', corSum : 1, corNew : 1},
   {corNo : 4, corArea : '대구4', corSum : 1, corNew : 1},
   {corNo : 5, corArea : '대구5', corSum : 1, corNew : 1},
];

function loadData(){
   var html = '';
   var corSumTotal = 0;
   var corNewTotal = 0;
      for(var i = 0; i<corList.length; i++){
         cor = corList[i];
         html += '<tr>';
         $('th[data-col]').each(function(idx,th){
            var col = th.getAttribute('data-col');
            html += '<td>' + cor[col] + '</td>';
            if(col == 'corSum'){
               corSumTotal += cor[col];
            }else if(col == 'corNew'){
               corNewTotal += cor[col];
            }
         })
         html += '</tr>';
      }
      html += '<tr><td>합계</td>';
      html += '<td>-</td>';
      html += '<td>' + corSumTotal + '</td>';
      html += '<td>' + corNewTotal + '</td>';
      $('#dataBody').html(html);
}
$(document).ready(loadData);
</script>

   <table class="table table-bordered">
      <tr>
         <th data-col="corNo">번호</th>
         <th data-col="corArea">지역</th>
         <th data-col="corSum">총</th>
         <th data-col="corNew">신규</th>
      </tr>
      <tbody id="dataBody"></tbody>
   </table>
</body>
</html>