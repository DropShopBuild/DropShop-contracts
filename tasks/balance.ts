import { task } from "hardhat/config";
import "@nomiclabs/hardhat-waffle";

task("balance", "Prints an account's balance")
  .addParam("account", "The account's address")
  .setAction(async (args, hre) => {
    const account = hre.ethers.utils.getAddress(args.account);
    const balance = await hre.ethers.provider.getBalance(account);

    console.log(hre.ethers.utils.formatEther(balance), "ETH");
  });

module.exports = {};
