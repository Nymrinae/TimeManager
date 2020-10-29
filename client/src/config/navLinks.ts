const navLinks: NavLinkProperties[] = [
  {
    id: 1,
    name: 'Dashboard',
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
    name: 'Logout',
    to: 'logout',
    scope: 'User'
  },
  {
    id: 4,
    name: 'View Members',
    to: 'members',
    logo: 'users',
    scope: 'Manager'
  },
  {
    id: 5,
    name: 'View Users',
    to: 'users',
    logo: 'users',
    scope: 'Admin'
  }
]

export default navLinks