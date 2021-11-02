// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;
pragma abicoder v2;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";
import "@chainlink/contracts/src/v0.8/interfaces/KeeperCompatibleInterface.sol";
import "hardhat/console.sol";

/// @title Raffle
/// @author Colin Steidtmann
/// @notice Creates, runs, and finalizes a raffle
/// @dev Explain to a developer any extra details
/*is Ownable, VRFConsumerBase, KeeperCompatibleInterface*/
contract Raffle {
    bytes32 public s_keyHash;
    uint256 public s_chainlinkFee;
    uint256 public s_entranceFee;
    uint256 public s_lastTimeStamp;
    uint256 public s_interval;
    address public s_sponsor;
    address payable[] public s_players;

    IERC20 public s_treasuryToken;
    raffleState public s_raffleState;
    enum raffleState {
        NOT_STARTED,
        OPEN,
        CALCULATING,
        FINISHED
    }

    /// @notice Explain to an end user what this does
    /// @dev Explain to a developer any extra details
    /// @param _sponsor Address of the raffle's sponsor
    /// @param _vrfCoordinator Address of the Chainlink VRF Coordinator
    /// @param _linkToken Address of the LINK token
    /// @param _treasuryToken Address of the ERC20 token the raffle uses
    /// @param _keyHash The public key against which randomness is generated.
    /// @param _chainlinkFee LINK fee required to fulfill a VRF request
    /// @param _entranceFee TKNbits required to buy one raffle ticket
    /// @param _interval Duration of raffle in seconds.
    constructor(
        address _sponsor,
        address _vrfCoordinator,
        address _linkToken,
        address _treasuryToken,
        bytes32 _keyHash,
        uint256 _chainlinkFee,
        uint256 _entranceFee,
        uint256 _interval /*VRFConsumerBase(_vrfCoordinator, _linkToken)*/
    ) {
        s_sponsor = _sponsor;
        s_treasuryToken = IERC20(_treasuryToken);
        s_keyHash = _keyHash;
        s_chainlinkFee = _chainlinkFee;
        s_entranceFee = _entranceFee;
        s_interval = _interval;
        s_raffleState = raffleState.NOT_STARTED;
    }
}
