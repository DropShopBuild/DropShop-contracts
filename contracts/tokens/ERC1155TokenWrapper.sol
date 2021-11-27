// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";
import "./interfaces/IERC1155TokenWrapper.sol";

abstract contract ERC1155TokenWrapper is IERC1155TokenWrapper {
    using Address for address payable;
    mapping(uint256 => ChildToken[]) private _parentToChildren;

    function deposit(
        uint256 parentID,
        TokenType tokenType,
        address childAddress,
        uint256 nonFungibleID,
        uint256 fungibleAmount
    ) public payable virtual override {
        _parentToChildren[parentID].push(ChildToken(tokenType, childAddress, nonFungibleID, fungibleAmount));
        ChildToken memory child = _parentToChildren[parentID][_parentToChildren[parentID].length - 1];
        emit ChildDeposited(msg.sender, parentID, child);
    }

    function withdraw(uint256 parentID, address payable parentOwner) public virtual override {
        ChildToken memory child = _parentToChildren[parentID][0];
        emit ChildWithdrawn(parentOwner, parentID, child, child.fungibleAmount);
    }
}
