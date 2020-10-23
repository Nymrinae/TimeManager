import { Plugin } from '@nuxt/types'
import { initializeAxios } from '@/helpers/axiosInstance'

const accessor: Plugin = ({ $axios }) => {
  initializeAxios($axios)
}

export default accessor