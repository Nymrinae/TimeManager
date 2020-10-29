import { Module, VuexModule, VuexMutation } from 'nuxt-property-decorator'

@Module({
  stateFactory: true,
  namespaced: true
})
export default class AppModule extends VuexModule {
  sidebarOpen: boolean = false

  @VuexMutation setSidebarState() {
    this.sidebarOpen = !this.sidebarOpen
  }
}