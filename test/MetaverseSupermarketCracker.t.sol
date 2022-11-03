// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Test } from "forge-std/Test.sol";
import { MetaverseSupermarketCracker, InflaStore } from "../src/MetaverseSupermarketCracker.sol";

contract MetaverseSupermarketCrackerTest is Test {
  InflaStore internal store;

  function setUp() external {
    store = new InflaStore(address(this));
  }

  function testMetaverseSupermarketCracker() external {
    new MetaverseSupermarketCracker(store, address(this));
    assertGe(store.meal().balanceOf(address(this)), 10);
  }
}
