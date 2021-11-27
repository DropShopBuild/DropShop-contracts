// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/introspection/ERC165.sol";
import "./interfaces/IERC2981PerTokenRoyalties.sol";
import "./ERC2981Base.sol";

/**
 * @author dievardump
 * @title Royalty manager for non-fungible or semi-fungible tokens.
 * @notice Royalties designed for ERC721 and ERC1155 tokens that have unique ids attached to them.
 * @dev Based on {EIP-2981}
 */
contract ERC2981PerTokenRoyalties is ERC2981Base, IERC2981PerTokenRoyalties {
    mapping(uint256 => RoyaltyInfo) private _royalties;

    /**
     * @notice See {IERC2981PerTokenRoyalties}
     * @dev Call so the internal function so that other contracts
     * can inherit this contract.
     *
     * Requirements:
     *
     * - `value` can't be greater than 10000 because it's a percentage
     * with two decimal places.
     */
    function setTokenRoyalty(
        uint256 tokenId,
        address recipient,
        uint256 value
    ) public virtual override {
        require(value <= 10000, "ERC2981Royalties: Too high");
        _setTokenRoyalty(tokenId, recipient, value);
    }

    /**
     * @notice See {IERC2981Royalties}
     */
    function royaltyInfo(uint256 tokenId, uint256 value)
        public
        view
        virtual
        override
        returns (address receiver, uint256 royaltyAmount)
    {
        RoyaltyInfo memory royalties = _royalties[tokenId];
        receiver = royalties.recipient;
        royaltyAmount = (value * royalties.amount) / 10000;
    }

    /**
     * @notice See {IERC2981PerTokenRoyalties}
     * @dev Update the royalties mapping stored in this contract.
     *
     * Emits {RoyaltySet} event defined in {IERC2981PerTokenRoyalties}
     */
    function _setTokenRoyalty(
        uint256 tokenId,
        address recipient,
        uint256 value
    ) internal virtual {
        _royalties[tokenId] = RoyaltyInfo(recipient, uint24(value));
        emit RoyaltySet(recipient, tokenId, value);
    }
}
