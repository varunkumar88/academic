<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>SPARQL Client</title>
<link href="css/alert.css" type="text/css" rel="stylesheet">
<!--<link href="css/bootstrap.css" type="text/css" rel="stylesheet">-->
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$("#save").click(function(){
			
			$.ajax({
	            url : 'temp.jsp',
	            data : {
	                action : $("#tarea").val(),
	                reasoning: $('input:radio[name=reasoning]:checked').val()
	            },
	            success : function(resp) {
	            	
	            	$('#tabRow').empty();
	    			
	            	var row = "";
	            	
	            	var json=$.parseJSON(resp);
	            	
	            	if (json.results.bindings.length == 0){
	            		row += "<tr style='color: white;' id ='row1'>";
	            		row += "<td> No Record Found</td>";
	            		row += "</tr>";
	            		
	            			
	            	}else{
			            	for(var j=0;j<json.results.bindings.length;j++){
			   				 row += "<tr style='color: white;' id ='row1'>"
						   			for(var i in json.results.bindings[j]) {
						   				var obj = json.results.bindings[j][i];
						   				
						   				if(i=='adult'){
						   					row += "<td>" + obj.value +"</td>";
						   				}  
						   			}
			   				 row += "</tr>";
			   				
			   				 
			   			}
			        }	
	            	
	            	
	            	$("#tabRow").append(row);
	    			
	            	row="";
	             
	            }
	        });
		});
		
		

	});
</script>
<style>
li
{
color:red;
font-size:15px;
margin:5px;
}
p
{color:#fff;
margin:5px 15px;
font-size:13px}
h4
{
color:#fff}
body
{color:#fff;
font-size:12px}
</style>
</head>

<body>
	<div class="page">
		<!--start of page-->
		<div role="main" id="mainDiv">
			<div style="margin-left: 20px;">
				<center>
					<h3>Family Ontology</h3>
				</center>
			</div>
			<!--Title-->
			<div class="newtab-wide-column">
				<div class="section-header">Application Information</div>
				<div class="section-header-flip"></div>
				<div class="section-body">

<div>
<center><img src="img/familiy_ontology.png" alt="" style="width:500px"></center>
</div>
<div>

<ul>
<li>Otology Model
<p>Lenka is person hasChild Ivan </p>
<p>Martin is person hasChild Ivan</p>
<p>Ivan is person,bornOn date 14/4/2006</p>
</li>
<li>Rule </li>
<p>Person (?p),hasAge(?p,?age),greaterThan(?age,18)->Adult(?p)</p>
<p>Person(?x), hasChild min 1 Person(?x) -> Parent(?x)</p>
<li>Inferred Information</li>
<p>Ivan is an Adult</p>
<p>Lenka is a Parent</p>
<p>Martin is a Parent</p>
</ul>

</div>
					<div style="clear: both;"></div>

				</div>


			</div>
			<div class="newtab-wide-column">
				<div class="section-header">SPARQL Client</div>
				<div class="section-header-flip"></div>
				<div class="section-body">

					<center>
						<textarea rows="10" cols="93" id="tarea"></textarea>
					</center>
<center><h4>Enable Reasoning</h4>
<input name="reasoning" type="radio" value="true" checked="checked" />True
<input name="reasoning" type="radio" value="false" />False</center>

<div style="clear:both">&nbsp;</div>
					<center>
						<!-- <input type="submit" value="Save" align="middle"> -->
						<button id="save">Execute Query</button>
					</center>
				</div>

				<div style="clear: both;"></div>

				<div class="newtab-wide-column">
					<div class="section-header">Result</div>
					<div class="section-header-flip"></div>



					<div class="section-listing">
						<table  class="table" id="tab">
							<tr class="HeaderStyle">
								<td >Result</td>
								
							</tr>
							<tr id='tabRow'></tr>
						</table>
					</div>
				</div>

				<div style="clear: both;"></div>
			</div>
			<footer> Designed and Developed by Varun</footer>
		</div>
</body>
</html>