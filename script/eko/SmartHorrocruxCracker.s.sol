// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Script } from "forge-std/Script.sol";
import { SmartHorrocruxCracker, SmartHorrocrux } from "../../src/eko/SmartHorrocruxCracker.sol";

contract SmartHorrocruxCrackerScript is Script {
  function run() external {
    SmartHorrocrux horrocrux = SmartHorrocrux(vm.envAddress("EKO_HORROCRUX_ADDRESS"));

    vm.broadcast(vm.envAddress("ETH_FROM"));
    new SmartHorrocruxCracker{ value: 1 }(horrocrux);

    assert(!horrocrux.alive());
  }
}
