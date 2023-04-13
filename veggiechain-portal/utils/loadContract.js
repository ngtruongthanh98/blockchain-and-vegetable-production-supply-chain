import Web3 from 'web3'
import veggieContract from '../../blockchain/build/contracts/VeggieContract.json'

export function loadContract () {
  const provider = new Web3.providers.HttpProvider('http://localhost:7545');
  const web3 = new Web3(provider);
  const myContract = new web3.eth.Contract(veggieContract.abi, veggieContract.networks[5777].address);
  console.log("🚀 ~ file: loadContract.js:8 ~ loadContract ~ myContract:", myContract)
  myContract.methods.id().call((err, result) => {
    if (err) {
      console.error(err);
    } else {
      console.log("🚀 ~ file: loadContract.js:14 ~ myContract.methods.id ~ result:", result)
    }
  });

  myContract.methods.veggies(4).call((err, result) => {
    if (err) {
      console.error(err);
    } else {
      console.log("🚀 ~ file: loadContract.js:14 ~ myContract.methods.veggies ~ result:", result)
    }
  });

  return myContract
}

export async function addNewBlockAndReadIt() {
  console.log("🚀 ~ file: loadContract.js:20 ~ addNewBlockAndReadIt ~ addNewBlockAndReadIt:")
  const contract = loadContract()
  contract.methods.createNewVieggiesBlock('Nhan', 'Deptrai').send({ from: '0x9C0436FCa52C00CB9023d1C06bbBCcd9b6276e34', gas: 500000 })
  .then(result => {
    console.log("🚀 ~ file: loadContract.js:29 ~ addNewBlockAndReadIt ~ result:", result)
  })
  .catch(e => {
    console.log("🚀 ~ file: loadContract.js:31 ~ addNewBlockAndReadIt ~ e:", e)   
  })

}

