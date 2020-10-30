<template>
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
        v-for="{ id, username, email, role } in filteredUsers"
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
          <span class="lg:hidden absolute top-0 left-0 bg-blue-200 px-2 py-1 text-xs font-bold uppercase">Actions</span>
          <button class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded">
            <img src="@/assets/icons/edit.svg" class="fill-current w-4 h-4 mr-2" style="display: inline-block" />
            <span> Edit </span>
          </button>
          <button class="bg-transparent hover:bg-red-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded">
            <img src="@/assets/icons/clear.svg" class="fill-current w-4 h-4 mr-2" style="display: inline-block" />
            <span> Delete </span>
          </button>
        </td>
      </tr>
    </tbody>
  </table>
</template>

<script lang="ts">
import { Vue, Component, namespace } from 'nuxt-property-decorator'

const AppModule = namespace('app')

@Component({ layout: 'dashboard' })
export default class Users extends Vue {
  @AppModule.State searchedUser
  categories = ['ID', 'Username', 'Email', 'Role', 'Actions']

  get filteredUsers() {
    return this.users.filter(u => u.username.toLowerCase().indexOf(this.searchedUser.toLowerCase()) != -1)
  }

  users = [
    {  id: 1, username: 'Nymrinae', email: 'menfou@gmail.com', role: 'Admin' },
    {  id: 2, username: 'Seraphae', email: 'menfou@gmail.com', role: 'User' },
    {  id: 3, username: 'Saphyrae', email: 'menfou@gmail.com', role: 'User' },
    {  id: 4, username: 'Test', email: 'menfou@gmail.com', role: 'User' },
    {  id: 5, username: 'Pseudo', email: 'menfou@gmail.com', role: 'User' },
    {  id: 6, username: 'Irelia', email: 'menfou@gmail.com', role: 'Manager' },
    {  id: 7, username: 'Renekton', email: 'menfou@gmail.com', role: 'Manager' },
    {  id: 8, username: 'Fiora', email: 'menfou@gmail.com', role: 'User' }
  ]
}
</script>

<style scoped>
</style>