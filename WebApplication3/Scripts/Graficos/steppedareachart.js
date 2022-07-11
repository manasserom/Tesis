google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChartSteppedArea);

      function drawChartSteppedArea() {
        var data = google.visualization.arrayToDataTable([
          ['Tipo',  'Inestables', 'Estables', 'Acciones', 'Commodities'],
          ['2019',     8.4,    5.9,   2,  5.6 ],
          ['2020',     1.9,    7.5,   1,  2   ],
          ['2021',     6.5,    6.4,   0,  4   ],
          ['2022',     4.4,    6.2,   5,  1   ],
          ['2023',     4.4,    6.2,   5,  1   ]
        ]);

        var options = {
          title: 'Evolucion del capital',
          vAxis: {title: 'Agrupado por tipo'},
          isStacked: 'percent',
          legend: { position: 'bottom' },

        };

        var chart = new google.visualization.SteppedAreaChart(document.getElementById('SteppedArea'));

        chart.draw(data, options);
      }
