//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

/**
 * THIS IS AN EXAMPLE CONTRACT WHICH USES HARDCODED VALUES FOR CLARITY.
 * PLEASE DO NOT USE THIS CODE IN PRODUCTION.
 */
contract APIConsumer is ChainlinkClient {
    using Chainlink for Chainlink.Request;

    uint256 public s_volume;
    address private s_oracle;
    bytes32 private s_jobId;
    uint256 private s_fee;

    /**
     * Network: Kovan
     * Oracle: 0xc57B33452b4F7BB189bB5AfaE9cc4aBa1f7a4FD8 (Chainlink Devrel
     * Node)
     * Job ID: d5270d1c311941d0b08bead21fea7747
     * Fee: 0.1 LINK
     */
    constructor(
        address oracle,
        // string memory jobId,
        bytes32 jobId,
        uint256 fee,
        address link
    ) {
        if (link == address(0)) {
            setPublicChainlinkToken();
        } else {
            setChainlinkToken(link);
        }
        s_oracle = oracle;
        // jobId = stringToBytes32(_jobId);
        s_jobId = jobId;
        s_fee = fee;
    }

    /**
     * Create a Chainlink request to retrieve API response, find the target
     * data, then multiply by 1000000000000000000 (to remove decimal places from data).
     */
    function requestVolumeData() public returns (bytes32 requestId) {
        Chainlink.Request memory request = buildChainlinkRequest(s_jobId, address(this), this.fulfill.selector);

        // Set the URL to perform the GET request on
        request.add("get", "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=ETH&tsyms=USD");

        // Set the path to find the desired data in the API response, where the response format is:
        // {"RAW":
        //   {"ETH":
        //    {"USD":
        //     {
        //      "VOLUME24HOUR": xxx.xxx,
        //     }
        //    }
        //   }
        //  }
        request.add("path", "RAW.ETH.USD.VOLUME24HOUR");

        // Multiply the result by 1000000000000000000 to remove decimals
        int256 timesAmount = 10**18;
        request.addInt("times", timesAmount);

        // Sends the request
        return sendChainlinkRequestTo(s_oracle, request, s_fee);
    }

    /**
     * Receive the response in the form of uint256
     */
    function fulfill(bytes32 requestId, uint256 volume) public recordChainlinkFulfillment(requestId) {
        s_volume = volume;
    }

    // function withdrawLink() external {} - Implement a withdraw function to avoid locking your LINK in the contract
    // function stringToBytes32(string memory source) public pure returns (bytes32 result) { bytes memory tempEmptyStringTest = bytes(source); if (tempEmptyStringTest.length == 0) { return 0x0; }assembly { result := mload(add(source, 32))}}
}
