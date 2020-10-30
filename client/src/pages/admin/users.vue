<template>
  <!-- <table class="table-auto w-full border">
    <thead>
      <tr>
        <th class="border px-4 py-2">ID</th>
        <th class="border px-4 py-2">Username</th>
        <th class="border px-4 py-2">Email</th>
        <th class="border px-4 py-2">Role</th>
        <th class="border px-4 py-2">Actions</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="i in 15"
        :key="i"
      >
        <td class="border px-4 py-2">1</td>
        <td class="border px-4 py-2">Nymrinae</td>
        <td class="border px-4 py-2">sylvain.nymrinae@gmail.com</td>
        <td class="border px-4 py-2">Admin</td>
        <td class="border px-4 py-2">
          <span> View Dashboard </span>
          <span> Delete </span>
        </td>
      </tr>
    </tbody>
  </table> -->
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
        v-for="i in 25"
        :key="i"
        class="bg-white lg:hover:bg-gray-100 flex lg:table-row flex-row lg:flex-row flex-wrap lg:flex-no-wrap mb-10 lg:mb-0"
      >
        <td class="w-full lg:w-auto p-3 text-gray-800 text-center border border-b block lg:table-cell relative lg:static">
          <span class="lg:hidden absolute top-0 left-0 bg-blue-200 px-2 py-1 text-xs font-bold uppercase">ID</span>
          {{ i }}
        </td>
        <td class="w-full lg:w-auto p-3 text-gray-800 text-center border border-b text-center block lg:table-cell relative lg:static">
          <span class="lg:hidden absolute top-0 left-0 bg-blue-200 px-2 py-1 text-xs font-bold uppercase">Username</span>
          Nymrinae
        </td>
        <td class="w-full lg:w-auto p-3 text-gray-800 text-center border border-b text-center block lg:table-cell relative lg:static">
          <span class="lg:hidden absolute top-0 left-0 bg-blue-200 px-2 py-1 text-xs font-bold uppercase">Email</span>
          sylvain.nymrinae@gmail.com
        </td>
        <td class="w-full lg:w-auto p-3 text-gray-800 text-center border border-b text-center block lg:table-cell relative lg:static">
          <span class="lg:hidden absolute top-0 left-0 bg-blue-200 px-2 py-1 text-xs font-bold uppercase">Role</span>
          {{ ['User', 'Manager', 'Admin'][Math.floor(Math.random() * 3)] }}
        </td>
        <td class="w-full lg:w-auto p-3 text-gray-800 text-center border border-b text-center block lg:table-cell relative lg:static">
          <span class="lg:hidden absolute top-0 left-0 bg-blue-200 px-2 py-1 text-xs font-bold uppercase">Actions</span>
          <a href="#" class="text-blue-400 hover:text-blue-600 underline">Edit</a>
          <a href="#" class="text-blue-400 hover:text-blue-600 underline pl-6">Remove</a>
        </td>
      </tr>
    </tbody>
  </table>
</template>

<script lang="ts">
import { Vue, Component } from 'nuxt-property-decorator'

@Component({ layout: 'dashboard' })
export default class Users extends Vue {
  categories = ['ID', 'Username', 'Email', 'Role', 'Actions']
}
</script>

<style scoped>
</style>