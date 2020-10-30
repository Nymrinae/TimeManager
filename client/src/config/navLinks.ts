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
    to: '/settings',
    scope: 'User'
  },
  {
    id: 3,
    name: 'Logout',
    to: '/logout',
    scope: 'User'
  },
  {
    id: 4,
    name: 'View Members',
    to: '/team/members',
    logo: 'users',
    scope: 'Manager'
  },
  {
    id: 5,
    name: 'Create User',
    to: '/admin/user',
    logo: 'user',
    scope: 'Admin',
  },
  {
    id: 6,
    name: 'View Users',
    to: '/admin/users',
    logo: 'users',
    scope: 'Admin'
  },
  {
    id: 7,
    name: 'View Teams',
    to: '/admin/teams',
    logo: 'users',
    scope: 'Admin'
  }
]

export default navLinks