window.onload=()=>{
    console.log("Hello ")
    x = document.getElementById("xaxis").innerHTML;
    y = document.getElementById("yaxis").innerHTML;
    x=x.slice(1,x.length-1)
    y=y.slice(1,y.length-1)
    x = x.split(", ")
    y = y.split(", ")
    let xaxis =[]
    let yaxis =[]
    for(let i of x)
    {
        xaxis.push(parseInt(i))
    }
    for(let i of y)
    {
        yaxis.push(parseInt(i))
    }
    finalAxes = []
    for(let i=0;i<xaxis.length;i++)
    {
        
        finalAxes.push([xaxis[i],yaxis[i]])
    }
    console.log(finalAxes)
    google.load('visualization', '1.0', 
     { packages: ['corechart', 'bar', 'table'], callback: drawChart });
    function drawChart()
    {
        var data = new google.visualization.DataTable();
        data.addColumn('number','ProductId')
        data.addColumn('number','Quantity')
        data.addRows(finalAxes)
        var options = {title:'Quantity of Product Vs Id','width':600,'height':400, vAxis: {title: "Product-Id"},
        hAxis: {title: "Quantity of Products"},orientation: 'vertical'}
        var chart = new google.visualization.BarChart(document.getElementById('productChart'));
        chart.draw(data, options);
    };
}