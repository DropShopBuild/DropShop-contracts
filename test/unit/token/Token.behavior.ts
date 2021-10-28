// We import Chai to use its assertion functions here.
import { expect } from "chai";

export function shouldBehaveLikeTokenDeploy(): void {
  // `it` is another Mocha function. This is the one you use to define your
  // tests. It receives the test name, and a callback function.

  // If the callback function is async, Mocha will `await` it.
  it("Should set the right owner", async function () {
    const { Token, account2 } = this.setup;
    // Expect receives a value, and wraps it in an Assertion object. These
    // objects have a lot of utility methods to assert values.

    // This test expects the owner variable stored in the contract to be equal to our configured owner
    expect(await Token.owner()).to.equal(account2.address);
  });

  it("Should assign the total supply of tokens to the owner", async function () {
    const { Token, account2 } = this.setup;
    const ownerBalance = await Token.balanceOf(account2.address);
    expect(await Token.totalSupply()).to.equal(ownerBalance);
  });
}

export function shouldBehaveLikeTokenTransaction(): void {
  it("Should transfer tokens between accounts", async function () {
    const { Token, users, account2 } = this.setup;
    // Transfer 50 tokens from owner to users[0]
    await account2.Token.transfer(users[0].address, 50);
    const users0Balance = await Token.balanceOf(users[0].address);
    expect(users0Balance).to.equal(50);

    // Transfer 50 tokens from users[0] to users[1]
    // We use .connect(signer) to send a transaction from another account
    await users[0].Token.transfer(users[1].address, 50);
    const users1Balance = await Token.balanceOf(users[1].address);
    expect(users1Balance).to.equal(50);
  });

  it("Should fail if sender doesn’t have enough tokens", async function () {
    const { Token, users, account2 } = this.setup;
    const initialOwnerBalance = await Token.balanceOf(account2.address);

    // Try to send 1 token from users[0] (0 tokens) to owner (1000 tokens).
    // `require` will evaluate false and revert the transaction.
    await expect(users[0].Token.transfer(account2.address, 1)).to.be.revertedWith("Not enough tokens");

    // Owner balance shouldn't have changed.
    expect(await Token.balanceOf(account2.address)).to.equal(initialOwnerBalance);
  });

  it("Should update balances after transfers", async function () {
    const { Token, users, account2 } = this.setup;
    const initialOwnerBalance = await Token.balanceOf(account2.address);

    // Transfer 100 tokens from owner to users[0].
    await account2.Token.transfer(users[0].address, 100);

    // Transfer another 50 tokens from owner to users[1].
    await account2.Token.transfer(users[1].address, 50);

    // Check balances.
    const finalOwnerBalance = await Token.balanceOf(account2.address);
    expect(finalOwnerBalance).to.equal(initialOwnerBalance - 150);

    const users0Balance = await Token.balanceOf(users[0].address);
    expect(users0Balance).to.equal(100);

    const users1Balance = await Token.balanceOf(users[1].address);
    expect(users1Balance).to.equal(50);
  });
}
