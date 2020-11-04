import { Module, VuexModule, VuexMutation } from 'nuxt-property-decorator'

@Module({
  stateFactory: true,
  namespaced: true
})
export default class UserModule extends VuexModule {
  currentUser: User | null = null

  @VuexMutation setUser(user: User) {
    this.currentUser = user
  }
}