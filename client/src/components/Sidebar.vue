<template>
  <!-- give the sidebar z-50 class so its higher than the navbar if you want to see the logo -->
  <!-- you will need to add a little "X" button next to the logo in order to close it though -->
  <div
    class="w-1/2 md:w-1/3 lg:w-64 fixed md:top-0 md:left-0 h-screen lg:block bg-gray-100 border-r z-30"
    :class="{ 'hidden': !sidebarOpen }"
    id="main-nav"
  >
    <div class="w-full h-20 border-b flex px-4 items-center mb-8">
      <p class="font-semibold text-2xl text-blue-400 pl-4">Time Manager</p>
    </div>

    <div class="mb-4 px-4">
      <img
        :src="`https://eu.ui-avatars.com/api/?name=${currentUser.username}`"
        alt="lovely avatar"
        class="object-cover object-center rounded-full visible group-hover:hidden ml-16 mb-8 w-24 h-24"
      />
      <p class="pl-4 text-sm font-semibold mb-1">{{ currentUser.username.toUpperCase() }}</p>
      <SidebarLink scope="User" />
    </div>
    <div v-if="['manager', 'admin'].includes(currentUser.role)" class="mb-4 px-4">
      <p class="pl-4 text-sm font-semibold mb-1">MANAGE TEAM</p>
      <SidebarLink scope="Manager" />
    </div>
    <div v-if="currentUser.role === 'admin'" class="mb-4 px-4">
      <p class="pl-4 text-sm font-semibold mb-1">MANAGE USERS</p>
      <SidebarLink scope="Admin" />
    </div>
  </div>
</template>

<script lang="ts">
import { Vue, Component, namespace } from 'nuxt-property-decorator'
import navLinks from '../config/navLinks'

const AppModule = namespace('app')
const UserModule = namespace('user')

@Component
export default class Sidebar extends Vue {
  @AppModule.State sidebarOpen
  @UserModule.State currentUser
}
</script>