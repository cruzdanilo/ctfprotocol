// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Test } from "forge-std/Test.sol";
import { HiddenKittyCracker, House } from "../src/HiddenKittyCracker.sol";

contract HiddenKittyCrackerTest is Test {
  House internal house;

  function setUp() external {
    vm.warp(666);
    vm.roll(420);
    house = new House();
  }

  function testHiddenKittyCracker() external {
    new HiddenKittyCracker(house);
    assertTrue(house.catFound());
  }
}
