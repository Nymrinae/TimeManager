<template>
  <div>
    <div
      v-for="link in filteredNavLinks"
      :key="link.id"
      class="w-full flex items-center text-blue-400 h-10 pl-4 hover:bg-gray-200 rounded-lg cursor-pointer"
      :class="{ 'bg-gray-200': $route.name === link.name.toLowerCase() }"
      @click="openPath(link.to)"
    >
      <img
        :src="require(`../assets/icons/${link.logo || link.name.toLowerCase()}.svg`)"
        class="h-4 w-4 mr-4 fill-current"
      >
      <span class="text-gray-700"> {{ link.name }} </span>
    </div>
  </div>
</template>

<script lang="ts">
import { Vue, Component, Prop, namespace } from 'nuxt-property-decorator'
import navLinks from '../config/navLinks'

const AppModule = namespace('app')

@Component
export default class SidebarLink extends Vue {
  @Prop() scope!: 'User' | 'Manager' | 'Admin'
  @AppModule.State sidebarOpen
  @AppModule.Mutation changeSidebarState

  filteredNavLinks: NavLinkProperties[] = navLinks.filter(link => link.scope === this.scope)

  openPath(path) {
    if (this.sidebarOpen)
      this.changeSidebarState()

    this.$router.push(path)
  }
}
</script>

<style scoped>
</style>