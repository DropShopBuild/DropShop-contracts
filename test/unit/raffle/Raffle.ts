import { assert, expect } from "chai";
import { ethers, deployments, getNamedAccounts, getChainId } from "hardhat";
import { string } from "yargs";
import { networkConfig } from "../../../helper-hardhat-config";
import { setupUser } from "../../utils";
import { raffleStateEnum, SetupInterface } from "./helpers";
import { shouldBehaveLikeRaffleDeploy, shouldBehaveLikeRaffleEnter } from "./Raffle.behavior";

const setup = deployments.createFixture(async () => {
  await deployments.fixture("raffle");
  const chainId = await getChainId();
  const contracts = {
    RaffleContract: await ethers.getContract("Raffle"),
    MockERC20Contract: await ethers.getContract("MockERC20"),
  };
  const { sponsor, user } = await getNamedAccounts();
  return {
    ...contracts,
    chainId: chainId,
    sponsor: await setupUser(sponsor, contracts),
    user: await setupUser(user, contracts),
  };
});

describe("Raffle Contract", function () {
  describe("Deployment", function () {
    beforeEach(async function () {
      this.setup = await setup();
    });
    shouldBehaveLikeRaffleDeploy();
  });

  describe("Start Raffle", function () {
    beforeEach(async function () {
      this.setup = await setup();
    });

    shouldBehaveLikeRaffleDeploy();
  });

  describe("Enter Raffle", function () {
    beforeEach(async function () {
      this.setup = await setup();
      const { sponsor, user, chainId, MockERC20Contract } = this.setup as SetupInterface;
      this.entranceFee = networkConfig[chainId].entranceFee;
      // More setup
      await sponsor.RaffleContract.startRaffle();
      await sponsor.MockERC20Contract.transfer(user.address, this.entranceFee);
      const userBalance = await MockERC20Contract.balanceOf(user.address);
      expect(userBalance).to.equal(this.entranceFee);
    });
    shouldBehaveLikeRaffleEnter();
  });
});
