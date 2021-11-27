// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/Counters.sol";
import "./interfaces/ICreateDrop.sol";

contract CreateDrop {
    using Counters for Counters.Counter;
    Counters.Counter private _dropIDs;
    mapping(uint256 => Drop) private _drops;

    function createDrop() public virtual {
        _dropIDs.increment();
        uint256[] memory nfts = new uint256[](3);
        nfts[0] = 1;
        nfts[1] = 3;
        nfts[2] = 4;
        _drops[_dropIDs.current()] = Drop({
            state: DropState.NOT_STARTED,
            royaltyReceiver: payable(msg.sender),
            paymentReceiver: payable(msg.sender),
            treasuryToken: address(0),
            nftIDs: nfts,
            pointsID: 1,
            paymentsMapID: 1,
            pointsMapID: 1,
            paymentsPremium: 1,
            pointsPremium: 1,
            entranceFee: 1,
            royaltyFee: 1,
            duration: 1,
            finalRandomNumber: 0
        });
    }
}

/**
enum DropState {
    NOT_STARTED,
    OPEN,
    CALCULATING,
    FINISHED
}

struct Drop {
    DropState state;
    address payable royaltyReceiver;
    address payable paymentReceiver;
    address treasuryToken;
    uint256[] nftIDs;
    uint256 pointsID;
    uint256 paymentsMapID;
    uint256 pointsMapID;
    uint256 paymentsPremium;
    uint256 pointsPremium;
    uint256 entranceFee;
    uint256 royaltyFee;
    uint256 duration;
    uint256 finalRandomNumber;
}

interface ICreateDrop {
    event DropStateUpdated(DropState indexed newState, uint256 indexed dropID);
    event NewDrop(uint256 indexed dropID, Drop drop);
    event DropEdited(uint256 indexed dropID, Drop editedDrop);

    function createDrop() external;

    function editDrop() external;

    function cancelDrop() external;

    function dropInfo() external;
}
 */
