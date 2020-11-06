import { $axios } from '@/helpers/axiosInstance'

const createWorkingTime = async () => {
}

const getWorkingTimes = async () => {
  const { data } = await $axios.get('/workingtimes')

  return data.data
}

const updateWorkingTime = async () => {

}

const deleteWorkingTime = async () => {

}

export {
  createWorkingTime,
  getWorkingTimes,
  updateWorkingTime,
  deleteWorkingTime
}
