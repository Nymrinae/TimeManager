<template>
  <div>
    <div class="mb-4 px-4">
      <img
        src="https://eu.ui-avatars.com/api/?name=Nymrinae"
        alt="lovely avatar"
        class="object-cover object-center rounded-full visible group-hover:hidden ml-16 mb-4 w-24 h-24"
      />
      <p class="pl-4 text-sm font-semibold mb-1">NYMRINAE</p>
      <SidebarLink
        v-for="userLink in userLinks"
        :key="userLink.id"
        :sidebarLink="userLink"
      />
    </div>
  </div>
</template>

<script lang="ts">
import { Vue, Component } from 'nuxt-property-decorator'
import navLinks from '../config/navLinks'

@Component
export default class UserProfile extends Vue {
  userLinks: NavLinkProperties[] = navLinks.filter(link => link.scope === 'User')
}
</script>

<style scoped>
</style>