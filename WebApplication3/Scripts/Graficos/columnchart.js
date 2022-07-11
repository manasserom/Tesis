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
    var aux = " " + document.getElementById('piechartData').getAttribute('value');
    var aux2 = " " + document.getElementById('piechartCate').getAttribute('value');
    var cr = aux.split(",");
    var ca = aux2.split(",");
    let Matriz;
    const long = cr.length + 1;
    let b = new Array(long);
    let color = '';
    for (let j = 0; j < long; j++) {
        color = dame_color_aleatorio();
        if (j == 0) {
            b[j] = ['Tipo', 'Cantidad', { role: 'style' }];
        }
        else {
            b[j] = [cr[j - 1], parseInt(ca[j - 1]), color];
        }
    }

    var data = google.visualization.arrayToDataTable(b);
    //var data = google.visualization.arrayToDataTable([
    //    ['Element', 'Density', { role: 'style' }],
    //    ['Copper', 8.94, '#b87333'],            // RGB value
    //    ['Silver', 10.49, 'silver'],            // English color name
    //    ['Gold', 19.30, 'gold'],

    //    ['Platinum', 21.45, 'color: #e5e4e2'], // CSS-style declaration
    //]);
    var options = {
        //title: "Density of Precious Metals, in g/cm^3",
        //width: 600,
        //height: 400,
        bar: { groupWidth: "95%" },
        legend: { position: "none" },
    };

    var chart = new google.visualization.ColumnChart(
        document.getElementById('columnchart'));

    chart.draw(data, options);
}