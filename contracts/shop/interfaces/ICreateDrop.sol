// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

/* Holds the possible states a Drop can be in. Used for actions that require specific preconditions. */
enum DropState {
    NOT_STARTED,
    OPEN,
    CALCULATING,
    FINISHED,
    CANCELLED
}

/* Holds all data associated with a specific drop. */
struct Drop {
    DropState state;
    address payable royaltyReceiver;
    address payable paymentReceiver;
    address treasuryToken;
    uint256[] nftIDs;
    uint256 pointsID;
    uint256 paymentsMapID;
    uint256 pointsMapID;
    uint256 paymentsPremium;
    uint256 pointsPremium;
    uint256 entranceFee;
    uint256 royaltyFee;
    uint256 duration;
    uint256 finalRandomNumber;
}

/**
 * @author Colin Steidtmann
 * @title Contract module to initialize a drop
 * @notice Create, edit, and/or cancel a drop.
 * Events are emmitted for different actions.
 */
interface ICreateDrop {
    /**
     * @notice Emitted when a drop has been created, started, in the process
     * of picking winners, finished, or cancelled.
     * @dev Emitted when a `dropID` drop moves into a `newState` DropState
     */
    event DropStateUpdated(DropState indexed newState, uint256 indexed dropID);

    /**
     * @dev Emitted when a drop has been initialized with an assigned `dropID`
     * and associated `drop` data.
     */
    event NewDrop(uint256 indexed dropID, Drop drop);

    /**
     * @dev Emitted when a `dropID` drop has been edited with with new
     * `editedDrop` data.
     */
    event DropEdited(uint256 indexed dropID, Drop editedDrop);

    /**
     * @notice Create a drop.
     * @dev Initialize a drop with a unique id that maps to its associated collection of drop data.
     *
     * Emits a {NewDrop} and a {DropStateUpdated} event.
     */
    function createDrop() external;

    /**
     * @notice Edit a drop.
     * @dev Let drop creators edit a drop by changing the drop's data.
     */
    function editDrop() external;

    /**
     * @notice Cancel a drop.
     * @dev Let drop creators cancel their drop.
     *
     * Emits a {DropStateUpdated} event.
     */
    function cancelDrop() external;

    /**
     * @notice Get info about a drop.
     * @dev Use a drop's unique id to look up and return its
     * associate drop data.
     */
    function dropInfo() external;
}
