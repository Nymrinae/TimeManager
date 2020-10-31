<template>
  <div>
    <Header message="Manage Users" />
    <table class="border-collapse w-full">
      <thead>
        <tr>
          <th
            v-for="(category, c) in categories"
            :key="c"
            class="p-3 font-bold uppercase bg-gray-200 text-gray-600 border border-gray-300 hidden lg:table-cell"
            v-html="category"
          />
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="{ id, username, email, team, role } in filteredUsers"
          :key="id"
          class="bg-white lg:hover:bg-gray-100 flex lg:table-row flex-row lg:flex-row flex-wrap lg:flex-no-wrap mb-10 lg:mb-0"
        >
          <td class="w-full lg:w-auto p-3 text-gray-800 text-center border border-b block lg:table-cell relative lg:static">
            <span class="lg:hidden absolute top-0 left-0 bg-blue-200 px-2 py-1 text-xs font-bold uppercase">ID</span>
            {{ id }}
          </td>
          <td class="w-full lg:w-auto p-3 text-gray-800 text-center border border-b text-center block lg:table-cell relative lg:static">
            <span class="lg:hidden absolute top-0 left-0 bg-blue-200 px-2 py-1 text-xs font-bold uppercase">Username</span>
            {{ username }}
          </td>
          <td class="w-full lg:w-auto p-3 text-gray-800 text-center border border-b text-center block lg:table-cell relative lg:static">
            <span class="lg:hidden absolute top-0 left-0 bg-blue-200 px-2 py-1 text-xs font-bold uppercase">Email</span>
            {{ email }}
          </td>
          <td class="w-full lg:w-auto p-3 text-gray-800 text-center border border-b text-center block lg:table-cell relative lg:static">
            <span class="lg:hidden absolute top-0 left-0 bg-blue-200 px-2 py-1 text-xs font-bold uppercase">Role</span>
            {{ role }}
          </td>
          <td class="w-full lg:w-auto p-3 text-gray-800 text-center border border-b text-center block lg:table-cell relative lg:static">
            <span class="lg:hidden absolute top-0 left-0 bg-blue-200 px-2 py-1 text-xs font-bold uppercase">Team</span>
            {{ team }}
          </td>
          <td class="w-full lg:w-auto p-3 text-gray-800 text-center border border-b text-center block lg:table-cell relative lg:static">
            <span class="lg:hidden absolute top-0 left-0 bg-blue-200 px-2 py-1 text-xs font-bold uppercase">Actions</span>
            <button class="bg-blue-500 hover:bg-blue-600 text-white font-bold uppercase text-xs px-4 py-2 rounded shadow hover:shadow-md outline-none focus:outline-none mr-1 mb-1" type="button" style="transition: all .15s ease">
              <img src="@/assets/icons/edit.svg" class="w-4 h-4 mr-2" style="display: inline-block" />
              <span> Edit </span>
            </button>
            <button class="bg-red-500 hover:bg-red-600 text-white font-bold uppercase text-xs px-4 py-2 rounded shadow hover:shadow-md outline-none focus:outline-none mr-1 mb-1" type="button" style="transition: all .15s ease">
              <img src="@/assets/icons/clear.svg" class="w-4 h-4 mr-2" style="display: inline-block" />
              <span> Delete </span>
            </button>
          </td>
        </tr>
      </tbody>
    </table>
    <div class="bg-white px-4 pt-4 flex items-center justify-between border-t border-gray-200 bg-gray-100 sm:px-6">
      <div class="flex-1 flex justify-between sm:hidden">
        <a href="#" class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm leading-5 font-medium rounded-md text-gray-700 bg-white hover:text-gray-500 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 active:bg-gray-100 active:text-gray-700 transition ease-in-out duration-150">
          Previous
        </a>
        <a href="#" class="ml-3 relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm leading-5 font-medium rounded-md text-gray-700 bg-white hover:text-gray-500 focus:outline-none focus:shadow-outline-blue focus:border-blue-300 active:bg-gray-100 active:text-gray-700 transition ease-in-out duration-150">
          Next
        </a>
      </div>
      <div class="hidden sm:flex-1 sm:flex sm:items-center sm:justify-between">
        <div>
          <p class="text-sm leading-5 text-gray-700">
            Showing {{ pageRangeMin }} to {{ pageRangeMax }} of {{ users.length }} results
          </p>
        </div>
        <div>
          <nav class="relative z-0 inline-flex shadow-sm">
            <span @click="moveBackward" class="cursor-pointer relative inline-flex items-center px-2 py-2 rounded-l-md border border-gray-300 bg-white text-sm leading-5 font-medium text-gray-500 hover:text-gray-400 focus:z-10 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue active:bg-gray-100 active:text-gray-500 transition ease-in-out duration-150" aria-label="Previous">
              <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                <path fill-rule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd" />
              </svg>
            </span>
            <span
              v-for="i in pages"
              :key="i"
              @click="currentPage = i"
              class="-ml-px cursor-pointer relative inline-flex items-center px-4 py-2 border border-gray-300 bg-white text-sm leading-5 font-medium text-gray-700 hover:text-gray-500 focus:z-10 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue active:bg-gray-100 active:text-gray-700 transition ease-in-out duration-150"
            >
              {{ i }}
            </span>
            <span @click="moveForward" class="-ml-px cursor-pointer relative inline-flex items-center px-2 py-2 rounded-r-md border border-gray-300 bg-white text-sm leading-5 font-medium text-gray-500 hover:text-gray-400 focus:z-10 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue active:bg-gray-100 active:text-gray-500 transition ease-in-out duration-150" aria-label="Next">
              <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd" />
              </svg>
            </span>
          </nav>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { Vue, Component, namespace } from 'nuxt-property-decorator'

const AppModule = namespace('app')

@Component({ layout: 'dashboard' })
export default class Users extends Vue {
  @AppModule.State searchedUser
  currentPage: number = 1
  categories = ['ID', 'Username', 'Email', 'Role', 'Team', 'Actions']

  get filteredUsers() {
    return this.users
      .filter(u => u.username.toLowerCase().indexOf(this.searchedUser.toLowerCase()) != -1)
      .slice(this.currentPage === 1 ? 0 : (this.currentPage - 1) * 10, this.currentPage * 10)
  }

  get pages() {
    return Math.floor(this.users.length / 10) + 1
  }

  get pageRangeMin() {
    if (this.currentPage == 1)
      return 1
    
    return (this.currentPage - 1) * 10 + 1
  }

  get pageRangeMax() {
    if (this.currentPage == 1)
      return this.users.length > 10 ? 10 : this.users.length
    
    return (this.currentPage - 1) * 10 + 9 > this.users.length ? this.users.length : (this.currentPage - 1) * 10 + 9
  }

  users = [
    { id: 1, username: 'Nymrinae', email: 'menfou@gmail.com', role: 'Admin', team: 'TimeManager_1' },
    { id: 2, username: 'Seraphae', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_1' },
    { id: 3, username: 'Saphyrae', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_1' },
    { id: 4, username: 'Test', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_7' },
    { id: 5, username: 'Pseudo', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_7' },
    { id: 6, username: 'Irelia', email: 'menfou@gmail.com', role: 'Manager', team: 'TimeManager_3' },
    { id: 7, username: 'Renekton', email: 'menfou@gmail.com', role: 'Manager', team: 'TimeManager_3' },
    { id: 8, username: 'Fiora', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_3' },
    { id: 9, username: 'Luffy', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_4' },
    { id: 10, username: 'Arima', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_4' },
    { id: 11, username: 'test', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_4' },
    { id: 12, username: 'test', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_9' },
    { id: 13, username: 'test', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_9' },
    { id: 14, username: 'test', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_4' },
    { id: 15, username: 'test', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_9' },
    { id: 16, username: 'test', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_9' },
    { id: 17, username: 'test', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_4' },
    { id: 18, username: 'test', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_9' },
    { id: 19, username: 'test', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_9' },
    { id: 20, username: 'test', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_4' },
    { id: 21, username: 'test', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_9' },
    { id: 22, username: 'test', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_9' },
    { id: 23, username: 'test', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_4' },
    { id: 24, username: 'test', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_9' },
    { id: 25, username: 'test', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_9' },
    { id: 26, username: 'test', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_4' },
    { id: 27, username: 'test', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_9' },
    { id: 28, username: 'test', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_9' },
    { id: 29, username: 'test', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_9' },
    { id: 30, username: 'test', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_4' },
    { id: 31, username: 'test', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_9' },
    { id: 32, username: 'caca', email: 'menfou@gmail.com', role: 'User', team: 'TimeManager_9' }
  ]

  moveForward() {
    if (this.currentPage + 1 <= this.pages)
      this.currentPage++
  }

  moveBackward() {
    if (this.currentPage - 1 > 0)
      this.currentPage--
  }
}
</script>

<style scoped>
</style>