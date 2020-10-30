<template>
  <div> Admin can view all users here </div>
</template>

<script lang="ts">
import { Vue, Component } from 'nuxt-property-decorator'

@Component({ layout: 'dashboard' })
export default class Users extends Vue {

}
</script>

<style scoped>
</style>