  <template>
  <div>
    <Header :message="`WorkingTimes Dashboard of ${currentUser.username}!`" />
    <button
      class="bg-red-500 hover:bg-red-600 focus:outline-none rounded-lg px-6 py-2 text-white font-semibold shadow"
      :class="{'bg-green-500 hover:bg-green-600': isWorking }"
      @click="setWorkingTime"
    >
    {{ this.isWorking ? "Working" : "Not Working" }}
    </button>
    <DoughnutChart v-if="loaded" :chartData="doughnutData" :options="doughnutOptions" :height="50" />
    <BarChart v-if="loaded" :chartData="barChartData" :options="barChartOptions" :height="100" />
    <div class="pt-8">
      <button
        class="bg-blue-500 hover:bg-red-600 focus:outline-none rounded-lg px-6 py-2 text-white font-semibold shadow"
        @click="decrement_week_nbr"
      >
        previous week
      </button>
      <button
        class="bg-blue-500 hover:bg-red-600 focus:outline-none rounded-lg px-6 py-2 text-white font-semibold shadow"
        @click="increment_week_nbr"
      >
        next week
      </button>
    </div>
  </div>
</template>

<script lang="ts">
// @ts-nocheck
import BarChart from "../helpers/BarChart"
import DoughnutChart from "../helpers/DoughnutChart"
import { createWorkingTime } from '../api/WorkingTimes'
import { Component, Vue, namespace } from "nuxt-property-decorator"
import { getWorkingTimes } from '../api/WorkingTimes'

const UserModule = namespace('user')

@Component({
  layout: 'dashboard',
  middleware: 'auth',
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
  week_nbr: number = 0
  user_workingtimes: any = {}
  isWorking: boolean = false

  async mounted() {
    var workingtimes = await getWorkingTimes()
    console.log("workingtimes", workingtimes)
    var user_workingtimes = []
    for(var i = 0; i < workingtimes.length - 1; i++) {
      if(workingtimes[i].user_id == this.currentUser.id) {
        user_workingtimes.push(workingtimes[i])
        console.log("GETTINGIN")
      }
    }
    this.user_workingtimes = user_workingtimes
    this.user = this.get_datasets(this.user_workingtimes)
  }

  async setWorkingTime() {
    if (!this.isWorking) {
      await createWorkingTime({
        start: new Date().toISOString(),
        end: null,
        user_id: this.currentUser.id
      })

      this.isWorking = true
    } else {
      this.isWorking = false
    }
  }

  increment_week_nbr() {
    this.week_nbr++
    this.get_datasets(this.user_workingtimes)
  }
  decrement_week_nbr() {
    this.week_nbr--
    this.get_datasets(this.user_workingtimes)
  }
  get_datasets(datasets) {
    const day_start = 8 + 2
    const day_end = 18 + 2
    var night_hours = 0
    var night_hours_weeks = []

    const max_hour = 35
    var weeks = []
    var i = 0;
    let week = [];
    var last_day = 0
    var day_nbr =  0
    while(i != datasets.length) {
      let workingtime = datasets[i]
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
      if (last_day > day_nbr || i != datasets.length - 1) {
        if(day_nbr > new Date(datasets[i+1].start).getDay() - 1) {
          weeks.push(week)
          last_day = 0
          week = []
          night_hours_weeks.push(night_hours)
          night_hours = 0
        }
      } else {
        last_day = day_nbr
      }
      i++;
    }
    weeks.push(week)
    night_hours_weeks.push(night_hours)
    var week_total = {
      total: 0
    }
    if (this.week_nbr >= weeks.length && datasets.length > 0) {
      this.week_nbr = weeks.length -1
    } else if(this.week_nbr < 0 || datasets.length == 0) {
      this.week_nbr = 0
    }
    var looked_week = weeks[this.week_nbr]
    for(var j = 0; j != looked_week.length; j++) {
      if(looked_week[j] != undefined) {
        week_total["total"] += looked_week[j]
      }
    }
    week_total["over_time"] = (week_total["total"] - max_hour > 0) ? week_total["total"] - max_hour : 0
    week_total["normal_time"] = week_total["total"] - week_total["over_time"]
    this.datasets = datasets
    this.doughnutData = {
      total: week_total["total"],
      night_hours: night_hours_weeks[this.week_nbr],
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
          data: looked_week,
          backgroundColor: '#007ace',
        }
      ]
    }

    this.barChartOptions = {
      responsive: true,
      legend: {
        display: false
      },
      title: {
        display: false,
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
  }
  /* isWorking() {
    if (this.user_workingtimes.length > 0) {
      return !this.user_workingtimes[this.user_workingtimes.length-1].end
    }
    return false
  } */
}
</script>

<style scoped>
</style>
