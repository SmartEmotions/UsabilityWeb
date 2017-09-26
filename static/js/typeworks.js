//Chart.defaults.global.defaultFontSize = '18';
(function() {
    var ctx = document.getElementById('thesis-udenar').getContext('2d');
    var chart = new Chart(ctx, {
        type: 'line',
        options:
        {
            animateScale:true,
            responsive:true,
            scales:
            {
                xAxes:
                [{
                    ticks: {
                        beginAtZero: true,
                        fontSize: 18
                    },
                    display: true
                }],
                yAxes:
                [{
                    ticks: {
                        beginAtZero: true,
                        fontSize: 18
                    },
                    display: true
                }]
            },
            // title: {
            //     display: true,
            //     fontSize: 20,
            //     text: 'Trabajos De Grado UDENAR 2010 - 2017'
            // },
            legend: {
                display: true,
                position: 'bottom',
                labels: {
                    fontSize:18
                }
            },
        },
        data:
        {
            labels: [{% for Apps in  WebApps %} "{{ Apps.year }}", {% endfor %}],
            datasets:
            [
                {
                    label: "Movil Apps",
                    backgroundColor: "rgba(0, 128, 128,0.7)",
                    strokeColor: "rgba(100,100,100,1)",
                    pointColor: "rgba(151,187,205,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(151,187,205,0.5)",
                    data: [{% for App in  MovilApps %} "{{ App.total }}", {% endfor %}]
                },
                {
                    label: "Auditorias",
                    backgroundColor: "rgba(239, 127, 26,0.4)",
                    strokeColor: "rgba(100,100,255,1)",
                    pointColor: "rgba(151,187,205,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(151,187,205,1)",
                    data: [{% for Auditoria in  Auditorias %} "{{ Auditoria.total }}", {% endfor %}]
                },
                {
                    label: "Web Apps",
                    backgroundColor: "rgba(0,255,0,0.5)",
                    fillColor: "rgba(255,0,0,0.8)",
                    pointColor: "rgba(200,255,200,1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(220,220,220,1)",
                    data: [{% for Apps in  WebApps %} "{{ Apps.total }}", {% endfor %}]
                }
            ]
        }
    });
})();



(function() {
    var ctx = document.getElementById('development').getContext('2d');
    var chart = new Chart(ctx, {
        type: 'bar',
        options:
        {
            showDatapercentages: true,
            scales:
            {
                xAxes:
                [{
                    ticks: {
                        beginAtZero: true,
                        fontSize: 18
                    },
                    gridLines: {
                        display:false
                    },
                    display:true
                }],
                yAxes:
                [{
                    ticks: {
                        beginAtZero: true,
                        fontSize: 18
                    },
                    gridLines: {
                        display:false
                    },
                    display:true
                }]
            },
            // title: {
            //     display: true,
            //     text: 'Construccion de Software',
            //     fontSize: 20
            // },
            legend: {
                display: false,
                position: 'bottom',
                labels: {
                    fontSize:18
                }
            },
        },
        data:
        {
            labels: ['Si ', 'No '],
            datasets:
            [
                {
                    label: "Cantidad: ",
                    backgroundColor: ["rgba(239, 127, 26,0.5)",
                                      "rgba(0,255,0,0.5)",
                                      "rgba(0, 128, 128,0.5)"],
                    data: [{{ Development }}, {{ NoDevelopment }}]
                }
            ]
        }
    });
})();




(function() {
    var ctx = document.getElementById('usability-webapps').getContext('2d');
    var chart = new Chart(ctx, {
        type: 'bar',
        options:
        {
            showDatapercentages:true,
            scales:
            {
                xAxes:
                [{
                    ticks: {
                        beginAtZero: true,
                        fontSize: 18
                    },
                    gridLines: {
                        display:false
                    },
                    display:true
                }],
                yAxes:
                [{
                    ticks: {
                        beginAtZero: true,
                        fontSize: 18
                    },
                    gridLines: {
                        display:false
                    },
                    display:true
                }]
            },
            // title: {
            //     display: true,
            //     fontSize: 20,
            //     text: 'Especificacion Usabilidad Trabajos De Grado'
            // },
            legend: {
                display: false,
                position: 'bottom',
                labels: {
                    fontSize:18
                }
            },
        },
        data:
        {
            labels: ['Si', 'No '],
            datasets:
            [
                {
                    label: "Especificacion Usabilidad",
                    backgroundColor: ["rgba(0,255,0,0.5)","rgba(239, 127, 26,0.5)"],
                    data: ["{{ Usability }}", '{{NoUsability}}']
                }
            ]
        }
    });
})();

Chart.plugins.register({
    afterDraw: function(chartInstance)
    {
        if (chartInstance.config.options.showDatapercentages)
        {
            var helpers = Chart.helpers;
            var ctx = chartInstance.chart.ctx;
            var fontColor = helpers.getValueOrDefault(chartInstance.config.options.showDatapercentages.fontColor, chartInstance.config.options.defaultFontColor);
            ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, 'normal', Chart.defaults.global.defaultFontFamily);
            ctx.textAlign = 'center';
            ctx.textBaseline = 'bottom';
            ctx.fillStyle = fontColor;

            chartInstance.data.datasets.forEach(function (dataset)
            {
                var total = 0;
                for (var i = 0; i < dataset.data.length; i++)
                {
                    total += parseInt(dataset.data[i]);
                }
                for (var i = 0; i < dataset.data.length; i++)
                {
                    var model = dataset._meta[Object.keys(dataset._meta)[0]].data[i]._model;
                    var scaleMax = dataset._meta[Object.keys(dataset._meta)[0]].data[i]._yScale.maxHeight;
                    var yPos = (scaleMax - model.y) / scaleMax >= 0.93 ? model.y + 20 : model.y - 5;
                    ctx.fillText(parseFloat((dataset.data[i]/total)*100).toFixed(2) + ' %', model.x, yPos);
                }
            });
        }
    }
});

Chart.plugins.register({
    afterDraw: function(chartInstance)
    {
        if (chartInstance.config.options.showDatapoints)
        {
            var helpers = Chart.helpers;
            var ctx = chartInstance.chart.ctx;
            var fontColor = helpers.getValueOrDefault(chartInstance.config.options.showDatapoints.fontColor, chartInstance.config.options.defaultFontColor);
            ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, 'normal', Chart.defaults.global.defaultFontFamily);
            ctx.textAlign = 'center';
            ctx.textBaseline = 'bottom';
            ctx.fillStyle = fontColor;

            chartInstance.data.datasets.forEach(function (dataset)
            {
                for (var i = 0; i < dataset.data.length; i++)
                {
                    var model = dataset._meta[Object.keys(dataset._meta)[0]].data[i]._model;
                    var scaleMax = dataset._meta[Object.keys(dataset._meta)[0]].data[i]._yScale.maxHeight;
                    var yPos = (scaleMax - model.y) / scaleMax >= 0.93 ? model.y + 20 : model.y - 5;
                    ctx.fillText(dataset.data[i], model.x, yPos);
                }
            });
        }
    }
});

(function() {
    var ctx = document.getElementById('porcentajes-trabajos').getContext('2d');
    var chart = new Chart(ctx, {
        type: 'bar',
        options:
        {
            showDatapercentages: true,
            animation:{
                animateScale:true
            },
            scales:
            {
                xAxes:
                [{
                    ticks: {
                        beginAtZero: true,
                        fontSize: 18
                    },
                    gridLines: {
                        display:false
                    },
                    display:true
                }],
                yAxes:
                [{
                    ticks: {
                        beginAtZero: true,
                        fontSize: 18
                    },
                    gridLines: {
                        display:false
                    },
                    display:true
                }]
            },
            // title: {
            //     display: true,
            //     text: 'Trabajos De Grado',
            //     fontSize: 20
            // },
            legend: {
                display: false,
                // position: 'bottom',
                // labels: {
                //     fontSize:18
                // }
            },
        },
        data:
        {
            labels: [{% for Type in  Porcentajes %} "{{ Type.type }}", {% endfor %}],
            datasets:
            [
                {
                    label:'Cantidad: ',
                    backgroundColor: ["rgba(0,255,100,0.4)",
                                      "rgba(239, 127, 26,0.4)",
                                      "rgba(0,255,0,0.4)",
                                      "rgba(0, 128, 128,0.4"],
                    data: [{% for Type in  Porcentajes %} "{{ Type.total }}", {% endfor %}]
                }
            ]
        }
    });
})();






(function() {
    var ctx = document.getElementById('methodologies').getContext('2d');
    var chart = new Chart(ctx, {
        type: 'bar',
        options:
        {
            showDatapercentages: true,
            animation:{
                animateScale:true
            },
            tooltips:{
                fontSize: 18,
            },
            scales:
            {
                xAxes:
                [{
                    ticks: {
                        beginAtZero: true,
                        fontSize: 18
                    },
                    gridLines: {
                        display:false
                    },
                    display:true
                }],
                yAxes:
                [{
                    ticks: {
                        beginAtZero: true,
                        fontSize: 18
                    },
                    gridLines: {
                        display:false
                    },
                    display:true
                }]
            },
            // title: {
            //     display: true,
            //     text: 'Trabajos De Grado',
            //     fontSize: 20
            // },
            legend: {
                display: false,
                // position: 'bottom',
                // labels: {
                //     fontSize:18
                // }
            },
        },
        data:
        {
            labels: [{% for Method in  Methodologies %} "{{ Method.name }}", {% endfor %}],
            datasets:
            [
                {
                    label:'Cantidad: ',
                    backgroundColor: ["rgba(0,255,100,0.4)",
                                      "rgba(100, 127, 26,0.4)",
                                      "rgba(0,255,0,0.4)",
                                      "rgba(0,100,100,0.4)",
                                      "rgba(239, 127, 26,0.4)",
                                      "rgba(100,0,100,0.4)",
                                      "rgba(200,100,200,0.4)",
                                      "rgba(0, 200, 100,0.4)",
                                      "rgba(255,255,100,0.4)"],
                    data: [{% for Method in  Methodologies %} "{{ Method.total }}", {% endfor %}]
                }
            ]
        }
    });
})();
