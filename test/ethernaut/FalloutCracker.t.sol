// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Test } from "forge-std/Test.sol";
import { Fallout } from "ethernaut/L1.fallout.sol";

contract FalloutCrackerTest is Test {
  Fallout internal fallout;

  function setUp() external {
    fallout = new Fallout();
  }

  function testFalloutCracker() external {
    fallout.Fal1out();

    assertEq(fallout.owner(), address(this));
    assertEq(address(fallout).balance, 0);
  }
}
