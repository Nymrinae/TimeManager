<template>
  <div>
    <Header message="Manage Teams" />
  </div>
</template>

<script lang="ts">
import { Vue, Component } from 'nuxt-property-decorator'

@Component({ layout: 'dashboard' })
export default class Teams extends Vue {

}
</script>

<style scoped>
</style>