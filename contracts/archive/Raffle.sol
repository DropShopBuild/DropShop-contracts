// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/AccessControl.sol";
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
contract Raffle is AccessControl {
    bytes32 public constant SPONSOR_ROLE = keccak256("SPONSOR");
    bytes32 public s_keyHash;
    uint256 public s_chainlinkFee;
    uint256 public s_entranceFee;
    uint256 public s_lastTimeStamp;
    uint256 public s_interval;
    address public s_sponsor;
    mapping(address => uint256) public s_deposits;

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
    /// @param _entranceFee min TKNbits required to be entered int the raffle
    /// @param _interval Duration of raffle in seconds.
    /*VRFConsumerBase(_vrfCoordinator, _linkToken)*/
    constructor(
        address _sponsor,
        address _vrfCoordinator,
        address _linkToken,
        address _treasuryToken,
        bytes32 _keyHash,
        uint256 _chainlinkFee,
        uint256 _entranceFee,
        uint256 _interval
    ) {
        _setupRole(SPONSOR_ROLE, _sponsor);
        s_sponsor = _sponsor;
        s_treasuryToken = IERC20(_treasuryToken);
        s_keyHash = _keyHash;
        s_chainlinkFee = _chainlinkFee;
        s_entranceFee = _entranceFee;
        s_interval = _interval;
        s_raffleState = raffleState.NOT_STARTED;
    }

    // External functions

    /// @notice Explain to an end user what this does
    /// @dev Explain to a developer any extra details
    function startRaffle() external onlyRole(SPONSOR_ROLE) {
        require(s_raffleState == raffleState.NOT_STARTED, "Raffle must have not started yet.");
        s_lastTimeStamp = block.timestamp;
        s_raffleState = raffleState.OPEN;
    }

    /// @notice Explain to an end user what this does
    /// @dev Explain to a developer any extra details
    function enterRaffle(address _funder, uint256 _amount) external {
        require(s_raffleState == raffleState.OPEN, "Raffle must be open.");
        require(_amount >= s_entranceFee, "Token amount too low.");
        require(s_treasuryToken.allowance(_funder, address(this)) >= _amount, "Token allowance too low");
        require(s_treasuryToken.transferFrom(_funder, address(this), _amount), "Token transfer failed.");
        s_deposits[_funder] = _amount;
    }

    // function checkUpkeep(bytes calldata checkData)
    //     external
    //     override
    //     returns (bool upkeepNeeded, bytes memory performData)
    // {}

    // function performUpkeep(bytes calldata performData) external override {}

    // External functions that are view
    // ...

    // External functions that are pure
    // ...

    // Public functions
    // ...

    // Internal functions
    //function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {}

    // Private functions
    // ...
}

// //Setup
// createRaffleContract(address sponsor, uint256 durationInSeconds, address productNFTs, uint256 tokenAmount, uint256 minProductPrice)
//     // require (minProductPrice * # of productNFTS) > tokenAmount

// //Setup for raffle contract
// contract Raffle {
//     mapping(address => amountDeposited) smallTShirtWanters;
//     mapping(address => amountDeposited) mediumTShirtWanters;
//     mapping(address => amountDeposited) largeShirtWanters;
// }

// //Step 1
// startRaffle() onlySponsor

// // Step 2
// userEntersRaffle(address user, uint256 amount, uint256 tShirtproductOption)
//     // Require amount > product price

// // Step 3
// raffleEnds() onlyKepper

// // Step 4
// pickWinners()
//     // Get random number and store on chain
//     // CALL SEUNGs API
//         // GIVE SEUNG our random number
//             // SEUNG queries our smart contracts for the addresses, amount depositied, and # of tokens held by each address. FREE to read blockchain.
//             // SEUNG uses all that to calculate probabilities and pick winners.
//         // SEUNG returns list of winners

// // Step 5
// distributeNFTSToWinners()
// // call withdrawStake()

// // Distribute excess money or exess tokens back to everyone who played. See you next time!

// // Post raffle
// withdrawStake() onlySponsor
//     // Give sponsor their stake

// withdrawPurse() onlySponsor
//     // reequire 2 weeks after raffle ended.
//     // Give sponsor their purse
