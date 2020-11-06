export default function ({ store, redirect }) {
  if (!['admin', 'manager'].includes(store.state.user.currentUser.role))
    return redirect('/dashboard')
}
