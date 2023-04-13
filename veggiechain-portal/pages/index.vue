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
  // async mounted() {
  //   await this.loadContract()
  // },
  methods: {
    async loadContract () {
      const provider = new Web3.providers.HttpProvider('http://localhost:7545');
      const web3 = new Web3(provider);

      console.log(web3)
      const myContract = new web3.eth.Contract(veggieContract.abi, veggieContract.networks[5777].address);
      console.log(veggieContract)

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
