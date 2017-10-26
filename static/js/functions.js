function drawBar(canvas, labels, data, datal, bg_colrs, prcntags, width, maxheight)
{
    (function() {
        var ctx = document.getElementById(canvas).getContext('2d');
        var chart = new Chart(ctx, {
            type: 'bar',
            options:
            {
                animateScale : true,
                showDatapercentages:true,
                scales:
                {
                    xAxes:
                    [{
                        stacked: true,
                        ticks: {
                            beginAtZero: true,
                            autoSkip: false
                            // fontSize: 18
                        },
                        gridLines: {
                            display:false
                        },
                        display:true,
                        barPercentage: width
                    }],
                    yAxes:
                    [{
                        ticks: {
                            beginAtZero: true,
                            // fontSize: 18,
                            min:0,
                            max:maxheight
                        },
                        gridLines: {
                            display:false
                        },
                        display:true,
                    }]
                },
                legend: {
                    display: false,
                    position: 'bottom',
                    // labels: {
                    //     fontSize:18
                    // }
                },
                tooltips: {
                    position: 'average'
                },
                responsive:true,
                animation: {
                    duration: 4000,
                }
            },
            data:
            {
                labels: labels,
                datasets:
                [
                    {
                        label: datal,
                        backgroundColor: bg_colrs,
                        data: data
                    }
                ]
            }
        });
    })();
}
