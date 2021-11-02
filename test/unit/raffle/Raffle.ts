import { ethers, deployments, getNamedAccounts, getChainId } from "hardhat";
import { setupUser } from "../../utils";
import { shouldBehaveLikeRaffleDeploy } from "./Raffle.behavior";

const setup = deployments.createFixture(async () => {
  await deployments.fixture("raffle");
  const chainId = await getChainId();
  const contracts = {
    RaffleContract: await ethers.getContract("Raffle"),
    MockERC20Contract: await ethers.getContract("MockERC20"),
  };
  const { sponsor } = await getNamedAccounts();
  return {
    ...contracts,
    chainId: chainId,
    sponsor: await setupUser(sponsor, contracts),
  };
});

describe("Raffle Contract", function () {
  describe("Deployment", function () {
    beforeEach(async function () {
      this.setup = await setup();
    });
    shouldBehaveLikeRaffleDeploy();
  });
});
