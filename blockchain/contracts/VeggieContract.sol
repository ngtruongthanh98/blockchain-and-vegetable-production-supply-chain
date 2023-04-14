pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

contract VeggieContract {
  uint public id;

  string constant farmerStage = "Farmer";
  string constant factoryStage = "Factory";
  string constant distributorStage = "Distributor";
  string constant retailerStage = "Retailer";
  string constant customerStage = "Customer";


  mapping(uint => Veggie) public veggies;

  struct Veggie {
    uint id;
    uint256 created;
    string consignment;
    address from;
    address to;
    string stage;
    string comment;
  }

  constructor() public {
    id = 0;
    // createNewVieggiesBlock('carrot', 'nice', 'farm');
    // createNewVieggiesBlock('carrot', 'nicee', 'farm');
  }

  // utility function
  function isEqualStrings(string memory a, string memory b) public pure returns (bool) {
    return keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b));
  }

  // generate consignment for tracking
  function getRandomConsignment() public view returns (string memory) {
    bytes memory result = new bytes(32);
    uint256 rand = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender)));
    for (uint256 i = 0; i < 32; i++) {
      result[i] = bytes1(uint8(rand & 0xff));
      rand >>= 8;
    }
    return string(result);
  }

  function createNewVieggiesBlock (address _to, string memory _comment, string memory _stage) public {
    id++;
    if (isEqualStrings(_stage, farmerStage)) {
      veggies[id] = Veggie(id, block.timestamp, getRandomConsignment(), msg.sender, _to, _stage, _comment);
      return;
    }
    
    for (uint256 i = 1; i < id + 1; i++) {
      if (msg.sender == veggies[i].to) {
        // get consigments that delivered to the owner
        veggies[id] = Veggie(id, block.timestamp, veggies[i].consignment, msg.sender, _to, _stage, _comment);
      }
    }
  }

  function getVeggieBlocksWithStage(string memory _stage) public view returns (Veggie[] memory) {
    uint16 count = 0;
    uint16 stageCount = 0;

    for (uint256 i = 1; i < id + 1; i++) {
      if (isEqualStrings(_stage, veggies[i].stage)) {
        // get all matching stage blocks
        count++;
      }
    }


    Veggie[] memory res = new Veggie[](count);
    for (uint256 i = 1; i < id + 1; i++) {
      if (isEqualStrings(_stage, veggies[i].stage)) {
        res[stageCount] = veggies[i];
        stageCount++;
      }
    }

    return res;
  }
}