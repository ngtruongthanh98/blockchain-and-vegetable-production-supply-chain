const VeggieContract = artifacts.require("VeggieContract.sol");

module.exports = function(deployer) {
  deployer.deploy(VeggieContract);
};
