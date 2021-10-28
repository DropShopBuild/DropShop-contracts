// we import our utilities
import { setupUsers, setupUser } from "../../utils";

// We import the hardhat environment field we are planning to use
import { ethers, deployments, getNamedAccounts, getUnnamedAccounts } from "hardhat";

// we import our behavior tests
import { shouldBehaveLikeTokenDeploy, shouldBehaveLikeTokenTransaction } from "./Token.behavior";
import { Token } from "../../../types";

// we create a setup function that can be called by every test and setup variable for easy to read tests
async function setup() {
  // it first ensures the deployment is executed and reset (use of evm_snapshot for faster tests)
  await deployments.fixture(["Token"]);

  // we get an instantiated contract in the form of a ethers.js Contract instance:
  const contracts = {
    Token: await ethers.getContract("Token"),
  };

  // we get the account2
  const { account2 } = await getNamedAccounts();

  // Get the unnammedAccounts (which are basically all accounts not named in the config,
  // This is useful for tests as you can be sure they have noy been given tokens for example)
  // We then use the utilities function to generate user objects
  // These object allow you to write things like `users[0].Token.transfer(....)`
  const users = await setupUsers(await getUnnamedAccounts(), contracts);
  // finally we return the whole object (including the account2 setup as a User object)
  return {
    ...contracts,
    users,
    account2: await setupUser(account2, contracts),
  };
}

// `describe` is a Mocha function that allows you to organize your tests. It's
// not actually needed, but having your tests organized makes debugging them
// easier. All Mocha functions are available in the global scope.

// `describe` receives the name of a section of your test suite, and a callback.
// The callback must define the tests of that section. This callback can't be
// an async function.
describe("Token contract", function () {
  // You can nest describe calls to create subsections.
  describe("Deployment", function () {
    // Arrange
    beforeEach(async function () {
      this.setup = await setup();
    });
    // Assert
    shouldBehaveLikeTokenDeploy();
  });

  describe("Transactions", function () {
    // Arrange
    beforeEach(async function () {
      this.setup = await setup();
    });
    // Act and assert
    shouldBehaveLikeTokenTransaction();
  });
});
