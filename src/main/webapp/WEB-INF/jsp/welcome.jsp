
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



</head>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
  <script src='https://d3js.org/d3.v5.min.js'></script>
  <style> rect {fill: lightblue; stroke: black; }</style>
</head>
<body onload='init()'>

<svg width=300 height=300>
  
</svg>
<script>
async function init() {
  

const data1 = await d3.csv('https://flunky.github.io/cars2017.csv');
var data = [4,8,15,16,23,42];

var hightdomain = ['4','42'];
var hightrange = ['19.0476','200'];
var x = d3.scaleBand().domain([0,1,2,3,4,5]).range([0,200])
var y = d3.scaleLinear().domain([0,42]).range([200,0])
var hight = d3.scaleLinear().domain(hightdomain).range(hightrange);
 
var x_axis = d3.axisBottom().scale(x);

var y_axis = d3.axisLeft().scale(y);

 var bandScale = d3.scaleBand()
	.domain([0,1,2,3,4,5])
	.range([0, 200])
	.paddingInner(50)

d3.select('svg')
  .append('g')
  .attr('transform', 'translate(50,50)')
  .selectAll('rect')
  .data([4,8,15,16,23,42])
  .enter()
  .append('rect')
  .attr('x',function(d,i) {return x(i);})
  .attr('y', y)
  .attr('width',x.bandwidth())
  .attr('height',function(d,i) {return  hight(d);});
 
 var svg = d3.select('svg');
  
  svg.append('g')
   .attr('transform', 'translate(50, 50)')
   .call(y_axis);
  
  svg.append('g')
   .attr('transform', 'translate(50, 250)')
   .call(x_axis);
  
 }
</script>

</body>
</html>  