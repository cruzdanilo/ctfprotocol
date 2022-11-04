// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Script } from "forge-std/Script.sol";
import { GoldenTicketCracker, GoldenTicket } from "../src/GoldenTicketCracker.sol";

contract GoldenTicketCrackerScript is Script {
  function run() external {
    GoldenTicket goldenTicket = GoldenTicket(vm.envAddress("GOLDEN_TICKET_ADDRESS"));
    address wallet = vm.envAddress("WALLET_ADDRESS");

    vm.broadcast(vm.envAddress("ETH_FROM"));
    new GoldenTicketCracker(goldenTicket, wallet);

    assert(goldenTicket.hasTicket(wallet));
  }
}
