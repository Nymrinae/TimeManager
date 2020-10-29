<template>
  <div
    class="w-full flex items-center text-blue-400 h-10 pl-4 hover:bg-gray-200 rounded-lg cursor-pointer"
    :class="{ 'bg-gray-200': this.$route.name === sidebarLink.name.toLowerCase() }"
  >
    <img
      :src="require(`../assets/icons/${this.sidebarLink.name.toLowerCase()}.svg`)"
      class="h-4 w-4 mr-4 fill-current"
    >
    <span class="text-gray-700"> {{ sidebarLink.name }} </span>
  </div>
</template>

<script lang="ts">
import { Vue, Component, Prop } from 'nuxt-property-decorator'

@Component
export default class SidebarLink extends Vue {
  @Prop() sidebarLink!: NavLinkProperties
}
</script>

<style scoped>
</style>