// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Script } from "forge-std/Script.sol";
import { PelusaCracker, Pelusa } from "../src/PelusaCracker.sol";

contract PelusaCrackerScript is Script {
  function run() external {
    Pelusa pelusa = Pelusa(vm.envAddress("PELUSA_ADDRESS"));

    vm.broadcast(vm.envAddress("WALLET_ADDRESS"));
    new PelusaCracker(pelusa, vm.envAddress("PELUSA_DEPLOYER"), vm.envUint("PELUSA_BLOCK"));

    assert(pelusa.goals() == 2);
  }
}
