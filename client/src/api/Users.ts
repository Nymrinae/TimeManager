import { $axios } from '@/helpers/axiosInstance'

const getAllUsers = async () => {
  const { data } = await $axios.get('/users')

  return data.users
}

const getUserById = async (userId: number) => {
  const { data } = await $axios.get(`/users/${userId}`)

  console.log(data)
}

const getUserByInfos = async (userInfos: UserInfo) => {
  const { username, email } = userInfos
  const { data } = await $axios.get(`/users?username=${username}&email=${email}`)

  console.log(data)
}

const createUser = async (userInfos: UserInfo) => {
  const { data } = await $axios.post('/users', userInfos)

  console.log(data)
}

const registerUser = async (userInfos: UserInfo) => {
  const { data } = await $axios.post('/register', userInfos)

  console.log(data)
}

const deleteUser = async (userId: number) => {
  const { data } = await $axios.delete(`/users/${userId}`)

  console.log(data)
}

const loginUser = async (userInfos: UserInfo) => {
  const { data } = await $axios.post('/login', userInfos)

  return { 
    token: data.token,
    user: data.user
  }
}

const updateUser = async (userId: number, userInfos: UserInfo) => {
  const { data } = await $axios.put(`/users/${userId}`, userInfos)
}

const logoutUser = async () => {
  const { data } = await $axios.get('/logout')
}

export {
  createUser,
  deleteUser,
  getAllUsers,
  getUserById,
  getUserByInfos,
  loginUser,
  registerUser,
  updateUser,
  logoutUser
}