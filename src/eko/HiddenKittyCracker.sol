// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { HiddenKittyCat, House } from "eko/ChallengeHiddenKitty.sol";

contract HiddenKittyCracker {
  constructor(House house) {
    house.isKittyCatHere(keccak256(abi.encodePacked(block.timestamp, blockhash(block.number - 69))));
  }
}
