import { Doughnut } from 'vue-chartjs'
import Chart from "chart.js";
export default {
  extends: Doughnut,
  name: "Doughnut",
  props: ['data', 'options', 'total', 'night_hours'],
  mounted () {
    this.renderChart(this.data, this.options)
    this.textCenter(this.data.total, this.data.night_hours);
  },
  watcher: {
    data: {
      immediate: true,
      handler (val, oldVal) {
        console.log("val", val)
        console.log("oldVal", oldVal)
        this.$forceUpdate()
      }
    }
  },
  methods: {
    textCenter(hours, night_hours) {
      Chart.pluginService.register({
        beforeDraw: function(chart) {
          var width = chart.chart.width;
          var height = chart.chart.height;
          var ctx = chart.chart.ctx;

          ctx.restore();
          var fontSize = (height / 200).toFixed(2);
          ctx.font = fontSize + "em sans-serif";
          ctx.textBaseline = "middle";

          var text = hours + "H";
          var textX = Math.round((width - ctx.measureText(text).width) / 2);
          var textY = height / 1.9;

          ctx.fillText(text, textX, textY);
          ctx.save();

          fontSize = (height / 300).toFixed(2);
          ctx.font = fontSize + "em sans-serif";
          ctx.textBaseline = "middle";

          text = night_hours + "H at night";
          textX = Math.round((width - ctx.measureText(text).width) / 2);
          textY = height / 1.6;

          ctx.fillText(text, textX, textY);
          ctx.save();
         }
       });
       Chart.plugins.unregister(this.chartdata);
     }
   }
};
