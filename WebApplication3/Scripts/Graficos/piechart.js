
google.charts.load("current", {packages:["corechart"]});
google.charts.setOnLoadCallback(drawChartPie);
function drawChartPie() {

    var aux = " " + document.getElementById('piechartData').getAttribute('value');
    var aux2 = " " + document.getElementById('piechartCate').getAttribute('value');
    var cr = aux.split(",");
    var ca = aux2.split(",");
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
          //title: 'Capital por criptomoneda'
            chartArea: { width: '100%', height: '100%' },
            legend: { position: 'labeled', textStyle: { color: 'black', fontSize: 10 } },
            sliceVisibilityThreshold: .1

        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
