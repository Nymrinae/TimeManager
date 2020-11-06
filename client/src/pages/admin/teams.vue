<template>
  <div>
    <Header message="Manage Teams" />
    <div class="w-full flex flex-wrap mb-4">
      <div
        v-for="team in teams"
        :key="team.id"
        class="w-full md:w-1/3 xl:w-1/4"
      >
        <div class="sm:max-w-sm rounded overflow-hidden shadow-lg pb-4">
          <div class="px-6 py-4" style="min-height: 260px !important">
            <div class="font-bold text-xl mb-2">{{ team.name }}</div>
            <div v-for="user in team.users" :key="user.id" class="flex flex content-center my-4">
              <div class="w-1/3"> {{ user.id }} </div>
              <div class="w-full"> {{ user.username }} </div>
              <div class="w-1/3 float-right">
              <span
                class="inline-block bg-red-500 rounded-full px-3 py-1 text-sm text-white font-semibold mr-2 cursor-pointer float-right">
                Remove
              </span>
              </div>
            </div>
          </div>
          <div class="px-6 pb-2">
            <span
              class="inline-block bg-blue-500 rounded-full px-3 py-1 text-sm text-white font-semibold mr-2 mb-2 cursor-pointer float-left">
              Add member
            </span>
            <span
              class="inline-block bg-red-500 rounded-full px-3 py-1 text-sm text-white font-semibold mr-2 mb-2 cursor-pointer float-right">
              Delete team
            </span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { Vue, Component } from 'nuxt-property-decorator'

@Component({
  layout: 'dashboard',
  middleware: ['auth', 'admin']
})
export default class Teams extends Vue {
  teams = [
  {
    id: 1,
    name: 'TimeManager_1',
    users: [
      { id: 1, username: 'Nymrinae' },
      { id: 2, username: 'Seraphae' },
      { id: 3, username: 'Saphyrae' },
      { id: 4, username: 'Seryae' }
    ]
  },
  {
    id: 7,
    name: 'TimeManager_7',
    users: [
      { id: 4, username: 'Test' },
      { id: 5, username: 'Pseudo' }
    ]
  },
  {
    id: 8,
    name: 'TimeManager_8',
    users: [
      { id: 4, username: 'Test' },
      { id: 5, username: 'Pseudo' },
    ]
  },
  {
    id: 9,
    name: 'TimeManager_9',
    users: [
      { id: 4, username: 'Test' },
      { id: 5, username: 'Pseudo' },
    ]
  }]
}
</script>

<style scoped>
</style>