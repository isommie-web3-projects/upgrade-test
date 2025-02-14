// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// // Import Auth from the access-control subdirectory
import "./access-control/Auth.sol";

// Import Ownable from the OpenZeppelin Contracts library
// import "@openzeppelin/contracts/access/Ownable.sol";

contract Box {
    uint256 private _value;
    Auth private _auth;

    // Emitted when the stored value changes
    event ValueChanged(uint256 value);

    constructor() {
     _auth = new Auth(msg.sender);
    }

    // constructor() Ownable(msg.sender) {}

    // Stores a new value in the contract
    function store(uint256 value) public {
        // Require that the caller is registered as an-administrator in Auth
        require(_auth.isAdministrator(msg.sender), "Unauthorized");

        _value = value;
        emit ValueChanged(value);
    }

    // function store(uint256 value) public onlyOwner {

    //     value = value;
    //     emit ValueChanged(value);
    // }

    // Reads the last stored value
    function retrieve() public view returns (uint256) {
        return _value;
    }
}