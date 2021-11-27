// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

/**
 * @author Colin Steidtmann
 * @title Contract module responsible for running/managing a drop
 * @notice Start a drop and/or enter a drop.
 * Events are emmitted for different actions.
 */
interface IRunDrop {
    /**
     * @notice Emitted when a drop receives a currency payment (eg. USDT).
     * @dev Emitted when a `sender` sends a `dropID` drop an `amount` in the form of the drop's
     * unit of account.
     */
    event NewPayment(address indexed sender, uint256 indexed dropID, uint256 amount);

    /**
     * @notice Emitted when a drop recieves a deposit of brand/sponsor points/tokens (eg. Nike Tokens)
     * @dev Emitted when a `sender` sends a `dropID` drop an `amount` in the form of the drop's
     * accepted brand/sponsor points/token.
     */
    event NewPointsDeposit(address indexed sender, uint256 indexed dropID, uint256 indexed pointsID, uint256 amount);

    /**
     * @notice Start a drop.
     * @dev Let a drop organizer start their drop.
     *
     * Emits a {DropStateUpdated} event defined in {ICreateDrop}
     */
    function startDrop() external;

    /**
     * @notice Enter a drop by depositing money.
     * @dev Transfer currency from the participant to the DropShop Contract
     *
     * Emits a {NewPayment} event.
     */
    function depositMoney() external;

    /**
     * @notice Increase your odds of winning by depositing sponsor tokens.
     * @dev Transfer sponsor tokens from the participant to the DropShop Contract
     *
     * Emits a {NewPointsDeposit} event.
     */
    function depositPoints() external;
}
