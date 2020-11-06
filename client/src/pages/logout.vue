<template>
  <div> caca </div>
</template>

<script lang="ts">
import { Vue, Component } from 'nuxt-property-decorator'
import { logoutUser } from '../api/Users'

@Component
export default class Logout extends Vue {
  async mounted() {
    await logoutUser()

    this.$router.replace('/')
  }
}
</script>

<style scoped>
</style>