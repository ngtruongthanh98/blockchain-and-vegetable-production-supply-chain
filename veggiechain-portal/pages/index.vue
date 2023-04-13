<template>
  <div>
    <VmHero />
    <VmSubheader />
  </div>
</template>

<script>
import VmHero from '@/components/hero/Hero'
import VmSubheader from '@/components/subheader/Subheader'
import { loadContract, addNewBlockAndReadIt } from '../utils/loadContract';

export default {
  name: 'index',
  components: {
    VmHero,
    VmSubheader,
  },
  async mounted() {
    loadContract()
  },
  methods: {
  }
}
</script>
