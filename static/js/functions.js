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
                        data: data,
                        borderColor:'#00a5c9',
                        borderWidth:1,
                        borderStyle:'dot'
                    }
                ]
            }
        });
        Chart.helpers.each(chart.getDatasetMeta(0).data, function(rectangle, index)
        {
            rectangle.draw = function()
            {
                chart.chart.ctx.setLineDash([10, 1]);
                Chart.elements.Rectangle.prototype.draw.apply(this, arguments);
            }
        }, null);
    })();
}
