<template>
  <div class="flex justify-between items-center mb-6">
    <p class="text-2xl font-semibold mb-2 lg:mb-0">{{ message }}</p>
    <button
      v-if="$route.name === 'dashboard'"
      class="bg-red-500 hover:bg-red-600 focus:outline-none rounded-lg px-6 py-2 text-white font-semibold shadow"
      :class="{ 'bg-blue-500 hover:bg-blue-600': working }"
    >
      Working
    </button>
    <button
      v-if="$route.path === '/admin/users'"
      class="bg-green-500 hover:bg-green-600 focus:outline-none rounded-lg px-6 py-2 text-white font-semibold shadow"
      @click="openCreateModal"
    >
      Create New User
    </button>
  </div>
</template>

<script lang="ts">
import { Vue, Component, Prop, namespace } from 'nuxt-property-decorator'

const AppModule = namespace('app')

@Component
export default class Header extends Vue {
  @AppModule.Mutation changeUserModalState
  @AppModule.Mutation setUserModalType

  @Prop() message!: string

  working: boolean = false

  openCreateModal() {
    this.setUserModalType('create')
    this.changeUserModalState()
  }
}
</script>

<style scoped>
</style>