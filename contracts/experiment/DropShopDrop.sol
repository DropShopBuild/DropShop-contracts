// // SPDX-License-Identifier: MIT

// //This contract creates and stores dropper accounts
// contract DropShop {
//     address[] public s_officialDroppers;
// }

// //This contract can create and store decentralized drops
// contract DropShopDropper {
//     address public s_owner;
//     address[] public s_drops;
//     address[] public s_tokens;
// }

// //This contract is a decentrailzed drop.
// contract DropShopDrop {
//     uint256 public s_entranceFee;
//     address public s_nft;
//     address public s_storageToken;
//     address public s_dropper;
//     mapping(address => uint256) public s_deposits;

//     raffleState public s_raffleState;
//     enum raffleState {
//         NOT_STARTED,
//         OPEN,
//         CALCULATING,
//         FINISHED
//     }
// }

// //This contract is a non-tradeable token. DropShopDrops can use it to boost the odds of winning of participants who hold it. DropShopDroppers can distribute it as they see best fit.
// contract DropperToken is IERC20 {
//     uint supply
//     mapping(address => balance)
//     something // keep track of when users recieved tokens
//     uint depreciationRate
//     burn() {

//     }
    
//     mint(address, amount) {

//     }

//     transfer(amount, to) {
        
//     }
// }


// contract ERC1155 is Context, ERC165, IERC1155, IERC1155MetadataURI {
//     // Mapping from token ID to account balances
//     mapping(uint256 => mapping(address => uint256)) private _balances;
// }


