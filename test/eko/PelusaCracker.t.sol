// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Test } from "forge-std/Test.sol";
import { PelusaCracker, Pelusa } from "../../src/eko/PelusaCracker.sol";

contract PelusaCrackerTest is Test {
  Pelusa internal pelusa;

  function setUp() external {
    pelusa = new Pelusa();
  }

  function testPelusaCracker() external {
    new PelusaCracker(pelusa, address(this), block.number);
    assertEq(pelusa.goals(), 2);
  }
}
