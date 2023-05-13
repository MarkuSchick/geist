// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./AppAccount.sol";
import "./GHO.sol";

contract Factory is Ownable {
    IEntryPoint immutable ENTRY_POINT_ADDRESSS;
    address immutable executor;

    mapping(address => AppAccount) public appAccounts;

    constructor(IEntryPoint anEntryPoint, address _executor) {
        ENTRY_POINT_ADDRESSS = anEntryPoint;
        executor = _executor;
    }

    function deployNewAppAccount(address _owner) public onlyOwner returns (address) {
        AppAccount appAccount = new AppAccount(
            ENTRY_POINT_ADDRESSS,
            executor,
            _owner
        );
        return address(appAccount);
    }
}
