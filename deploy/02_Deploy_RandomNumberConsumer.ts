/* eslint-disable node/no-missing-import */
// eslint-disable-next-line node/no-unpublished-import
import { HardhatRuntimeEnvironment } from "hardhat/types";
import { DeployFunction } from "hardhat-deploy/types";
import { networkConfig } from "../helper-hardhat-config";

const deployRandomNumberConsumer: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const { deployments, getNamedAccounts, getChainId } = hre;
  const { deploy, log, get } = deployments;
  const { deployer } = await getNamedAccounts();
  const chainId = await getChainId();
  let linkTokenAddress, vrfCoordinatorAddress;
  let additionalMessage = "";

  if (chainId === "31337") {
    const linkToken = await get("LinkToken");
    const VRFCoordinatorMock = await get("VRFCoordinatorMock");
    linkTokenAddress = linkToken.address;
    vrfCoordinatorAddress = VRFCoordinatorMock.address;
    additionalMessage = ` --linkaddress ${linkTokenAddress}`;
  } else {
    linkTokenAddress = networkConfig[chainId].linkToken;
    vrfCoordinatorAddress = networkConfig[chainId].vrfCoordinator;
  }
  const keyHash = networkConfig[chainId].keyHash;
  const fee = networkConfig[chainId].fee;

  const randomNumberConsumer = await deploy("RandomNumberConsumer", {
    from: deployer,
    args: [vrfCoordinatorAddress, linkTokenAddress, keyHash, fee],
    log: true,
  });

  log("Run the following command to fund contract with LINK:");
  log(
    `npx hardhat fund-link --contract ${randomNumberConsumer.address} --network ${networkConfig[chainId].name}${additionalMessage}`,
  );
  log("Then run RandomNumberConsumer contract with the following command");
  log(
    `npx hardhat request-random-number --contract ${randomNumberConsumer.address} --network ${networkConfig[chainId].name}`,
  );
  log("----------------------------------------------------");
};

module.exports.tags = ["all", "vrf"];
export default deployRandomNumberConsumer;
