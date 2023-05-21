import { mudConfig } from "@latticexyz/world/register";

export default mudConfig({
  tables: {
    ToDo: {
      schema: {
        done: "bool",
        owner: "bytes32",
        content: "string",
      },
    },
    Challenge: {
      schema: {
        cid: "string",
        assets: "bytes32[]",
        status: "bool"
      },
    },
    Asset: {
      schema: {
        count: "uint256",
        cid: "string",
      },
    },
  },
  modules: [
    {
      name: "UniqueEntityModule",
      root: true,
      args: [],
    },
  ],
});
