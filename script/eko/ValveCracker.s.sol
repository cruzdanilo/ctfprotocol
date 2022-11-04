// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Script } from "forge-std/Script.sol";
import { ValveCracker, Valve } from "../../src/eko/ValveCracker.sol";

contract ValveCrackerScript is Script {
  function run() external {
    Valve valve = Valve(vm.envAddress("EKO_VALVE_ADDRESS"));

    vm.broadcast(vm.envAddress("ETH_FROM"));
    new ValveCracker(valve);

    assert(valve.open());
  }
}
