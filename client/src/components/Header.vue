<template>
  <div class="flex justify-between items-center mb-6">
    <p class="text-2xl font-semibold mb-2 lg:mb-0">{{ message }}</p>
    <button
      v-if="$route.name === 'dashboard'"
      class="bg-red-500 hover:bg-red-600 focus:outline-none rounded-lg px-6 py-2 text-white font-semibold shadow"
      :class="{ 'bg-blue-500 hover:bg-blue-600': working }"
      @click="working = !working"
    >
      Working
    </button>
  </div>
</template>

<script lang="ts">
import { Vue, Component, Prop, namespace } from 'nuxt-property-decorator'

const AppModule = namespace('app')

@Component
export default class Header extends Vue {
  @Prop() message!: string

  working: boolean = false
}
</script>

<style scoped>
</style>