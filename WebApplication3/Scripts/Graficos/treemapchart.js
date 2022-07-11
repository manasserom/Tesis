//DONUTS
google.charts.load('current', { 'packages': ['treemap'] });
google.charts.setOnLoadCallback(drawChart);
function drawChart() {
    var aux = " " + document.getElementById('treemapListaTicker').getAttribute('value');
    var aux2 = " " + document.getElementById('treemapListaTipo').getAttribute('value');
    var aux3 = " " + document.getElementById('treemapListaParent').getAttribute('value');
    var aux4 = " " + document.getElementById('treemapListaColor').getAttribute('value');
    aux2 = aux2.replace(/ /g, "");
    var cr = aux.split(",");
    var ca = aux2.split(",");
    var cb = aux3.split(",");
    var cc = aux4.split(",");
    let Matriz;
    const long = cr.length + 6;
    let b = new Array(long);
    for (let j = 0; j < long; j++) {
        if (j == 0) {
            b[j] =  ['Ticker', 'Tipo', 'Cantidad', 'Color'];
            b[j + 1] = ['Global', null, 0, 0];
            b[j + 2] = ['Accion', 'Global', 0, 0];
            b[j + 3] = ['Commoditie', 'Global', 0, 0];
            b[j + 4] = ['Estable', 'Global', 0, 0];
            b[j + 5] = ['InEstable', 'Global', 0, 0];

        }
        if(j >= 6) {
            b[j] = [cr[j - 6], ca[j - 6], parseInt(cb[j - 6]), parseInt(cc[j - 6])];
        }
    }

    var data = google.visualization.arrayToDataTable(b);
   
    var options = {
        minColor: '#e7711c',
        midColor: '#fff',
        maxColor: '#4374e0',
        showScale: true,
        generateTooltip: showFullTooltip
    };
    tree = new google.visualization.TreeMap(document.getElementById('chart_div'));

    tree.draw(data, options);

    function showFullTooltip(row, size, value) {
        return '<div style="background:#fd9; padding:10px; border-style:solid">' +
            '<span style="font-family:Courier"><b>' + data.getValue(row, 0) +
            '</b>, ' + data.getValue(row, 1) + ', ' + new Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' }).format(data.getValue(row, 2)) +
            //'</b>, ' + data.getValue(row, 1) + ', ' + formatter.formatdata.getValue(row, 2) ++
             '</span><br>'// +
            //'Datatable row: ' + row + '<br>' +
            //data.getColumnLabel(2) //+
    //        ' (total value of this cell and its children): ' + size + '<br>' +
    //        data.getColumnLabel(3) + ': ' + value + ' </div>';
    }
    const formatter = new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: 'USD',
        minimumFractionDigits: 0
    })

    //tree = new google.visualization.TreeMap(document.getElementById('chart_div'));

    //tree.draw(data, {
    //    //minColor: '#ffa43a',
    //    //midColor: '#759eff',
    //    //maxColor: '#75c7ff',
    //    colorAxis: { colors: ['#f4ff91', '#ffb8ec', '#f86f6f', '#75c7ff'] }, // orange to blue

    //    headerHeight: 15,
    //    fontColor: 'black',
    //    showScale: true
    //});
}
