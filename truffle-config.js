const HDWalletProvider = require('truffle-hdwallet-provider');
const infuraKey = "464540b13e6e42f6a9d1d9589ebed94a";

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