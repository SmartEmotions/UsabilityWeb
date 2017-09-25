var ctx = document.getElementById('thesis-udenar').getContext('2d');
var chart = new Chart(ctx, {
    type: 'line',
    options:
    {
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
