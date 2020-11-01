import { Module, VuexModule, VuexMutation } from 'nuxt-property-decorator'

@Module({
  stateFactory: true,
  namespaced: true
})
export default class AppModule extends VuexModule {
  searchedUser: any = ''
  sidebarOpen: boolean = false
  showCreateUser: boolean = false

  @VuexMutation changeSidebarState() {
    this.sidebarOpen = !this.sidebarOpen
  }

  @VuexMutation changeCreateUserState() {
    this.showCreateUser = !this.showCreateUser
  }

  @VuexMutation searchUser(user: Event) {
    this.searchedUser = user
  }
}