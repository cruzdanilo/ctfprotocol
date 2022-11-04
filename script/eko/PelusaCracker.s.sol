// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Script } from "forge-std/Script.sol";
import { PelusaCracker, Pelusa } from "../../src/eko/PelusaCracker.sol";

contract PelusaCrackerScript is Script {
  function run() external {
    Pelusa pelusa = Pelusa(vm.envAddress("EKO_PELUSA_ADDRESS"));

    vm.broadcast(vm.envAddress("ETH_FROM"));
    new PelusaCracker(pelusa, vm.envAddress("EKO_PELUSA_DEPLOYER"), vm.envUint("EKO_PELUSA_BLOCK"));

    assert(pelusa.goals() == 2);
  }
}
