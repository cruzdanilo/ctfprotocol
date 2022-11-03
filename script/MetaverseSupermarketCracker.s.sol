// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Script } from "forge-std/Script.sol";
import { MetaverseSupermarketCracker, InflaStore } from "../src/MetaverseSupermarketCracker.sol";

contract MetaverseSupermarketCrackerScript is Script {
  function run() external {
    InflaStore store = InflaStore(vm.envAddress("INFLA_STORE_ADDRESS"));
    address wallet = vm.envAddress("WALLET_ADDRESS");

    vm.broadcast(vm.envAddress("ETH_FROM"));
    new MetaverseSupermarketCracker(store, wallet);

    assert(store.meal().balanceOf(wallet) >= 10);
  }
}
