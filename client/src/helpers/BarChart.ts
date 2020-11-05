// @ts-nocheck
import { Bar, mixins } from 'vue-chartjs'

export default {
  extends: Bar,
  name: "BarChart",
  props: {
    options: { type: Object, default: null },
  },
  mixins: [mixins.reactiveProp],
  mounted () {
    this.renderChart(this.chartData, this.options)
  }
}
