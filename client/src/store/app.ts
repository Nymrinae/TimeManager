import { Module, VuexModule, VuexMutation } from 'nuxt-property-decorator'

@Module({
  stateFactory: true,
  namespaced: true
})
export default class AppModule extends VuexModule {
  sidebarOpen: boolean = false
  searchedUser: any = null

  @VuexMutation changeSidebarState() {
    this.sidebarOpen = !this.sidebarOpen
  }

  @VuexMutation searchUser(user: Event) {
    this.searchedUser = user
  }
}