// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Test } from "forge-std/Test.sol";
import { JackpotProxy } from "eko/ChallengeTrickster.sol";
import { StdStorage, stdStorage } from "forge-std/StdStorage.sol";
import { TricksterCracker, Jackpot } from "../../src/eko/TricksterCracker.sol";

contract TricksterCrackerTest is Test {
  using stdStorage for StdStorage;

  Jackpot internal jackpot;

  function setUp() external {
    jackpot = Jackpot(
      payable(
        address(uint160(uint256(vm.load(address(new JackpotProxy{ value: 0.0001 ether }()), bytes32(uint256(1))))))
      )
    );
  }

  receive() external payable {}

  function testTricksterCracker() external {
    new TricksterCracker(jackpot, payable(address(this)));
    assertEq(address(jackpot).balance, 0);
  }
}
