// SPDX-License-Identifier: MIT

// 1. deploy mocks when we are on a local anvil chain
// 2. keep track of contract address across different chains
// 3. Sepolia ETH/USD
// 4. Mainnet ETH/USD
pragma solidity ^0.8.18;

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {MockV3Aggregator} from "../test/mock/MockV3Aggregator.sol";
import {Script} from "forge-std/Script.sol";

contract HelperConfig is Script {
    NetworkConfig public activeNetworkConfig;

    uint8 public constant DECIMALS = 8;
    int256 public constant INITIAL_PRICE = 2000e8;

    struct NetworkConfig {
        address priceFeed;
    }

    event HelperConfig__CreatedMockPriceFeed(address priceFeed);

    constructor() {
        if (block.chainid == 11155111) {
            activeNetworkConfig = getSepoliaEthConfig();
        } else {
            activeNetworkConfig = getOrCreateAnvilEthConfig();
        }
    }

    function getSepoliaEthConfig()
        public
        pure
        returns (NetworkConfig memory sepoliaNetworkConfig)
    {
        sepoliaNetworkConfig = NetworkConfig({
            priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306 // ETH / USD
        });
    }

    function getOrCreateAnvilEthConfig()
        public
        returns (NetworkConfig memory anvilNetworkConfig)
    {
        // Check to see if we set an active network config
        if (activeNetworkConfig.priceFeed != address(0)) {
            return activeNetworkConfig;
        }
        vm.startBroadcast();
        MockV3Aggregator mockPriceFeed = new MockV3Aggregator(
            DECIMALS,
            INITIAL_PRICE
        );
        vm.stopBroadcast();
        emit HelperConfig__CreatedMockPriceFeed(address(mockPriceFeed));

        anvilNetworkConfig = NetworkConfig({priceFeed: address(mockPriceFeed)});
    }
}

//import {Script} from "forge-std/Script.sol";
//import {MockV3Aggregator} from "../test/mock/MockV3Aggregator.sol";

//contract HelpConfig is Script {
// if we are on a local anvil, we deploy mocks
//otherwise, grab the existing address from the live network
//  NetworkConfig public activeNetworkConfig;

// uint8 public constant DECIMALS = 8;
//  int256 public constant INITIAL_PRICE = 2000e8;

//struct NetworkConfig {
//   address priceFeed;
//}
//constructor() {
// if (block.chainid == 11155111) {
//    activeNetworkConfig = getSepoliaEthConfig();
// } else if (block.chainid == 1) {
//  activeNetworkConfig = getOrCreateAnvilEthConfig();
//} else {
//   activeNetworkConfig = getOrCreateAnvilEthConfig();
// }
//}
//}

function getSepoliaEthConfig() public pure returns (NetworkConfig memory) {
    NetworkConfig memory sepoliaNetworkConfig = NetworkConfig({
        priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306 // ETH / USD
    });
    return sepoliaConfig;
}

//function getAnvilEthConfig() public returns (NetworkConfig memory) {
// price feed address but what if we have more much more
//1. deploy the mocks fake contract real contract by we can control it
// 2. return the mock address
//if (activeNetworkConfig.priceFeed != address(0)) {
//return activeNetworkConfig;
// }
// vm.startBroadcast();
//MockV3Aggregator mockPriceFeed = new MockV3Aggregator(
//  DECIMALS,
// INITIAL_PRICE
//); // (8, 2000e8);
// vm.stopBroadcast();

//NetworkConfig memory anvilConfig = NetworkConfig({
//  priceFeed: address(mockPriceFeed)
// });
//return anvilConfig;
//}
