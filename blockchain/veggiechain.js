const hash = require("crypto-js/sha256");

class Block {
  constructor(prevHash, data) {
    this.prevHash = prevHash;
    this.data = data;
    this.timeStamp = new Date();

    this.hash = this.calculateHash();
  }

  calculateHash() {
    return hash(
      this.prevHash + JSON.stringify(this.data) + this.timeStamp
    ).toString();
  }
}

class Blockchain {
  constructor() {
    const genesisBlock = new Block("0000", { isGenesis: true });

    this.chain = [genesisBlock];
  }

  getLastBlock() {
    return this.chain[this.chain.length - 1];
  }

  addBlock(data) {
    const lastBlock = this.getLastBlock();
    const newBlock = new Block(lastBlock.hash, data);

    this.chain.push(newBlock);
  }
}

// ! Test
const veggiechain = new Blockchain();
console.log(veggiechain);

veggiechain.addBlock({
  from: "Truong Thanh",
  to: "Gia Anh",
  amount: 100,
});
veggiechain.addBlock({
  from: "Truong Thanh",
  to: "Thanh Nhan",
  amount: 400,
});
veggiechain.addBlock({
  kind: "Carrot",
});

console.log(veggiechain.chain);
