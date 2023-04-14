import Web3 from 'web3'
import veggieContract from '../../blockchain/build/contracts/VeggieContract.json'

export function loadContractMethods() {
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

  return myContract
}

export async function addNewBlockAndReadIt() {
  console.log("🚀 ~ file: loadContract.js:20 ~ addNewBlockAndReadIt ~ addNewBlockAndReadIt:")
  const contractMethods = loadContractMethods()
  contractMethods.createNewVieggiesBlock('Nhan', 'Deptrai').send({ from: '0x9C0436FCa52C00CB9023d1C06bbBCcd9b6276e34', gas: 500000 })
  .then(result => {
    console.log("🚀 ~ file: loadContract.js:29 ~ addNewBlockAndReadIt ~ result:", result)
  })
  .catch(e => {
    console.log("🚀 ~ file: loadContract.js:31 ~ addNewBlockAndReadIt ~ e:", e)   
  })

}

