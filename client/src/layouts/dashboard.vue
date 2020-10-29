<template>
  <div class="leading-normal tracking-normal" id="main-body">
    <div class="flex flex-wrap">
      <Sidebar />
      <div
        class="w-full bg-gray-100 pl-0 lg:pl-64 min-h-screen"
        :class="{'overlay': sidebarOpen }"
        id="main-content"
      >
        <Navbar />
        <div class="p-6 bg-gray-100 mb-20">
          <router-view />
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Vue, namespace } from "nuxt-property-decorator";

const AppModule = namespace('app')

@Component
export default class Dashboard extends Vue {
  @AppModule.State sidebarOpen

}
</script>

<style scoped>
</style>