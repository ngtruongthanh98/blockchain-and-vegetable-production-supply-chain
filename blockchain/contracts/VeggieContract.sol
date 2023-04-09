pragma solidity >=0.4.22 <0.9.0;

contract VeggieContract {
  uint public id;

  constructor() public {
    createNewVieggiesBlock('hello', 'world');
  }

  struct Veggie {
    uint id;
    uint256 created;
    string consignment;
    string comment;
    string stage;
  }

  mapping(uint => Veggie) public veggies;

  function createNewVieggiesBlock (string memory _consignment, string memory _comment) public {
    id++;
    veggies[id] = Veggie(id, block.timestamp, _consignment, _comment);
  }
}