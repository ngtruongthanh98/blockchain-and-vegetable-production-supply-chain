const sha256 = require("crypto-js/sha256");

class Block {
  constructor(index, timestamp, data, previousHash) {
    this.index = index;
    this.timestamp = timestamp;
    this.data = data;
    this.previousHash = previousHash;
    this.hash = this.calculateHash();
  }

  calculateHash() {
    return sha256(
      this.index +
        this.timestamp +
        JSON.stringify(this.data) +
        this.previousHash
    ).toString();
  }
}

class Blockchain {
  constructor() {
    this.chain = [this.createGenesisBlock()];
  }

  createGenesisBlock() {
    return new Block(0, new Date(), "Genesis block", "0");
  }

  getLatestBlock() {
    return this.chain[this.chain.length - 1];
  }

  addBlock(data) {
    const lastBlock = this.getLatestBlock();
    const newBlock = new Block(
      lastBlock.index + 1,
      new Date(),
      data,
      lastBlock.hash
    );
    this.chain.push(newBlock);
  }

  isChainValid() {
    for (let i = 1; i < this.chain.length; i++) {
      const currentBlock = this.chain[i];
      const previousBlock = this.chain[i - 1];

      if (currentBlock.hash !== currentBlock.calculateHash()) {
        return false;
      }

      if (currentBlock.previousHash !== previousBlock.hash) {
        return false;
      }
    }

    return true;
  }
}

// Test
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

console.log("chain valid: ", veggiechain.isChainValid());
