// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Test } from "forge-std/Test.sol";
import { CoinFlipCracker, CoinFlip } from "../../src/ethernaut/CoinFlipCracker.sol";

contract CoinFlipCrackerTest is Test {
  CoinFlip internal coinFlip;

  function setUp() external {
    coinFlip = new CoinFlip();
  }

  function testCoinFlipCracker() external {
    CoinFlipCracker cracker = new CoinFlipCracker(coinFlip);

    for (uint256 i = 0; i < 10; ++i) {
      vm.roll(block.number + 1);
      cracker.flip();
    }

    assertGe(coinFlip.consecutiveWins(), 10);
    assertEq(address(coinFlip).balance, 0);
  }
}
