// import { setupUsers, setupUser } from "../../utils";

// import { ethers, deployments, getNamedAccounts, getUnnamedAccounts } from "hardhat";
// const { networkConfig, autoFundCheck, developmentChains } = require("../../helper-hardhat-config");

// import { shouldBehaveLikeTokenDeploy, shouldBehaveLikeTokenTransaction } from "./RandomNumberConsumer.behavior";
// import { Token } from "../../../types";

// async function setup() {
//   const chainId = await getChainId();
//   await deployments.fixture(["mocks", "vrf"]);
//   const LinkToken = await deployments.get("LinkToken");
//   linkToken = await ethers.getContractAt("LinkToken", LinkToken.address);
//   const networkName = networkConfig[chainId]["name"];

//   const RandomNumberConsumer = await deployments.get("RandomNumberConsumer");
//   randomNumberConsumer = await ethers.getContractAt("RandomNumberConsumer", RandomNumberConsumer.address);

//   if (await autoFundCheck(randomNumberConsumer.address, networkName, linkTokenAddress, additionalMessage)) {
//     await hre.run("fund-link", {
//       contract: randomNumberConsumer.address,
//       linkaddress: linkTokenAddress,
//     });
//   }

//   const contracts = {
//     Token: await ethers.getContract("Token"),
//   };

//   const { account2 } = await getNamedAccounts();
//   const users = await setupUsers(await getUnnamedAccounts(), contracts);

//   return {
//     ...contracts,
//     users,
//     account2: await setupUser(account2, contracts),
//   };
// }

// describe("Random Number Consumer contract", function () {
//   describe("Deployment", function () {
//     beforeEach(async function () {
//       this.setup = await setup();
//     });
//     shouldBehaveLikeTokenDeploy();
//   });

//   describe("Transactions", function () {
//     beforeEach(async function () {
//       this.setup = await setup();
//     });
//     shouldBehaveLikeTokenTransaction();
//   });
// });
