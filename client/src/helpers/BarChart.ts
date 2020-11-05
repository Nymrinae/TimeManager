import { Bar } from 'vue-chartjs'

export default {
  extends: Bar,
  name: "BarChart",
  props: ['data', 'options'],
  mounted () {
    console.log("bar chart log",this.data)
    this.renderChart(this.data, this.options)
  }
}
