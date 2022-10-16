      google.charts.load('current', {'packages':['gauge']});
      google.charts.setOnLoadCallback(drawChartGauge);

      function drawChartGauge() {
          var Bloq = " " + document.getElementById('gaugechartDataBloq').getAttribute('value');
          var Disp = " " + document.getElementById('gaugechartDataDisp').getAttribute('value');

        var data = google.visualization.arrayToDataTable([
          ['Label', 'Value'],
            [' Bloqueado ', parseInt(Bloq)],
            [' Centralizado ', parseInt(Disp)],
        ]);

          var options = {
              width: '100%', height: 200,
              redFrom: 90, redTo: 100,
              yellowFrom:75, yellowTo: 90,
              minorTicks: 5
        };

        var chart = new google.visualization.Gauge(document.getElementById('chart_div'));

        chart.draw(data, options);
      }
