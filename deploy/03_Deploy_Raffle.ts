import { HardhatRuntimeEnvironment } from "hardhat/types";
import { DeployFunction } from "hardhat-deploy/types";
import { networkConfig } from "../helper-hardhat-config";
import { Deployment } from "hardhat-deploy/dist/types";

const deployRaffle: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const { deployments, getNamedAccounts, getChainId } = hre;
  const { deploy, log, get } = deployments;
  const { deployer, sponsor } = await getNamedAccounts();
  const chainId = await getChainId();
  let linkTokenAddress,
    mockERC20Address,
    vrfCoordinatorAddress,
    linkToken: Deployment,
    mockERC20: Deployment,
    VRFCoordinatorMock: Deployment;
  let additionalMessage = "";

  if (chainId === "31337") {
    linkToken = await get("LinkToken");
    mockERC20 = await get("MockERC20");
    VRFCoordinatorMock = await get("VRFCoordinatorMock");
    linkTokenAddress = linkToken.address;
    mockERC20Address = mockERC20.address;
    vrfCoordinatorAddress = VRFCoordinatorMock.address;
    additionalMessage = " --linkaddress " + linkTokenAddress + " --mockERC20Address " + mockERC20Address;
  } else {
    linkTokenAddress = networkConfig[chainId].linkToken;
    mockERC20Address = networkConfig[chainId].mockERC20;
    vrfCoordinatorAddress = networkConfig[chainId].vrfCoordinator;
  }
  const keyHash: string = networkConfig[chainId].keyHash!;
  const chainlinkFee: string = networkConfig[chainId].chainlinkFee;
  const entranceFee: string = networkConfig[chainId].entranceFee;
  const interval: string = networkConfig[chainId].keepersUpdateInterval!;

  const raffle = await deploy("Raffle", {
    from: deployer,
    args: [
      sponsor,
      vrfCoordinatorAddress,
      linkTokenAddress,
      mockERC20Address,
      keyHash,
      chainlinkFee,
      entranceFee,
      interval,
    ],
    log: true,
  });
  const networkWorkName: string = networkConfig[chainId].name;

  log("Run the following command to fund contract with LINK:");
  log("npx hardhat fund-link --contract " + raffle.address + " --network " + networkWorkName + additionalMessage);
};
export default deployRaffle;
deployRaffle.tags = ["all", "raffle"];
