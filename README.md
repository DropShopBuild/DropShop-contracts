# DropShop-contracts

### About

Smart contracts that organize decentralized drops and raffles.

Two main contracts:

- DropShop (DropShopComposition.sol)

  Composed of modules (like legos):

  - CreateDrop.sol
  - RunDrop.sol
  - FinishDrop.sol

- DropShopTokens (DropShopERC1155)

Each drop is assigned a unique id. All of its state variables are held in the DropShop contract. The DropShop contract emits events as people interact with drops (entering, exiting, editing, depositing, winning, etc). These events slowly build a subgraph a of the drop.

Fungible sponsor tokens (used to encourage community participation) and non-fungible or semi-fungible tokens (representing the item being dropped) are all held in the DropShop ERC1155 contract. This contract manages minting, burning, and transferring of tokens. It also lets sponsors deposit other ERC20, ERC721, and ERC1155 tokens into it.

### Folder Structure

```
╠═.github - scripts automatically ran by the CI/CD workflow
║
╠═.husky - git hooks
║
╠═.vscode - code editor specific configuration
║
╠═.yarn - yarn 2 dependencies
║
╠═ contracts
	║
    ╠══ archive - old contracts not in use
    ║
    ╠══ creators - manages permissions for ERC1166 tokens
    ║
    ╠══ mocks - contracts used for testing purposes
    ║
    ╠══ royalties - royalty modules for ERC1155 tokens based on EIP-2981
    ║
    ╠══ shop - platform contracts for creating, storing, running, and terminating drops.
    ║
    ╚══ tokens - platform erc155 contract and modules
╠═ deploy - scripts for hardhat-deploy plugin to deploy the contracts
╠═ docs - contract documentation generated from natspec comments using solidity-docgen
╠═ scripts
╠═ tasks - hardhat helper scripts
╚═  test - hardhat tests for smart-contracts
```

---

## Features

- [Hardhat](https://github.com/nomiclabs/hardhat): compile and run the smart contracts on a local development network

- [TypeChain](https://github.com/ethereum-ts/TypeChain): generate TypeScript types for smart contracts

- [Ethers](https://github.com/ethers-io/ethers.js/): renowned Ethereum library and wallet implementation

- [Waffle](https://github.com/EthWorks/Waffle): tooling for writing comprehensive smart contract tests

- [Solhint](https://github.com/protofire/solhint): linter

- [Solcover](https://github.com/sc-forks/solidity-coverage): code coverage

- [Prettier Plugin Solidity](https://github.com/prettier-solidity/prettier-plugin-solidity): code formatter

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

### Generate uml

See [sol2uml](https://github.com/naddison36/sol2uml#readme) documentation

```sh



$ npx sol2uml -h



```

### Generate documentation

See [solidity-docgen](https://github.com/OpenZeppelin/solidity-docgen#readme) documentation

```sh



$ npx solidity-docgen [ -i <input-dir> ] [ -o <output-dir> ] [ -t <templates-dir> ]



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


## Acknowledgements

Special thanks to GitBook as a Supporter! 

(DropShop is a proud GitBook Communitiy Member)

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
