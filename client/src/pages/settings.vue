<template>
  <div>
    <Header message="User Settings" />
  </div>
</template>

<script lang="ts">
import { Vue, Component } from 'nuxt-property-decorator'

@Component({
  layout: 'dashboard',
  middleware: 'auth'
})
export default class SettingsPage extends Vue {

}
</script>

<style scoped>
</style>