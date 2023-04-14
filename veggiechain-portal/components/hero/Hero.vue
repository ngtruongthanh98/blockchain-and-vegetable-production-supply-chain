<template>
  <div class="hero-wrapper">
    <h1 class="text-white text-4xl mb-5">VeggieChain</h1>
    <h2 class="text-white text-2xl">
      The blockchain solution for vegetable supply chain.
    </h2>
  </div>
</template>

<script>
import Web3 from 'web3'
import { loadContractMethods } from '@/utils/loadContract'

export default {
  data() {
    return {
      loadContract: {},
    }
  },
  mounted() {
    this.loadContract = loadContractMethods()

    if (!this.$store.state.contractMethods) {
      this.$store.commit('addContractMethods', this.loadContract.methods)
    }
  },
}
</script>

<style lang="scss" scoped>
.hero-wrapper {
  background-color: $primary-first;
  min-height: 300px;
  padding: 48px;

  display: flex;
  justify-content: center;
  flex-direction: column;
}
</style>
