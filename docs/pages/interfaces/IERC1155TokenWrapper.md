## `IERC1155TokenWrapper`

This contract defines how to deposit and withdraw
tokens from other tokens. Events are emitted when actions
are taken.

This contract gets inherited by the main Drop Shop token contract.

### `deposit(uint256 parentID, enum IERC1155TokenWrapper.TokenType tokenType, address childAddress, uint256 nonFungibleID, uint256 fungibleAmount)` (external)

Deposit tokens into a parent token.

### `withdraw(uint256 parentID, address payable parentOwner)` (external)

Withdraw tokens from a parent token.

### `ChildDeposited(address sender, uint256 parentID, struct IERC1155TokenWrapper.ChildToken child)`

Emitted when a token gets deposited into a parent token.

### `ChildWithdrawn(address recipient, uint256 parentID, struct IERC1155TokenWrapper.ChildToken child, uint256 withdrawValue)`

Emitted when a token gets withdrawn from a parent token.

### `ChildToken`

    enum IERC1155TokenWrapper.TokenType
    tokenType


    address
    childAddress


    uint256
    nonFungibleID


    uint256
    fungibleAmount

### `TokenType`
