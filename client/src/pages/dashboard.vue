<template>
  <div>
    <Header :message="`Hello ${currentUser.username}!`" />
  </div>
</template>

<script lang="ts">
import { Component, Vue, namespace } from "nuxt-property-decorator"

const UserModule = namespace('user')

@Component({ layout: 'dashboard' })
export default class DashboardPage extends Vue {
  @UserModule.State currentUser
}
</script>

<style scoped>
</style>