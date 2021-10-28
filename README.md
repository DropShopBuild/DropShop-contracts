# DropFI-contracts

## To-do

- Get comfortable with Chainlink+Hardhat contracts, tasks, and tests
- Start scaffolding our contracts

## References

- [Template](https://github.com/paulrberg/solidity-template) we are using
- [Chainlink hardhat starter-kit JS](https://github.com/smartcontractkit/hardhat-starter-kit)
- [Chainlink hardhat starter-kit TypeScript](https://github.com/smartcontractkit/hardhat-typescript-starter-kit) (not finished):
- [hardhat-deploy](https://github.com/wighawag/hardhat-deploy) plugin and a [tutorial](https://github.com/wighawag/tutorial-hardhat-deploy) for it
- [hardhat-deploy-ethers](https://github.com/wighawag/hardhat-deploy-ethers) plugin
- Writing [clean](https://www.wslyvh.com/clean-contracts/) smart-contracts
- Solidity [snippets](https://github.com/juanfranblanco/vscode-solidity/blob/master/snippets/solidity.json) for solidity vs-code plugin
- Solidity [docs](https://docs.soliditylang.org/en/v0.8.9/).
- Chainlink [docs](https://docs.chain.link/)

## From the template

> My favourite setup for writing Solidity smart contracts.

- [Hardhat](https://github.com/nomiclabs/hardhat): compile and run the smart contracts on a local development network

- [TypeChain](https://github.com/ethereum-ts/TypeChain): generate TypeScript types for smart contracts

- [Ethers](https://github.com/ethers-io/ethers.js/): renowned Ethereum library and wallet implementation

- [Waffle](https://github.com/EthWorks/Waffle): tooling for writing comprehensive smart contract tests

- [Solhint](https://github.com/protofire/solhint): linter

- [Solcover](https://github.com/sc-forks/solidity-coverage): code coverage

- [Prettier Plugin Solidity](https://github.com/prettier-solidity/prettier-plugin-solidity): code formatter

This is a GitHub template, which means you can reuse it as many times as you want. You can do that by clicking the "Use this

template" button at the top of the page.

## Usage

### Pre Requisites

Before running any command, you need to create a `.env` file and set a BIP-39 compatible mnemonic as an environment

variable. Follow the example in `.env.example`. If you don't already have a mnemonic, use this [website](https://iancoleman.io/bip39/) to generate one.

Then, proceed with installing dependencies:

```sh

yarn install

```

### Compile

Compile the smart contracts with Hardhat:

```sh

$ yarn compile

```

### TypeChain

Compile the smart contracts and generate TypeChain artifacts:

```sh

$ yarn typechain

```

### Lint Solidity

Lint the Solidity code:

```sh

$ yarn lint:sol

```

### Lint TypeScript

Lint the TypeScript code:

```sh

$ yarn lint:ts

```

### Test

Run the Mocha tests:

```sh

$ yarn test

```

### Coverage

Generate the code coverage report:

```sh

$ yarn coverage

```

### Report Gas

See the gas usage per unit test and average gas per method call:

```sh

$ REPORT_GAS=true yarn test

```

### Clean

Delete the smart contract artifacts, the coverage reports and the Hardhat cache:

```sh

$ yarn clean

```

### Deploy

Deploy the contracts to Hardhat Network:

```sh

$ yarn deploy --greeting "Bonjour, le monde!"

```

## Syntax Highlighting

If you use VSCode, you can enjoy syntax highlighting for your Solidity code via the

[vscode-solidity](https://github.com/juanfranblanco/vscode-solidity) extension. The recommended approach to set the

compiler version is to add the following fields to your VSCode user settings:

```json
{
  "solidity.compileUsingRemoteVersion": "v0.8.4+commit.c7e474f2",

  "solidity.defaultCompiler": "remote"
}
```

Where of course `v0.8.4+commit.c7e474f2` can be replaced with any other version.
