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
          <nav class="text-sm font-semibold mb-6" aria-label="Breadcrumb">
            <ol class="list-none p-0 inline-flex">
              <li class="flex items-center text-blue-500">
                <span>Home</span>
                <svg class="fill-current w-3 h-3 mx-3" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><path d="M285.476 272.971L91.132 467.314c-9.373 9.373-24.569 9.373-33.941 0l-22.667-22.667c-9.357-9.357-9.375-24.522-.04-33.901L188.505 256 34.484 101.255c-9.335-9.379-9.317-24.544.04-33.901l22.667-22.667c9.373-9.373 24.569-9.373 33.941 0L285.475 239.03c9.373 9.372 9.373 24.568.001 33.941z"/></svg>
              </li>
              <li class="flex items-center">
                <span> {{ $route.name.replace(/(^\w|\s\w)/g, c => c.toUpperCase()) }} </span>
              </li>
            </ol>
          </nav>
          <div class="lg:flex justify-between items-center mb-6">
            <p class="text-2xl font-semibold mb-2 lg:mb-0">Hello, Nymrinae!</p>
            <button class="bg-blue-500 hover:bg-blue-600 focus:outline-none rounded-lg px-6 py-2 text-white font-semibold shadow">Action Here</button>
          </div>
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