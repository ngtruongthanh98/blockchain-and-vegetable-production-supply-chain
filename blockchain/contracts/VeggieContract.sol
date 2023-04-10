pragma solidity >=0.4.22 <0.9.0;

contract VeggieContract {
  uint public id;

  constructor() public {
    createNewBlock('hello', 'world');
  }

  struct Veggie {
    // Can use hash and previous hash to use as a pointer, here we use auto increment id.
    /*
      bytes32 prevHash = blockchain.length == 0 ? bytes32(0) : blockchain[blockchain.length - 1].hash;
      bytes32 hash = keccak256(abi.encodePacked(blockchain.length, _data, prevHash, block.timestamp)); 
    */
    uint id;
    uint256 created;
    // Wallet who request blockchain network to add a block auto gen this field by msg.sender
    address from_wallet_address;
    address to_wallet_address;
    string from_wallet_contact;
    string from_wallet_location;
    string from_wallet_name;
    string consignment_number;
    string vegetable_type;
    string transaction_date;
    string pesticide;
    string certification;
    // For show the purpose of the block. (register company in blockchain (1 msg.sender address and company name and company info, etc with sender address attach to 1 node) or some user transaction or check quality (purpose why this block is added))
    string block_type;
  }

  mapping(uint => Veggie) public veggies;

  // Function to find the block when user register new entity in blockchain
  function findEntity {
    // for i in id:
    //    if veggies[i]["block_type"] == "create_new_entity" and veggies[i]["from_wallet_address"] == msg.sender:
    //       return veggies[i]
    //
    //  No block founded
    //  return false        
  }

  function createNewBlock (string memory_ to_wallet_address,string memory _from_wallet_contact,string memory _from_wallet_location,string memory _from_wallet_name,string memory _consignment_number,string memory _vegetable_type,string memory _transaction_date,string memory _pesticide,string memory _certification,string memory _block_type) public {
    id++;
    entity = findEntity;
    if not entity:
      entity = createEntity(msg.sender, string memory _from_wallet_contact,string memory _from_wallet_location,string memory _from_wallet_name)

    // Do some authorize here if you have it.
    veggies[id] = Veggie(id, block.timestamp, msg.sender, to_wallet_address, entity['from_wallet_contact'], entity['from_wallet_location'], entity['from_wallet_name'], consignment_number, vegetable_type, transaction_date, pesticide, certification, block_type);
  }

}