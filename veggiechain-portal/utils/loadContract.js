import Web3 from 'web3'
import veggieContract from '../../blockchain/build/contracts/VeggieContract.json'

export function loadContract() {
  const provider = new Web3.providers.HttpProvider('http://localhost:7545');
  const web3 = new Web3(provider);
  const myContract = new web3.eth.Contract(veggieContract.abi, veggieContract.networks[5777].address);

  return myContract
}

