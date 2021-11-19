const skip = true;
skip;
// import { networkConfig } from "../../../helper-hardhat-config";
// import { expect } from "../../utils/chai-setup";
// import { raffleStateEnum, SetupInterface } from "./helpers";

// export function shouldBehaveLikeRaffleDeploy(): void {
//   it("Should have the correct sponsor", async function () {
//     const { sponsor, RaffleContract } = this.setup as SetupInterface;
//     expect(sponsor.address).to.equal(await RaffleContract.s_sponsor());
//   });

//   it("Should have the correct treasury token address", async function () {
//     const { MockERC20Contract, RaffleContract } = this.setup as SetupInterface;
//     expect(MockERC20Contract.address).to.equal(await RaffleContract.s_treasuryToken());
//   });

//   it("Should have the correct keyHash", async function () {
//     const { chainId, RaffleContract } = this.setup as SetupInterface;
//     expect(networkConfig[chainId].keyHash).to.equal(await RaffleContract.s_keyHash());
//   });

//   it("Should have the correct chainlinkFee", async function () {
//     const { chainId, RaffleContract } = this.setup as SetupInterface;
//     expect(networkConfig[chainId].chainlinkFee).to.equal(await RaffleContract.s_chainlinkFee());
//   });

//   it("Should have the correct entranceFee", async function () {
//     const { chainId, RaffleContract } = this.setup as SetupInterface;
//     expect(networkConfig[chainId].entranceFee).to.equal(await RaffleContract.s_entranceFee());
//   });

//   it("Should have the correct interval", async function () {
//     const { chainId, RaffleContract } = this.setup as SetupInterface;
//     expect(await RaffleContract.s_interval()).to.equal(networkConfig[chainId].keepersUpdateInterval);
//   });

//   it("Should have the correct raffle state", async function () {
//     const { chainId, RaffleContract } = this.setup as SetupInterface;

//     expect(raffleStateEnum.NOT_STARTED).to.equal(await RaffleContract.s_raffleState());
//   });
// }

// export function shouldBehaveLikeRaffleStart(): void {
//   it("Should let a sponsor start the raffle", async function () {
//     const { sponsor, RaffleContract } = this.setup as SetupInterface;
//     await sponsor.RaffleContract.startRaffle();
//     expect(await RaffleContract.s_raffleState()).to.equal(raffleStateEnum.OPEN);
//   });

//   it("Should not let a non-sponsor start the raffle", async function () {
//     const { user } = this.setup as SetupInterface;
//     expect(user.RaffleContract.startRaffle()).to.be.reverted;
//   });

//   it("Should not let a sponsor start the raffle twice", async function () {
//     const { sponsor, RaffleContract } = this.setup as SetupInterface;
//     await sponsor.RaffleContract.startRaffle();
//     expect(await RaffleContract.s_raffleState()).to.equal(raffleStateEnum.OPEN);
//     expect(sponsor.RaffleContract.startRaffle()).to.be.revertedWith("Raffle must have not started yet.");
//   });
// }

// export function shouldBehaveLikeRaffleEnter(skipTitle: string): void {
//   it("Should let a user enter a raffle if they deposit enough.", async function () {
//     const { user, RaffleContract } = this.setup as SetupInterface;
//     await user.MockERC20Contract.approve(RaffleContract.address, this.entranceFee);
//     await expect(user.RaffleContract.enterRaffle(user.address, this.entranceFee)).to.not.be.reverted;
//   });

//   it("Should update the user and contracts token balance.", async function () {
//     const { user, RaffleContract, MockERC20Contract } = this.setup as SetupInterface;
//     await user.MockERC20Contract.approve(RaffleContract.address, this.entranceFee);
//     await expect(() => user.RaffleContract.enterRaffle(user.address, this.entranceFee)).to.changeTokenBalances(
//       MockERC20Contract,
//       [user.RaffleContract.signer, RaffleContract],
//       [(-this.entranceFee).toString(), this.entranceFee.toString()],
//     );
//   });

//   it("Should update the deposits mapping with the new entrant and their amount.", async function () {
//     const { user, RaffleContract, MockERC20Contract } = this.setup as SetupInterface;
//     await user.MockERC20Contract.approve(RaffleContract.address, this.entranceFee);
//     await user.RaffleContract.enterRaffle(user.address, this.entranceFee);
//     expect(await RaffleContract.s_deposits(user.address)).to.equal(this.entranceFee);
//   });

//   it("Should emit an DepositUpdate event when someone deposits a correct amount,", async function () {
//     const { user, RaffleContract, MockERC20Contract } = this.setup as SetupInterface;
//     await user.MockERC20Contract.approve(RaffleContract.address, this.entranceFee);
//     await expect(user.RaffleContract.enterRaffle(user.address, this.entranceFee))
//       .to.emit(RaffleContract, "DepositUpdate")
//       .withArgs(user.address, this.entranceFee);
//   });

//   it(skipTitle + "Should emit an DepositUpdate event twice when someone deposits an amount twice.", async function () {
//     const { sponsor, user, RaffleContract, MockERC20Contract } = this.setup as SetupInterface;
//     await sponsor.RaffleContract.startRaffle();
//     let depositAmount = (this.entranceFee * 2).toString();
//     await sponsor.MockERC20Contract.transfer(user.address, depositAmount);
//     await user.MockERC20Contract.approve(RaffleContract.address, depositAmount);
//     await user.RaffleContract.enterRaffle(user.address, this.entranceFee);
//     await expect(user.RaffleContract.enterRaffle(user.address, this.entranceFee))
//       .to.emit(RaffleContract, "DepositUpdate")
//       .withArgs(user.address, depositAmount);
//   });

//   it(skipTitle + "Should revert if user tries to enter without the raffle starting.", async function () {
//     const { sponsor, user, RaffleContract, MockERC20Contract } = this.setup as SetupInterface;
//     await sponsor.MockERC20Contract.transfer(user.address, this.entranceFee);
//     await user.MockERC20Contract.approve(RaffleContract.address, this.entranceFee);
//     await expect(user.RaffleContract.enterRaffle(user.address, this.entranceFee)).to.be.revertedWith(
//       "Raffle must be open.",
//     );
//   });

//   it(skipTitle + "Should revert if user tries to enter without approving Raffle contract first", async function () {
//     const { sponsor, user, RaffleContract, MockERC20Contract } = this.setup as SetupInterface;
//     await sponsor.RaffleContract.startRaffle();
//     await sponsor.MockERC20Contract.transfer(user.address, this.entranceFee);
//     await expect(user.RaffleContract.enterRaffle(user.address, this.entranceFee)).to.be.revertedWith(
//       "Token allowance too low.",
//     );
//   });

//   it(skipTitle + "Should revert if user tries to enter without enough tokens", async function () {
//     const { sponsor, user, RaffleContract, MockERC20Contract } = this.setup as SetupInterface;
//     await sponsor.RaffleContract.startRaffle();
//     await sponsor.MockERC20Contract.transfer(user.address, this.entranceFee);
//     await user.MockERC20Contract.approve(RaffleContract.address, this.entranceFee);
//     await expect(user.RaffleContract.enterRaffle(user.address, (this.entranceFee - 100).toString())).to.be.revertedWith(
//       "Not enough tokens.",
//     );
//   });
// }
