// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

/**
 * @author Colin Steidtmann
 * @title Contract module responsible for finishing a drop and managing payouts and refunds.
 * @notice Create, edit, and/or cancel a drop.
 * Events are emmitted for different actions.
 */
interface IFinishDrop {
    /**
     * @notice Emitted when a drop receives the random number used to select the winners.
     * @dev  Emitted when a `dropID` drop receives a `randomNumber`
     */
    event RandomNumberReceived(uint256 indexed dropID, uint256 randomNumber);

    /**
     * @notice Emitted when a drop selects its final winners
     * @dev  Emitted when a `dropID` drop selects `winners`
     */
    event WinnersSelected(uint256 indexed dropID, address[] winners);
}
