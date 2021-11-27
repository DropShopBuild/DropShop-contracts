// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

/**
 * @author Colin Steidtmann
 * @title Tokens within tokens.
 * @notice This contract defines how to deposit and withdraw
 * tokens from other tokens. Events are emitted when actions
 * are taken.
 * @dev This contract gets inherited by the main Drop Shop token contract.
 */
interface IERC1155TokenWrapper {
    /* Holds the possible types a deposited token may be. */
    enum TokenType {
        NativeETH,
        ERC20,
        ERC721,
        ERC1155
    }

    /* Holds data associated with a specific token deposit */
    struct ChildToken {
        TokenType tokenType;
        address childAddress;
        uint256 nonFungibleID;
        uint256 fungibleAmount;
    }

    /**
     * @notice Emitted when a token gets deposited into a parent token.
     */
    event ChildDeposited(address indexed sender, uint256 indexed parentID, ChildToken child);

    /**
     * @notice Emitted when a token gets withdrawn from a parent token.
     */
    event ChildWithdrawn(address indexed recipient, uint256 parentID, ChildToken child, uint256 withdrawValue);

    /**
     * @notice Deposit tokens into a parent token.
     */
    function deposit(
        uint256 parentID,
        TokenType tokenType,
        address childAddress,
        uint256 nonFungibleID,
        uint256 fungibleAmount
    ) external payable;

    /**
     * @notice Withdraw tokens from a parent token.
     */
    function withdraw(uint256 parentID, address payable parentOwner) external;
}
