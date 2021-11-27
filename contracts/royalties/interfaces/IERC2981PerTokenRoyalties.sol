// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

/**
 * @author dievardump
 * @title IERC2981PerTokenRoyalties
 * @notice Sets different royalties for different tokens and emits events when they're updated.
 */
interface IERC2981PerTokenRoyalties {
    /**
     * @dev Emitted when a new royalty gets set
     */
    event RoyaltySet(address indexed recipient, uint256 indexed tokenId, uint256 value);

    /**
     * @notice Update royalty info for a token with the royalty recipient and their
     * alloted royalty percentage.
     * @dev Update the `recipient` royalty with the royalty `value` for `tokenId` token.
     *
     * Requirements:
     * - `value` can't be greater than 10000 because it's a percentage
     * with two decimal places.
     *
     * @param tokenId the token id that we register the royalties for
     * @param recipient recipient of the royalties
     * @param value percentage (using 2 decimals: 10000 = 100; 0 = 0; 5555 = 55.55)
     */
    function setTokenRoyalty(
        uint256 tokenId,
        address recipient,
        uint256 value
    ) external;
}
