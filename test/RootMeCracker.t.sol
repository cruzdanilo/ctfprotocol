// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Test } from "forge-std/Test.sol";
import { RootMeCracker, RootMe } from "../src/RootMeCracker.sol";

contract RootMeCrackerTest is Test {
  RootMe internal rootMe;

  function setUp() external {
    rootMe = new RootMe();
  }

  function testRootMeCracker() external {
    new RootMeCracker(rootMe);
    assertTrue(rootMe.victory());
  }
}
