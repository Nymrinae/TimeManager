<template>
  <div>
    <Header :message="`Hello ${currentUser.username}!`" />
    <DoughnutChart v-if="loaded" :data="doughnutData" :options="doughnutOptions" :height="50" />
    <BarChart v-if="loaded" :data="barChartData" :options="barChartOptions" :height="100" />
  </div>
</template>

<script lang="ts">
import BarChart from "../helpers/BarChart"
import DoughnutChart from "../helpers/DoughnutChart"
import { Component, Vue, namespace } from "nuxt-property-decorator"

const UserModule = namespace('user')

@Component({
  layout: 'dashboard',
  components: {
    BarChart,
    DoughnutChart,
  }
})
export default class DashboardPage extends Vue {
  @UserModule.State currentUser

  user: any = {}
  barChartOptions: any = {}
  doughnutData: any = {}
  barChartData: any = {}
  doughnutOptions: any = {}
  loaded = false

  async mounted() {
    console.log("cuurentUser",this.currentUser)
    this.currentUser["workingtimes"] = [
      {
        "start": "2012-04-23T08:25:43.511Z",
        "end": "2012-04-23T18:25:43.511Z"
      },
      {
        "start": "2012-04-24T08:25:43.511Z",
        "end": "2012-04-24T16:25:43.511Z"
      },
      {
        "start": "2012-04-25T10:25:43.511Z",
        "end": "2012-04-25T15:25:43.511Z"
      },
      {
        "start": "2012-04-27T10:25:43.511Z",
        "end": "2012-04-27T17:25:43.511Z"
      },
      {
        "start": "2012-04-28T06:25:43.511Z",
        "end": "2012-04-28T23:25:43.511Z"
      }
    ]
    this.user = this.get_datasets(this.currentUser)
  }
  get_datasets(datasets) {
    const day_start = 8 + 2
    const day_end = 18 + 2
    var night_hours = 0

    var week_nbr = 0
    const max_hour = 35
    var weeks = []
    var i = 0;
    let week = [];
    var last_day = 0
    var day_nbr =  0
    while(i != datasets.workingtimes.length) {
      let workingtime = datasets.workingtimes[i]
      console.log("workingtime", datasets.workingtimes)
      let start = new Date(workingtime.start)
      let end = new Date(workingtime.end)
      if(start.getHours() < day_start - 1) {
        night_hours += day_start - start.getHours()
      }
      if(end.getHours() > day_end + 1 || start.getDay() != end.getDay()) {
        if(end.getHours() > day_end + 1) {
          night_hours += end.getHours() - day_end
        }
        if(start.getDay() != end.getDay()) {
          night_hours += 24 - day_end + end.getHours()
        }
      }
      day_nbr = new Date(workingtime.start).getDay() - 1
      week[day_nbr] = week[day_nbr] > 0
        ? week[day_nbr] + (end - start) / (1000 * 3600)
        : (end - start) / (1000 * 3600)
      if (last_day > day_nbr || i != datasets.workingtimes.length - 1) {
        if(day_nbr > new Date(datasets.workingtimes[i+1].start).getDay() - 1) {
          weeks.push(week)
          last_day = 0
          week = []
        }
      } else {
        last_day = day_nbr
      }
      i++;
    }
    weeks.push(week)
    var week_total = {
      total: 0
    }
    for(var j = 0; j != weeks[week_nbr].length; j++) {
      if(weeks[week_nbr][j] != undefined) {
        week_total["total"] += weeks[week_nbr][j]
      }
    }
    week_total["over_time"] = (week_total["total"] - max_hour > 0) ? week_total["total"] - max_hour : 0
    week_total["normal_time"] = week_total["total"] - week_total["over_time"]
    this.datasets = datasets
    console.log("weeks", weeks)
    this.doughnutData = {
      total: week_total["total"],
      night_hours: night_hours,
      labels: [
        'Normal Hours',
        'Overtime Hours',
      ],
      datasets: [
        {
          data: [week_total["normal_time"], week_total["over_time"]],
          backgroundColor: ['#007ace', '#de3618'],
        }
      ]
    }

    this.doughnutOptions = {
      responsive: true,
      legend: {
      },
      title: {
        fontSize: 24,
        fontColor: '#6b7280'
      },
      tooltips: {
        backgroundColor: '#17BF62'
      },
    }

    this.barChartData = {
      labels: [
        'Monday',
        'Tuesday',
        'Wednesay',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday'
      ],
      datasets: [
        {
          label: 'Working Times',
          data: weeks[week_nbr],
          backgroundColor: '#007ace',
        }
      ]
    }

    console.log("datasets", this.barChartData)
    this.barChartOptions = {
      responsive: true,
      legend: {
        display: false
      },
      title: {
        display: true,
        text: 'Working Times Dashboard for ' + datasets.username,
        fontSize: 24,
        fontColor: '#6b7280'
      },
      tooltips: {
        backgroundColor: '#17BF62'
      },
      scales: {
        xAxes: [
          {
            gridLines: {
              display: true
            }
          }
        ],
        yAxes: [
          {
            ticks: {
              beginAtZero: true
            },
            gridLines: {
              display: true
            }
          }
        ]
      }
    }
    this.loaded = true
  //   return {
  //     datasets: datasets,
  //     doughnutData: {
  //       total: week_total["total"],
  //       night_hours: night_hours,
  //       labels: [
  //         'Normal Hours',
  //         'Overtime Hours',
  //       ],
  //       datasets: [
  //         {
  //           data: [week_total["normal_time"], week_total["over_time"]],
  //           backgroundColor: ['#007ace', '#de3618'],
  //         }
  //       ]
  //     },
  //     doughnutOptions: {
  //       responsive: true,
  //       legend: {
  //       },
  //       title: {
  //         fontSize: 24,
  //         fontColor: '#6b7280'
  //       },
  //       tooltips: {
  //         backgroundColor: '#17BF62'
  //       },
  //     },
  //     barChartData: {
  //       labels: [
  //         'Monday',
  //         'Tuesday',
  //         'Wednesay',
  //         'Thursday',
  //         'Friday',
  //         'Saturday',
  //         'Sunday'
  //       ],
  //       datasets: [
  //         {
  //           label: 'Working Times',
  //           data: weeks[week_nbr],
  //           backgroundColor: '#007ace',
  //         }
  //       ]
  //     },
  //     barChartOptions: {
  //       responsive: true,
  //       legend: {
  //         display: false
  //       },
  //       title: {
  //         display: true,
  //         text: 'Working Times Dashboard for ' + datasets.username,
  //         fontSize: 24,
  //         fontColor: '#6b7280'
  //       },
  //       tooltips: {
  //         backgroundColor: '#17BF62'
  //       },
  //       scales: {
  //         xAxes: [
  //           {
  //             gridLines: {
  //               display: true
  //             }
  //           }
  //         ],
  //         yAxes: [
  //           {
  //             ticks: {
  //               beginAtZero: true
  //             },
  //             gridLines: {
  //               display: true
  //             }
  //           }
  //         ]
  //       }
  //     }
  //   }
  }
}
</script>

<style scoped>
</style>
