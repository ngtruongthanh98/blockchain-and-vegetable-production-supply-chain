<template>
  <div>
    <VmHero />
    <VmSubheader />
  </div>
</template>

<script>
import VmHero from '@/components/hero/Hero'
import VmSubheader from '@/components/subheader/Subheader'
import Web3 from 'web3'
import veggieContract from '@/build/contracts/VeggieContract.json'

export default {
  name: 'index',
  components: {
    VmHero,
    VmSubheader,
  },
}
</script>
