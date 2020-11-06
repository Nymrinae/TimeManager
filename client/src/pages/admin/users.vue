<template>
  <div>
    <Header message="Manage Users" />
    <UserModal />
    <ConfirmationPopUp v-if="confirmationPopUpState" />
    <div>
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
              {{ role.replace(/(^\w|\s\w)/g, c => c.toUpperCase()) }}
            </td>
            <td class="w-full lg:w-auto p-3 text-gray-800 text-center border border-b text-center block lg:table-cell relative lg:static">
              <span class="lg:hidden absolute top-0 left-0 bg-blue-200 px-2 py-1 text-xs font-bold uppercase">Team</span>
              {{ team || 'No team assigned' }}
            </td>
            <td class="w-full lg:w-auto p-3 text-gray-800 text-center border border-b text-center block lg:table-cell relative lg:static">
              <span class="lg:hidden absolute top-0 left-0 bg-blue-200 px-2 py-1 text-xs font-bold uppercase">Actions</span>
              <button class="px-5 py-2 border-blue-500 border text-blue-500 text-xs rounded transition duration-300 hover:bg-blue-700 hover:text-white focus:outline-none">
                <img src="@/assets/icons/dashboard.svg" class="w-4 h-4 mr-2" style="display: inline-block" />
                <span class="font-semibold"> View Dashboard </span>
              </button>
              <button @click="openEditModal({ id, username, email, role })" class="px-5 py-2 border-blue-500 border text-blue-500 text-xs rounded transition duration-300 hover:bg-blue-700 hover:text-white focus:outline-none">
                <img src="@/assets/icons/edit.svg" class="w-4 h-4 mr-2" style="display: inline-block" />
                <span class="font-semibold"> Edit User </span>
              </button>
              <button @click="removeUser({ id, username })" class="px-5 py-2 border-red-500 border text-red-500 text-xs rounded transition duration-300 hover:bg-red-700 hover:text-white focus:outline-none">
                <img src="@/assets/icons/clear.svg" class="w-4 h-4 mr-2" style="display: inline-block" />
                <span class="font-semibold"> Delete User </span>
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
  </div>
</template>

<script lang="ts">
import { Vue, Component, namespace } from 'nuxt-property-decorator'
import { getAllUsers, deleteUser } from '../../api/Users'

const AppModule = namespace('app')
const UserModule = namespace('user')

@Component({
  layout: 'dashboard',
  middleware: ['auth', 'admin']
})
export default class Users extends Vue {
  @AppModule.State searchedUser
  @AppModule.State confirmationPopUpState
  @AppModule.Mutation changeUserModalState
  @AppModule.Mutation changeConfirmationPopUpState
  @AppModule.Mutation setUserModalType
  @UserModule.Mutation setEditableUser
  @UserModule.Mutation setDeletableUser

  users: User[] = []
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

  async mounted() {
    const users = await getAllUsers()

    this.users = users
  }

  moveForward() {
    if (this.currentPage + 1 <= this.pages)
      this.currentPage++
  }

  moveBackward() {
    if (this.currentPage - 1 > 0)
      this.currentPage--
  }

  openEditModal(user) {
    this.setUserModalType('edit')
    this.setEditableUser(user)
    this.changeUserModalState()
  }

  async removeUser(user) {
    this.setDeletableUser(user)
    this.changeConfirmationPopUpState()
  }
}
</script>

<style scoped>
</style>