// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Test } from "forge-std/Test.sol";
import { MothershipCracker, Mothership } from "../../src/eko/MothershipCracker.sol";

contract MothershipCrackerTest is Test {
  Mothership internal mothership;

  function setUp() external {
    mothership = new Mothership();
  }

  function testMothershipCracker() external {
    new MothershipCracker(mothership);
    assertTrue(mothership.hacked());
  }
}
