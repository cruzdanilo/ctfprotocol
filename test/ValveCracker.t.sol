// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Test } from "forge-std/Test.sol";
import { ValveCracker, Valve } from "../src/ValveCracker.sol";

contract ValveCrackerTest is Test {
  Valve internal valve;

  function setUp() external {
    valve = new Valve();
  }

  function testValveCracker() external {
    new ValveCracker(valve);
    assertTrue(valve.open());
  }
}
