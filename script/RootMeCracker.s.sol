// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Script } from "forge-std/Script.sol";
import { RootMeCracker, RootMe } from "../src/RootMeCracker.sol";

contract RootMeCrackerScript is Script {
  function run() external {
    RootMe rootMe = RootMe(vm.envAddress("ROOT_ME_ADDRESS"));

    vm.broadcast(vm.envAddress("ETH_FROM"));
    new RootMeCracker(rootMe);

    assert(rootMe.victory());
  }
}
