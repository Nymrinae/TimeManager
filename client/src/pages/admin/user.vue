<template>
  <div>
    <Header message="Create User" />
  </div>
</template>

<script lang="ts">
import { Vue, Component } from 'nuxt-property-decorator'

@Component({ layout: 'dashboard' })
export default class User extends Vue {

}
</script>

<style scoped>
</style>