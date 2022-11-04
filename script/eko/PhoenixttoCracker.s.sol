// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Script } from "forge-std/Script.sol";
import { PhoenixttoCracker, Phoenixtto, Laboratory } from "../../src/eko/PhoenixttoCracker.sol";

contract PhoenixttoCrackerScript is Script {
  function run() external {
    Laboratory laboratory = Laboratory(vm.envAddress("EKO_LABORATORY_ADDRESS"));
    address wallet = vm.envAddress("WALLET_ADDRESS");

    // Phoenixtto phoenixtto = Phoenixtto(laboratory.addr());
    // vm.broadcast(vm.envAddress("ETH_FROM"));
    // phoenixtto.capture("");

    vm.broadcast(vm.envAddress("ETH_FROM"));
    new PhoenixttoCracker(laboratory, wallet);

    vm.prank(wallet, wallet);
    assert(laboratory.isCaught());
  }
}
