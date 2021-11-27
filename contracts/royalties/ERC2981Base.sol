// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/introspection/ERC165.sol";
import "./interfaces/IERC2981Royalties.sol";

/**
 * @author dievardump
 * @title Base royality contract.
 * @notice Specifies royalities for token contracts. See {EIP-2981}
 * @dev Add ERC2981 support for 1155 contract. Define royalty struct.
 */
abstract contract ERC2981Base is ERC165, IERC2981Royalties {
    struct RoyaltyInfo {
        address recipient;
        uint24 amount;
    }

    /// @inheritdoc ERC165
    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return interfaceId == type(IERC2981Royalties).interfaceId || super.supportsInterface(interfaceId);
    }
}
