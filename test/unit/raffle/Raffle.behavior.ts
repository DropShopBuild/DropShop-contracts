import { Raffle } from "../../../types/Raffle";
import { MockERC20 } from "../../../types/MockERC20";
import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/dist/src/signers";
import { networkConfig } from "../../../helper-hardhat-config";
import { expect } from "../../utils/chai-setup";

interface SetupInterface {
  chainId: string;
  sponsor: SignerWithAddress;
  RaffleContract: Raffle;
  MockERC20Contract: MockERC20;
}

export function shouldBehaveLikeRaffleDeploy(): void {
  it("Should have the correct sponsor", async function () {
    const { sponsor, RaffleContract } = this.setup as SetupInterface;
    expect(sponsor.address).to.equal(await RaffleContract.s_sponsor());
  });

  it("Should have the correct treasury token address", async function () {
    const { MockERC20Contract, RaffleContract } = this.setup as SetupInterface;
    expect(MockERC20Contract.address).to.equal(await RaffleContract.s_treasuryToken());
  });

  it("Should have the correct keyHash", async function () {
    const { chainId, RaffleContract } = this.setup as SetupInterface;
    expect(networkConfig[chainId].keyHash).to.equal(await RaffleContract.s_keyHash());
  });

  it("Should have the correct chainlinkFee", async function () {
    const { chainId, RaffleContract } = this.setup as SetupInterface;
    expect(networkConfig[chainId].chainlinkFee).to.equal(await RaffleContract.s_chainlinkFee());
  });

  it("Should have the correct entranceFee", async function () {
    const { chainId, RaffleContract } = this.setup as SetupInterface;
    expect(networkConfig[chainId].entranceFee).to.equal(await RaffleContract.s_entranceFee());
  });

  it("Should have the correct interval", async function () {
    const { chainId, RaffleContract } = this.setup as SetupInterface;
    expect(await RaffleContract.s_interval()).to.equal(networkConfig[chainId].keepersUpdateInterval);
  });

  it("Should have the correct raffle state", async function () {
    const { chainId, RaffleContract } = this.setup as SetupInterface;
    const enum raffleState {
      NOT_STARTED,
      OPEN,
      CALCULATING,
      FINISHED,
    }
    expect(raffleState.NOT_STARTED).to.equal(await RaffleContract.s_raffleState());
  });
}
