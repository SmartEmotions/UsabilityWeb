//Chart.defaults.global.defaultFontSize = '16';
// Chart.defaults.global.animationSteps = Math.round(5000 / 17); 
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
                    var yPos = (scaleMax - model.y) / scaleMax >= 0.93 ? model.y + 20 : model.y - 25;
                    ctx.fillText(parseFloat((dataset.data[i]/total)*100).toFixed(2) + ' %', model.x, yPos);
                }
            });
        }
    }
});
