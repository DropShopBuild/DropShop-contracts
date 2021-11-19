//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "./ERC1155PresetMinter.sol";
import "../extensions/royalties/ERC2981PerTokenRoyalties.sol";

/// @title Example of ERC1155 contract with ERC2981
/// @author Simon Fremaux (@dievardump)
/// @notice This is a mock, mint and mintBatch are not protected. Please do not use as-is in production
contract ERC1155WithRoyalties is ERC1155PresetMinter, ERC2981PerTokenRoyalties {
    constructor(string memory uri_) ERC1155PresetMinter(uri_) {
        /** */
    }

    /// @inheritdoc	ERC165
    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(ERC1155PresetMinter, ERC2981Base)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    /// @notice Mint amount token of type `id` to `to`
    /// @param to the recipient of the token
    /// @param id id of the token type to mint
    /// @param amount amount of the token type to mint
    /// @param royaltyRecipient the recipient for royalties (if royaltyValue > 0)
    /// @param royaltyValue the royalties asked for (EIP2981)
    function mint(
        address to,
        uint256 id,
        uint256 amount,
        address royaltyRecipient,
        uint256 royaltyValue,
        bytes memory data
    ) public virtual {
        ERC1155PresetMinter.mint(to, id, amount, data);

        if (royaltyValue > 0) {
            _setTokenRoyalty(id, royaltyRecipient, royaltyValue);
        }
    }

    /// @notice Mint several tokens at once
    /// @param to the recipient of the token
    /// @param ids array of ids of the token types to mint
    /// @param amounts array of amount to mint for each token type
    /// @param royaltyRecipients an array of recipients for royalties (if royaltyValues[i] > 0)
    /// @param royaltyValues an array of royalties asked for (EIP2981)
    function mintBatch(
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        address[] memory royaltyRecipients,
        uint256[] memory royaltyValues,
        bytes memory data
    ) public virtual {
        require(
            ids.length == royaltyRecipients.length && ids.length == royaltyValues.length,
            "ERC1155: Arrays length mismatch"
        );

        ERC1155PresetMinter.mintBatch(to, ids, amounts, data);

        for (uint256 i; i < ids.length; i++) {
            if (royaltyValues[i] > 0) {
                _setTokenRoyalty(ids[i], royaltyRecipients[i], royaltyValues[i]);
            }
        }
    }
}
