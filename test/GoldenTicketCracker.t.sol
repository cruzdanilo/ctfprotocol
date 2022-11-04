// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Test } from "forge-std/Test.sol";
import { GoldenTicketCracker, GoldenTicket } from "../src/GoldenTicketCracker.sol";

contract GoldenTicketCrackerTest is Test {
  GoldenTicket internal goldenTicket;

  function setUp() external {
    goldenTicket = new GoldenTicket();
  }

  function testGoldenTicketCracker() external {
    new GoldenTicketCracker(goldenTicket, address(this));
    assertTrue(goldenTicket.hasTicket(address(this)));
  }
}
