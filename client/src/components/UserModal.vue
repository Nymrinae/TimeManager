<template>
  <div v-if="showUserModal" class="fixed z-10 inset-0 overflow-y-auto">
    <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">
      <div class="fixed inset-0 transition-opacity">
        <div class="absolute inset-0 bg-gray-100 opacity-75"></div>
      </div>
      <span class="hidden sm:inline-block sm:align-middle sm:h-screen"></span>&#8203;
      <div class="inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full" role="dialog" aria-modal="true" aria-labelledby="modal-headline">
        <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
          <div class="sm:flex sm:items-start">
            <div class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left">
              <h3 class="text-lg leading-6 font-medium text-gray-900 mb-4" id="modal-headline">
                {{ modalType.replace(/(^\w|\s\w)/g, c => c.toUpperCase()) }} an user
              </h3>
              <form class="w-full max-w-lg">
                <div class="flex flex-wrap -mx-3 mb-4">
                  <div class="w-full md:w-2/3 px-3 mb-4 md:mb-0">
                    <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
                      Username
                    </label>
                    <input
                      v-model="username"
                      class="appearance-none block w-full bg-gray-200 text-gray-700 border rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white"
                      type="text"
                      placeholder="Jane"
                    >
                    <!-- <p class="text-red-500 text-xs italic">Please fill out this field.</p> -->
                  </div>
                  <div class="w-full md:w-1/3 px-3 mb-4 md:mb-0">
                    <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-state">
                      Role
                    </label>
                    <div class="relative">
                      <select
                        class="block appearance-none w-full bg-gray-200 border border-gray-200 text-gray-700 py-3 px-4 pr-8 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                        v-model="role"
                      >
                        <option>user</option>
                        <option>manager</option>
                        <option>admin</option>
                      </select>
                      <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
                        <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/></svg>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="flex flex-wrap -mx-3 mb-4">
                  <div class="w-full px-3">
                    <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-password">
                      Email
                    </label>
                    <input
                      v-model="email"
                      class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                      type="text"
                      placeholder="example@gmail.com"
                    >
                  </div>
                  <div class="w-full px-3">
                    <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-password">
                      Password
                    </label>
                    <input
                      v-model="password"
                      class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                      type="password"
                      placeholder="******************"
                    >
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
        <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
          <span class="flex w-full rounded-md shadow-sm sm:ml-3 sm:w-auto">
            <button
              class="inline-flex justify-center w-full rounded-md border border-transparent px-4 py-2 bg-green-600 text-base leading-6 font-medium text-white shadow-sm hover:bg-green-500 focus:outline-none focus:border-green-700 focus:shadow-outline-red transition ease-in-out duration-150 sm:text-sm sm:leading-5"
              @click="modalType === 'create' ? addUser() : editUser()"
            >
              {{ modalType.replace(/(^\w|\s\w)/g, c => c.toUpperCase()) }}
            </button>
          </span>
          <span class="mt-3 flex w-full rounded-md shadow-sm sm:mt-0 sm:w-auto">
            <button
              class="inline-flex justify-center w-full rounded-md border border-gray-300 px-4 py-2 bg-white text-base leading-6 font-medium text-gray-700 shadow-sm hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue transition ease-in-out duration-150 sm:text-sm sm:leading-5"
              @click="closeModal"
            >
              Cancel
            </button>
          </span>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { Vue, Component, Watch, namespace } from 'nuxt-property-decorator'
import { createUser, updateUser } from '../api/Users'

const AppModule = namespace('app')
const UserModule = namespace('user')

@Component
export default class UserModal extends Vue {
  @AppModule.State modalType
  @AppModule.State showUserModal
  @AppModule.Mutation changeUserModalState
  @UserModule.State editableUser

  username: string = ''
  role: any = 'user'
  email: string = ''
  password: string = ''

  @Watch("editableUser")
  onEditableUserChanged() {
    const { username, role, email } = this.editableUser

    this.username = username
    this.role = role
    this.email = email
  }

  async addUser() {
    const { username, role, email, password } = this

    await createUser({
      username,
      email,
      password,
      role: role.toLowerCase()
    })

    this.changeUserModalState()
  }

  async editUser() {
    const { username, role, email, password } = this
    const userInfo = { username, role, email, password }

    await updateUser(this.editableUser.id, Object.entries(userInfo).reduce((a, [k,v]) => v ? (a[k] = v, a) : a, {}))
  }

  closeModal() {
    this.username = ''
    this.email = ''
    this.password = ''
    this.changeUserModalState()
  }
}
</script>

<style scoped>
</style>