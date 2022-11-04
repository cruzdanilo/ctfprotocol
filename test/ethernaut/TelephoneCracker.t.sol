// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Test } from "forge-std/Test.sol";
import { TelephoneCracker, Telephone } from "../../src/ethernaut/TelephoneCracker.sol";

contract TelephoneCrackerTest is Test {
  Telephone internal telephone;

  function setUp() external {
    telephone = new Telephone();
  }

  function testTelephoneCracker() external {
    new TelephoneCracker(telephone, address(this));

    assertEq(telephone.owner(), address(this));
  }
}
