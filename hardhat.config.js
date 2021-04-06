require('dotenv').config();

module.exports = {
  solidity: {
    version: "0.8.2",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  },
  defaultNetwork: "hardhat",
  networks: {
    hardhat: {},
    mumbai: {
      url: "https://rpc-mumbai.maticvigil.com",
      accounts: [process.env.PRIVATE_KEY],
      saveDeployments: true
    },
    ropsten: {
      url: "https://eth-ropsten.alchemyapi.io/v2/"+process.env.ALCHEMY_KEY,
      accounts: [process.env.PRIVATE_KEY],
      saveDeployments: true
    }
  }
};
