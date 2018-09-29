var Election = artifacts.require("./Election.sol")
var Events = artifacts.require("./Events.sol")
var Charity = artifacts.require("./Charity.sol")

module.exports = function(deployer) {
    deployer.deploy(Election)
}

module.exports = deployer => deployer.deploy(Events)

module.exports = deployer => deployer.deploy(Charity)
