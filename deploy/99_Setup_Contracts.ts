/* eslint-disable node/no-unpublished-import */
import { HardhatRuntimeEnvironment } from "hardhat/types";
// eslint-disable-next-line node/no-missing-import
import { DeployFunction } from "hardhat-deploy/types";
import { Deployment } from "hardhat-deploy/dist/types";
import { networkConfig, autoFundCheck, autoFundCheckParams } from "../helper-hardhat-config";

const deploySetupContracts: DeployFunction = async function (hre: HardhatRuntimeEnvironment) {
  const { deployments, getNamedAccounts, getChainId } = hre;
  const { deploy, log, get } = deployments;
  const { deployer } = await getNamedAccounts();
  const chainId = await getChainId();
  let linkTokenAddress: string, linkToken: Deployment;
  let additionalMessage = "";
  //set log level to ignore non errors
  hre.ethers.utils.Logger.setLogLevel(hre.ethers.utils.Logger.levels.ERROR);
  const networkName = networkConfig[chainId]["name"];

  if (chainId == "31337") {
    linkToken = await get("LinkToken");
    linkTokenAddress = linkToken.address;
    additionalMessage = " --linkaddress " + linkTokenAddress;
  } else {
    linkTokenAddress = networkConfig[chainId].linkToken!;
  }

  const RandomNumberConsumer: Deployment = await deployments.get("RandomNumberConsumer");
  const randomNumberConsumer = await hre.ethers.getContractAt("RandomNumberConsumer", RandomNumberConsumer.address);
  const autoFundCheckValues: autoFundCheckParams = {
    contractAddr: randomNumberConsumer.address,
    networkName: networkName,
    linkTokenAddress: linkTokenAddress,
    additionalMessage: additionalMessage,
  };

  if (await autoFundCheck(autoFundCheckValues)) {
    await hre.run("fund-link", { contract: randomNumberConsumer.address, linkaddress: linkTokenAddress });
  } else {
    log("Then run RandomNumberConsumer contract with the following command:");
    log("npx hardhat request-random-number --contract " + randomNumberConsumer.address + " --network " + networkName);
  }
  log("----------------------------------------------------");
};

export default deploySetupContracts;
deploySetupContracts.tags = ["all"];
