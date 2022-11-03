// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Script } from "forge-std/Script.sol";
import { HiddenKittyCracker, House } from "../src/HiddenKittyCracker.sol";

contract HiddenKittyCrackerScript is Script {
  function run() external {
    House house = House(vm.envAddress("HOUSE_ADDRESS"));

    vm.broadcast(vm.envAddress("ETH_FROM"));
    new HiddenKittyCracker(house);

    assert(house.catFound());
  }
}
