const skip = true;
skip;
// import { assert, expect } from "chai";
// import { ethers, deployments, getNamedAccounts, getChainId, getUnnamedAccounts } from "hardhat";
// import { networkConfig } from "../../../helper-hardhat-config";
// import { setupUser, setupUsers } from "../../utils";
// import { raffleStateEnum, SetupInterface } from "./helpers";
// import { shouldBehaveLikeRaffleDeploy, shouldBehaveLikeRaffleEnter } from "./Raffle.behavior";

// const setup = deployments.createFixture(async () => {
//   await deployments.fixture("raffle");
//   const chainId = await getChainId();
//   const contracts = {
//     RaffleContract: await ethers.getContract("Raffle"),
//     MockERC20Contract: await ethers.getContract("MockERC20"),
//   };
//   const { sponsor, user } = await getNamedAccounts();
//   const users = await setupUsers(await getUnnamedAccounts(), contracts);

//   return {
//     ...contracts,
//     chainId: chainId,
//     sponsor: await setupUser(sponsor, contracts),
//     user: await setupUser(user, contracts),
//     users: users,
//   };
// });

// describe("Raffle Contract", function () {
//   describe("Deployment", function () {
//     beforeEach(async function () {
//       this.setup = await setup();
//     });
//     shouldBehaveLikeRaffleDeploy();
//   });

//   describe("Start Raffle", function () {
//     beforeEach(async function () {
//       this.setup = await setup();
//     });

//     shouldBehaveLikeRaffleDeploy();
//   });

//   describe("Enter Raffle", function () {
//     const skipTitle: string = "(Skip beforeEach) ";
//     beforeEach(async function () {
//       this.setup = await setup();
//       const { sponsor, user, chainId, MockERC20Contract } = this.setup as SetupInterface;
//       this.entranceFee = networkConfig[chainId].entranceFee;

//       if (((this as any).currentTest.title as string).includes(skipTitle)) return;
//       // More setup
//       await sponsor.RaffleContract.startRaffle();
//       await sponsor.MockERC20Contract.transfer(user.address, this.entranceFee);
//       const userBalance = await MockERC20Contract.balanceOf(user.address);
//       expect(userBalance).to.equal(this.entranceFee);
//     });
//     shouldBehaveLikeRaffleEnter(skipTitle);
//   });

//   describe("Run Raffle", function () {
//     this.beforeEach(async function () {
//       this.setup = await setup();
//       // More setup
//       const { sponsor, users, MockERC20Contract, RaffleContract, chainId } = this.setup as SetupInterface;
//       this.entranceFee = networkConfig[chainId].entranceFee;
//       await sponsor.RaffleContract.startRaffle();
//       for (let user of users.slice(2, 6)) {
//         await sponsor.MockERC20Contract.transfer(user.address, this.entranceFee);
//         const userBalance = await MockERC20Contract.balanceOf(user.address);
//         expect(userBalance).to.equal(this.entranceFee);
//         await user.MockERC20Contract.approve(RaffleContract.address, this.entranceFee);
//         await user.RaffleContract.enterRaffle(user.address, this.entranceFee);
//       }
//     });

//     it("Should set up properly and have 3 users registered for the raffle", async function () {
//       const { RaffleContract } = this.setup as SetupInterface;
//       const events = RaffleContract.filters.DepositUpdate();
//       console.log(events);
//     });
//   });
// });
