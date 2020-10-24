<template>
  <div class="body-bg min-h-screen pt-12 md:pt-20 pb-6 px-2 md:px-0">
    <header class="max-w-lg mx-auto">
      <h1 class="text-4xl font-bold text-white text-center">TimeManager</h1>
    </header>

    <main
      class="bg-white max-w-lg mx-auto p-8 md:p-12 my-10 rounded-lg shadow-2xl"
    >
      <section>
        <h3 class="font-bold text-2xl">Register</h3>
        <p class="text-gray-600 pt-2">Create an account here. Totally free!</p>
        <p v-if="success" class="mt-4 -mb-4 text-green-700 font-bold text-center">
          Account successfully created!
          <nuxt-link to="/login" class="font-bold hover:underline text-black"> Login here </nuxt-link>
        </p>
        <p v-if="error" class="mt-4 -mb-4 text-red-700 font-bold text-center"> An error occured. </p>
      </section>

      <section class="mt-10">
        <div class="flex flex-col">
          <div class="mb-6 pt-3 rounded bg-gray-200">
            <input
              placeholder="Username"
              type="text"
              id="username"
              v-model="username"
              class="input bg-gray-200 rounded w-full text-gray-700 focus:outline-none border-b-4 border-gray-300 focus:border-purple-600 transition duration-500 px-3 pb-3"
            />
          </div>
          <div class="mb-6 pt-3 rounded bg-gray-200">
            <input
              placeholder="Email"
              type="text"
              id="email"
              v-model="email"
              class="input bg-gray-200 rounded w-full text-gray-700 focus:outline-none border-b-4 border-gray-300 focus:border-purple-600 transition duration-500 px-3 pb-3"
            />
          </div>
          <div class="mb-6 pt-3 rounded bg-gray-200">
            <input
              placeholder="Password"
              type="password"
              id="password"
              v-model="password"
              class="input bg-gray-200 rounded w-full text-gray-700 focus:outline-none border-b-4 border-gray-300 focus:border-purple-600 transition duration-500 px-3 pb-3"
            />
          </div>
          <div class="mb-6 pt-3 rounded bg-gray-200">
            <input
              placeholder="Confirm Password"
              type="password"
              id="confPassword"
              v-model="confPassword"
              class="input bg-gray-200 rounded w-full text-gray-700 focus:outline-none border-b-4 border-gray-300 focus:border-purple-600 transition duration-500 px-3 pb-3"
            />
          </div>
          <button
            class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 rounded shadow-lg hover:shadow-xl transition duration-200"
            @click="register"
          >
            Register
          </button>
        </div>
      </section>
    </main>

    <div class="max-w-lg mx-auto text-center mt-12 mb-6">
      <p class="text-white">
        Already have an account?
        <nuxt-link to="/login" class="font-bold hover:underline"
          >Login</nuxt-link
        >.
      </p>
      <p class="text-white">
        ← <nuxt-link class="hover:underline" to="/">Back to home</nuxt-link>
      </p>
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from "nuxt-property-decorator"
import { createUser } from '../api/Users'

@Component
export default class RegisterPage extends Vue {
  username: string = 'testfront'
  email: string = 'testfront@gmail.com'
  password: string = ''
  confPassword: string = ''
  success: boolean = false
  error: boolean = false

  async register() {
    const { username, email, password } = this

    if (this.validateForm()) {
      await createUser({ username, email, password })
      this.success = true
    } else {
      this.error = true
    }
  }

  validateForm() {
    const { username, email, password, confPassword } = this

    return username
      && email?.match(/^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+.[a-zA-Z0-9-.]+$/)
      && password === confPassword
  }
}
</script>

<style scoped>
.body-bg {
  background-color: #2a2a72;
  background-image: linear-gradient(315deg, #2a2a72 0%, #009ffd 74%);
}

.input::-webkit-input-placeholder {
  font-weight: bold;
}
</style>