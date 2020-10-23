<template>
  <div class="body-bg min-h-screen pt-12 md:pt-20 pb-6 px-2 md:px-0">
    <header class="max-w-lg mx-auto">
        <a href="#">
            <h1 class="text-4xl font-bold text-white text-center">TimeManager</h1>
        </a>
    </header>

    <main class="bg-white max-w-lg mx-auto p-8 md:p-12 my-10 rounded-lg shadow-2xl">
        <section>
            <h3 class="font-bold text-2xl">Log In</h3>
            <p class="text-gray-600 pt-2">Already registered ? Log in to your account here</p>
        </section>

        <section class="mt-10">
            <form class="flex flex-col" method="POST" action="#">
                <div class="mb-6 pt-3 rounded bg-gray-200">
                    <input type="text" id="email" placeholder="Email" class="bg-gray-200 rounded w-full text-gray-700 focus:outline-none border-b-4 border-gray-300 focus:border-purple-600 transition duration-500 px-3 pb-3">
                </div>
                <div class="mb-6 pt-3 rounded bg-gray-200">
                    <input type="password" id="password" placeholder="Password" class="bg-gray-200 rounded w-full text-gray-700 focus:outline-none border-b-4 border-gray-300 focus:border-purple-600 transition duration-500 px-3 pb-3">
                </div>
                <!-- <div class="flex justify-end">
                    <a href="#" class="text-sm text-blue-600 hover:text-blue-700 hover:underline mb-6">Forgot your password?</a>
                </div> -->
                <button class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 rounded shadow-lg hover:shadow-xl transition duration-200" type="submit">Log In</button>
            </form>
        </section>
    </main>

    <div class="max-w-lg mx-auto text-center mt-12 mb-6">
        <p class="text-white">Don't have an account? <nuxt-link to="/register" class="font-bold hover:underline">Sign up</nuxt-link>.</p>
    </div>
  </div>
</template>

<script lang="ts">
import Vue from 'vue'

export default Vue.extend({})
</script>

<style scoped>
.body-bg {
    background-color: #2a2a72;
    background-image: linear-gradient(315deg, #2a2a72 0%, #009ffd 74%);
}
</style>