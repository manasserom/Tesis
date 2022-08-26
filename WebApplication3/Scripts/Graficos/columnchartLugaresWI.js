google.charts.load('current', { packages: ['corechart', 'bar'] });
google.charts.setOnLoadCallback(drawBasic);

function aleatorio(inferior, superior) {
    numPosibilidades = superior - inferior
    aleat = Math.random() * numPosibilidades
    aleat = Math.floor(aleat)
    return parseInt(inferior) + aleat
}

function dame_color_aleatorio() {
    hexadecimal = new Array("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F")
    color_aleatorio = "#";
    for (i = 0; i < 6; i++) {
        posarray = aleatorio(0, hexadecimal.length)
        color_aleatorio += hexadecimal[posarray]
    }
    return color_aleatorio
}

function drawBasic() {
    var data = new google.visualization.DataTable();
    data.addColumn('timeofday', 'Criptomonedas');
    data.addColumn('number', 'Capital');
    var aux = "" + document.getElementById('ListaLugarData').getAttribute('value');
    var aux2 = "" + document.getElementById('ListaLugarCate').getAttribute('value');
    var cr = aux.split(",");
    var ca = aux2.split(",");
    //Listados de valores unicos
    const dataArr = new Set(cr);
    let resultL = [...dataArr];
    var resultC = new Array(resultL.length);
    for (let i = 0; i < resultC.length; i++) {
        resultC[i] = 0;
    }
    //Acumulacion de los datos
    for (let i = 0; i < cr.length; i++) {
        for (let j = 0; j < resultL.length; j++) {
            if (cr[i] == resultL[j]) {
                resultC[j] = parseInt(resultC[j]) + parseInt(ca[i]);
            }
        }        
    }
    let Matriz;
    const long = resultL.length + 1;
    let b = new Array(long);
    let color = '';
    for (let j = 0; j < long; j++) {
        color = dame_color_aleatorio();
        if (j == 0) {
            b[j] = ['Tipo', 'Cantidad', { role: 'style' }];
        }
        else {
            b[j] = [resultL[j - 1], parseInt(resultC[j - 1]), color];
        }
    }

    var data = google.visualization.arrayToDataTable(b);
    var options = {
        bar: { groupWidth: "95%" },
        legend: { position: "none" },
    };

    var chart = new google.visualization.ColumnChart(
        document.getElementById('columnchartLug'));

    chart.draw(data, options);
}