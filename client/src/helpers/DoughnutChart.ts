// @ts-nocheck
import { Doughnut, mixins } from 'vue-chartjs'

export default {
  extends: Doughnut,
  name: "Doughnut",
  mixins: [mixins.reactiveProp],
  props: {
    options: { type: Object, default: null },
    chartData: { type: Object, default: null },
    ctx: {type: Object, default: null}
  },
  watch: {
    chartData: function(val, old_val) {
      console.log(this.ctx)
      console.log("ONCHAFE")
      // var canvas = document.querySelectorAll('canvas')[1]
      // console.log(canvas)
      // canvas = null
      if(this.ctx != null) {
        this.ctx = null
      }
      // this.this.ctx.delete()
      // this.chart.update()
      // Chart.plugins.unregister(this.chartdata);
      // this.renderChart(val, this.options)
      // this.textCenter("", "")
      this.textCenter(val.total, val.night_hours)
    }
  },
  mounted () {
    this.renderChart(this.chartData, this.options)
    this.textCenter(this.chartData.total, this.chartData.night_hours)
  },
  methods: {
    textCenter(hours, night_hours) {
      Chart.pluginService.register({
        beforeDraw: function(chart) {
          var width = chart.chart.width;
          var height = chart.chart.height;
          // if (this.ctx != null) {
          //   this.ctx = null
          // }
          this.ctx = chart.chart.ctx;
          this.ctx.clearRect(0, 0, chart.width, chart.height);
          this.ctx.restore();
          var fontSize = (height / 200).toFixed(2);
          this.ctx.font = fontSize + "em sans-serif";
          this.ctx.textBaseline = "middle";

          var text = hours + "H";
          var textX = Math.round((width - this.ctx.measureText(text).width) / 2);
          var textY = height / 1.9;

          this.ctx.fillText(text, textX, textY);
          this.ctx.save();

          fontSize = (height / 300).toFixed(2);
          this.ctx.font = fontSize + "em sans-serif";
          this.ctx.textBaseline = "middle";

          text = night_hours + "H at night";
          textX = Math.round((width - this.ctx.measureText(text).width) / 2);
          textY = height / 1.6;

          this.ctx.fillText(text, textX, textY);
          this.ctx.save();
          // this.ctx = this.ctx
          // console.log(this.ctx)
         }
       });
       Chart.plugins.unregister(this.chartdata);
     }
   }
}
