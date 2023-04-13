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
import veggieContract from '@/build/contracts/VeggieContract.json'

export default {
  mounted() {
    this.loadContract()
  },
  methods: {
    async loadContract () {
      const provider = new Web3.providers.HttpProvider('http://localhost:7545');
      const web3 = new Web3(provider);

      const myContract = new web3.eth.Contract(veggieContract.abi, veggieContract.networks[5777].address);
      console.log("🚀 ~ file: Hero.vue:24 ~ loadContract ~ myContract:", this.$store.state.contract)

      if (!this.$store.state.contract)
        this.$store.commit('addContract', myContract)
      
      
      console.log(myContract.methods.veggies(1).call((err, result) => {
        if (err) {
          console.error(err);
        } else {
          console.log(result);
        }
      }));
      
    }
  }
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
