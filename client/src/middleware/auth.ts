export default function ({ store, redirect }) {
  if (!store.state.user.currentUser)
    return redirect('/login')
}
