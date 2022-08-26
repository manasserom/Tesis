//DONUTS
google.charts.load("current", {packages:["corechart"]});
google.charts.setOnLoadCallback(drawChart);
function drawChart() {
    var aux = "" + document.getElementById('donutchartCateWI').getAttribute('value');
    var aux2 = "" + document.getElementById('donutchartDataWI').getAttribute('value');
    var cr = aux.split(",");
    var ca = aux2.split(",");
    //Valores para agregar
    var wTipo =     $("#CategoriaW").val();
    var wCapital =  $("#CapitalW").val();

    //var wTipo = "" + document.getElementById('donutchartCateW').getAttribute('value');
    //var wCapital = "" + document.getElementById('donutchartDataW').getAttribute('value');
    
    //ca[0] = wCapital;
    if (wTipo != "") {
        let windice = cr.indexOf(wTipo);
        ca[windice] = parseInt(ca[windice]) + parseInt(wCapital);
    }
    
    let Matriz;
    const long = cr.length + 1;
    let b = new Array(long);
    for (let j = 0; j < long; j++) {
        if (j == 0) {
            b[j] = ['Tipo', 'Cantidad'];
        }
        else {
            b[j] = [cr[j - 1], parseInt(ca[j - 1])];
        }
    }
    var data = google.visualization.arrayToDataTable(b);


  var options = {
    //title: 'Capital segun el tipo' ,
      pieHole: 0.4,
      chartArea: { width: '100%', height: '100%' },
      legend: { position: 'labeled'}

  };

  var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
  chart.draw(data, options);
}
