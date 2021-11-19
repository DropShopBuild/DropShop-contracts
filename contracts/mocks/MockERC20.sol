// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MockERC20 is ERC20 {
    constructor(address _sender) public ERC20("Mock ERC20", "ERC") {
        _mint(_sender, 1000000000000000000000000);
    }
}
