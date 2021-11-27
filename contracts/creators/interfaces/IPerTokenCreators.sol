// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

/**
 * @author Colin Steidtmann
 * @title Role manager for sponsor/brand tokens
 * @notice Module for the the main assets contract.
 * Defines the creator role and specifies events
 */
interface IPerTokenCreators {
    /**
     * @notice Emitted when the creator of a token is set or transferred
     */
    event NewCreator(address indexed creator, uint256 indexed tokenId);

    /**
     * @notice Change the creator address for given tokens
     * @param to   Address of the new creator
     * @param ids  Array of Token IDs to change creator
     */
    function setCreator(address to, uint256[] memory ids) external;

    /**
     * @notice Get creator of a token
     * @param id Token ID
     * @return creator Creator of the token
     */
    function getCreator(uint256 id) external view returns (address creator);
}
