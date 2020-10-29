type UserInfo = {
  username?: string,
  password?: string,
  email?: string
}

type NavLinkProperties = {
  id: number,
  name: string,
  logo?: string,
  to: string,
  scope: 'User' | 'Manager' | 'Admin'
}