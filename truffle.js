const HDWalletProvider = require('truffle-hdwallet-provider');
const infuraKey = "81ccfcd89e0543baa8b344965d46c9d6";

const fs = require('fs');
const mnemonic = fs.readFileSync(".secret").toString().trim();

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*" // Match any network id
    },

    rinkeby: {
      provider: () => new HDWalletProvider(mnemonic, `https://rinkeby.infura.io/v3/${infuraKey}`),
      network_id: 4,
      gas: 8500000,
      gasPrice: 20000000000
    }
  }
};