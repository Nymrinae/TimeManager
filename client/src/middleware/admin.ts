export default function ({ store, redirect }) {
  if (store.state.user.currentUser.role != 'admin')
    return redirect('/dashboard')
}
