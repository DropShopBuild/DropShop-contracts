// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "./interfaces/IPerTokenCreators.sol";

/**
 * @author Colin Steidtmann
 * @title Role manager for sponsor/brand tokens
 * @notice Module for the the main assets contract.
 * Implements the creator role and emits events
 * @dev Roles enforced using modifiers.
 */
contract PerTokenCreators is IPerTokenCreators {
    mapping(uint256 => address) private _creators;

    /**
     * @dev Require msg.sender to be the creator of the token `_id`
     */
    modifier creatorOnly(uint256 _id) {
        require(_creators[_id] == msg.sender, "PerTokenCreators#creatorOnly: ONLY_CREATOR_ALLOWED");
        _;
    }

    /**
     * @notice See {IPerTokenCreators}
     */
    function setCreator(address to, uint256[] memory ids) public virtual override {
        require(to != address(0), "ERC1155PerTokenCreators#setCreator: INVALID_ADDRESS.");
        for (uint256 i = 0; i < ids.length; i++) {
            uint256 id = ids[i];
            _setCreator(to, id);
        }
    }

    /**
     * @notice See {IPerTokenCreators}
     */
    function getCreator(uint256 id) public view virtual override returns (address creator) {
        creator = _creators[id];
    }

    /**
     * @notice See {IPerTokenCreators}
     * @dev Emits a {NewCreator} event defined in {IPerTokenCreators}.
     */
    function _setCreator(address to, uint256 id) internal virtual creatorOnly(id) {
        _creators[id] = to;
        emit NewCreator(to, id);
    }
}
