// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import { ToDo, ToDoData, Challenge, ChallengeData } from "../codegen/Tables.sol";

import { addressToEntity } from "../Utils.sol";
import { getUniqueEntity } from "@latticexyz/world/src/modules/uniqueentity/getUniqueEntity.sol";

contract ToDoSystem is System {
  function addTodo(string memory content) public {
    bytes32 id = getUniqueEntity();
    bytes32 owner = addressToEntity(_msgSender());

    ToDo.set(id, ToDoData({ owner: owner, content: content, done: false }));
  }

  function toggleDone(bytes32 id) public {
    bytes32 owner = addressToEntity(_msgSender());
    require(ToDo.get(id).owner == owner, "unauthorized");

    ToDo.setDone(id, !ToDo.getDone(id));
  }

 function createChallenge(string memory cid) public {
    //this function should create a new challenge
        bytes32 id = getUniqueEntity();
        Challenge.set(id, ChallengeData({
            cid: cid,
            assets: new bytes32[](0),
            status: false
        })); 
    }


}
