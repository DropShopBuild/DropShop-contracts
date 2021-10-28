import { task } from "hardhat/config";
import "@nomiclabs/hardhat-waffle";

task("block-number", "Prints the current block number", async (args, hre) => {
  await hre.ethers.provider.getBlockNumber().then(blockNumber => {
    console.log("Current block number: " + blockNumber);
  });
});

module.exports = {};
