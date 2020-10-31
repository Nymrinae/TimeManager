<template>
  <div>
    <Header message="Hello Nymrinae!" />
  </div>
</template>

<script lang="ts">
import { Component, Vue } from "nuxt-property-decorator";

@Component({ layout: 'dashboard' })
export default class DashboardPage extends Vue {}
</script>

<style scoped>
</style>