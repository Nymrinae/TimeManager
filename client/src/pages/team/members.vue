<template>
  <div>
    <Header message="Members of your team" />
  </div>
</template>

<script lang="ts">
import { Vue, Component } from 'nuxt-property-decorator'

@Component({ layout: 'dashboard' })
export default class Members extends Vue {

}
</script>

<style scoped>
</style>