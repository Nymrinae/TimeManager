// @ts-nocheck
import { Doughnut, mixins } from 'vue-chartjs'

export default {
  extends: Doughnut,
  name: "Doughnut",
  mixins: [mixins.reactiveProp],
  props: {
    options: { type: Object, default: null },
  },
  mounted () {
    this.renderChart(this.chartData, this.options)
  }
}
