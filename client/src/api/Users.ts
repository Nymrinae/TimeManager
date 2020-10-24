import { $axios } from '@/helpers/axiosInstance'

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

const deleteUser = async (userId: number) => {
  const { data } = await $axios.delete(`/users/${userId}`)

  console.log(data)
}

const updateUser = async (userId: number, userInfos: UserInfo) => {
  const { data } = await $axios.put(`/users/${userId}`, userInfos)
}

export {
  createUser,
  deleteUser,
  getUserById,
  getUserByInfos,
  updateUser
}