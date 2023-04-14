pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

contract VeggieContract {
  uint public id;

  string constant farmerStage = "Farmer";
  string constant factoryStage = "Factory";
  string constant distributorStage = "Distributor";
  string constant retailerStage = "Retailer";
  string constant customerStage = "Customer";

  mapping(string => string) private previousStage;


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

    previousStage[factoryStage] = farmerStage;
    previousStage[distributorStage] = factoryStage;
    previousStage[retailerStage] = distributorStage;
    previousStage[customerStage] = retailerStage;
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

  function generateRandomStringWithSize(uint256 length) public view returns (string memory) {
    bytes memory characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    bytes memory result = new bytes(length);

    for (uint256 i = 0; i < length; i++) {
        uint256 charIndex = uint256(keccak256(abi.encodePacked(block.timestamp, i))) % characters.length;
        result[i] = characters[charIndex];
    }

    return string(result);
  }

  function createNewVieggiesBlock (address _to, string memory _comment, string memory _stage) public {
    id++;
    if (isEqualStrings(_stage, farmerStage)) {
      veggies[id] = Veggie(id, block.timestamp, generateRandomStringWithSize(20), msg.sender, _to, _stage, _comment);
      return;
    }
    
    for (uint256 i = 1; i < id + 1; i++) {
      if (msg.sender == veggies[i].to && isEqualStrings(veggies[i].stage, previousStage[_stage])) {
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

  function getVeggieStageByConsignment(string memory _consignment) public view returns (Veggie[] memory) {
    Veggie[] memory res = new Veggie[](5);

    uint16 count = 0;
    for (uint16 i = 1; i < id + 1; i++) {
      if (isEqualStrings(veggies[i].consignment, _consignment)) {
        // same consignment, add to result transaction
        if (count < 5) {
          res[count] = veggies[i];
        }
      }
    }

    return res;
  }

  function getVeggieByConsignmentAndStage(string memory _consignment, string memory _stage) public view returns (Veggie memory) {
    for (uint16 i = 1; i < id + 1; i++) {
      if (isEqualStrings(veggies[i].consignment, _consignment) && isEqualStrings(veggies[i].stage, _stage)) {
        // same consignment, add to result transaction
        return veggies[i];
      }
    }

    return Veggie(0, block.timestamp, "not found", msg.sender, msg.sender, _stage, "");
  }

  function getCommentFromFarmerByConsignment(string memory _consignment) public view returns (string memory) {
    for (uint16 i = 1; i < id + 1; i++) {
      if (isEqualStrings(veggies[i].consignment, _consignment) && isEqualStrings(veggies[i].stage, farmerStage)) {
        return veggies[i].comment;
      }
    }

    return "not found";
  }
}