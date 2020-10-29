const navLinks: NavLinkProperties[] = [
  {
    id: 1,
    name: 'My Dashboard',
    logo: 'dashboard',
    to: '/dashboard',
    scope: 'User'
  },
  {
    id: 2,
    name: 'Settings',
    to: 'settings',
    scope: 'User'
  },
  {
    id: 3,
    name: 'View Members',
    to: 'members',
    logo: 'users',
    scope: 'Manager'
  }
]

export default navLinks