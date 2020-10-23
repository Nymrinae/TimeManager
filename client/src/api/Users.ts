import { $axios } from '@/helpers/axiosInstance'

const createUser = async ({ username, email}) => {
  const { data } = await $axios.post('/users', {
    username,
    email
  })

  console.log(data)
}

const deleteUser = async () => {

}

const getUser = async () => {

}

const updateUser = async () => {

}

export {
  createUser,
  deleteUser,
  getUser,
  updateUser
}