// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Script } from "forge-std/Script.sol";
import { MothershipCracker, Mothership } from "../src/MothershipCracker.sol";

contract MothershipCrackerScript is Script {
  function run() external {
    Mothership mothership = Mothership(vm.envAddress("MOTHERSHIP_ADDRESS"));

    vm.broadcast(vm.envAddress("ETH_FROM"));
    new MothershipCracker(mothership);

    assert(mothership.hacked());
  }
}
