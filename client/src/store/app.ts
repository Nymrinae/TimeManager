import { Module, VuexModule, VuexMutation } from 'nuxt-property-decorator'

@Module({
  stateFactory: true,
  namespaced: true
})
export default class AppModule extends VuexModule {
  searchedUser: any = ''
  modalType: ModalType = 'create'
  sidebarOpen: boolean = false
  showUserModal: boolean = false
  confirmationPopUpState: boolean = false

  @VuexMutation changeSidebarState() {
    this.sidebarOpen = !this.sidebarOpen
  }

  @VuexMutation setUserModalType(modalType: ModalType) {
    this.modalType = modalType
  }

  @VuexMutation changeUserModalState() {
    this.showUserModal = !this.showUserModal
  }

  @VuexMutation changeConfirmationPopUpState() {
    this.confirmationPopUpState = !this.confirmationPopUpState
  }

  @VuexMutation searchUser(user: Event) {
    this.searchedUser = user
  }
}