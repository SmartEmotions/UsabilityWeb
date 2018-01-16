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
                    position: 'average',
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

function drawLines(canv, info, labs, bgcl, fill)
{
    (function() {
        var dataset = loadDataSets(info, labs, bgcl, fill);
        var ctx = document.getElementById(canv).getContext('2d');
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
                            // fontSize: 18
                        },
                        display: true
                    }],
                    yAxes:
                    [{
                        ticks: {
                            beginAtZero: true,
                            // fontSize: 18
                        },
                        display: true
                    }]
                },
                legend: {
                    display: true,
                    position: 'bottom',
                    labels: {
                        // fontSize:18
                    }
                },
                tooltips: {
            				enabled: true,
            				mode: 'index',
                    intersect:false,
            				position: 'nearest'
                },
                animation: {
                    duration: 4000,
                },
            },
            data:
            {
                labels: labs,
                datasets:datasets
            }
        });
    })();
}

function loadDataSets(data, labels, bgcl, fill)
{
    datasets = []
    count = 0;
    data.forEach(elem =>
    {
        data = []
        elem.Years = fillEmptyValues(labels, elem.Years);
        elem.Years.forEach(element =>
        {
            data.push(element.Total);
        });
        datasets.push({
            "label": elem.Type,
            "borderColor": bgcl[count],
			"pointBackgroundColor": bgcl[count],
			// "fill": false,
            "backgroundColor": fill[count],
            // "fillColor": fill[count],
            // "pointColor": "rgba(200,255,200,1)",
            // "pointStrokeColor": "#fff",
            // "pointHighlightFill": "#fff",
            // "pointHighlightStroke": "rgba(220,220,220,1)",
            "data": data
        });
        count += 1;
    });
    return datasets;
}

function fillEmptyValues(labels, data)
{
    for (let i = 0; i < labels.length; i++)
    {
        var exist = false;
        data.forEach(elements =>
        {
            if (elements.Year == labels[i])
            {
                exist = true;
            }
        });
        if (!exist)
        {
            data.splice(i, 0, { "Year" : labels[i], "Total": 0 } );
        }
    }
    return data;
}
