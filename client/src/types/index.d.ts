type UserInfo = {
  username?: string,
  password?: string,
  email?: string,
  role?: string
}

type User = {
  id: number,
  username: string,
  role: string
}

type NavLinkProperties = {
  id: number,
  name: string,
  logo?: string,
  to: string,
  scope: 'User' | 'Manager' | 'Admin'
}

type ModalType = 'create' | 'edit'