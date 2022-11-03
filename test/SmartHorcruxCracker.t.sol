// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Test } from "forge-std/Test.sol";
import { SmartHorrocruxCracker, SmartHorrocrux } from "../src/SmartHorrocruxCracker.sol";

contract SmartHorrocruxCrackerTest is Test {
  SmartHorrocrux internal horrocrux;

  function setUp() external {
    horrocrux = new SmartHorrocrux{ value: 2 }();
  }

  function testSmartHorrocruxCracker() external {
    new SmartHorrocruxCracker{ value: 1 }(horrocrux);
    assertFalse(horrocrux.alive());
  }
}
