
google.charts.load('current', { 'packages': ['table'] });
google.charts.setOnLoadCallback(drawTable);
function drawTable() {

    var aux = " " +  document.getElementById('tablechartCripto').getAttribute('value');
    var aux2 = " " + document.getElementById('tablechartCapital').getAttribute('value');
    var aux3 = " " + document.getElementById('tablechartTipo').getAttribute('value');
    var cr = aux.split(",");
    var ca = aux2.split(",");
    var cb = aux2.split(",");
    let Matriz;
    const long = cr.length + 1;
    let b = new Array(long);
    for (let j = 0; j < long; j++) {
        if (j == 0) {
            b[j] = ['Tipo', 'Cantidad','Tipo'];
        }
        else {
            b[j] = [cr[j - 1], { v: parseInt(ca[j - 1]), f: '$' + parseInt(ca[j - 1]) } , cb[j - 1]];
        }
    }
    var data = new google.visualization.DataTable();

    data.addColumn('string', 'Nombre');
    data.addColumn('number', 'Captial');
    data.addColumn('string', 'Tipo');
    var data = google.visualization.arrayToDataTable(b);

    //data.addRows(b);
    //data.addRows([
    //    ['Mike', { v: 10000, f: '$10,000' }, 10000],
    //    ['Jim', { v: 8000, f: '$8,000' }, 8000],
    //    ['Alice', { v: 12500, f: '$12,500' }, 12500],
    //    ['Bob', { v: 7000, f: '$7,000' }, 7000]
    //]);

    var table = new google.visualization.Table(document.getElementById('tablechart'));

    table.draw(data, { showRowNumber: true, width: '100%', height: '100%' });

      //  chart.draw(data, options);
      }
