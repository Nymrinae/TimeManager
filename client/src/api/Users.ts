import { $axios } from '@/helpers/axiosInstance'

const createUser = async (username: string, email: string) => {
  const { data } = await $axios.post('/users', {
    username,
    email
  })

  console.log(data)
}

const deleteUser = async () => {

}

const getUser = async () => {
  const { data } = await $axios.get('/users')

  console.log(data)
}

const updateUser = async () => {

}

export {
  createUser,
  deleteUser,
  getUser,
  updateUser
}