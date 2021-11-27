// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "./ICreateDrop.sol";
import "./IRunDrop.sol";
import "./IFinishDrop.sol";

/**
 * @author Colin Steidtmann
 * @title The complete Drop Shop.
 * @notice Contract composition of various modules/building-blocks.
 */
interface IComposeDrop is ICreateDrop, IRunDrop, IFinishDrop {

}
