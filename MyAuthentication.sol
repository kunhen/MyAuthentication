// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyAuthentication {

    address immutable public myGovernmentAddress;
    address internal myProjectOwner;

    constructor(address projectOwnerAddress){
        myProjectOwner = projectOwnerAddress;
        myGovernmentAddress = msg.sender;
    }

    modifier onlyMyGovernment() {
        require(isMyGovernment(), "You don't have the authority to access. ERROR: 1");
        _;
    }

    modifier onlyMyProjectOwner() {
        require(isMyProjectOwner(), "You don't have the authority to access. ERROR: 1");
        _;
    }

    modifier onlyMyProjectAuth() {
        require(isMyGovernment() || isMyProjectOwner(), "You don't have the authority to access. ERROR: 1");
        _;
    }

    function isMyGovernment() internal view returns(bool){
        return msg.sender == myGovernmentAddress;
    }

    function isMyProjectOwner() internal view returns(bool){
        return msg.sender == myProjectOwner;
    }

    function getMyProjectOwner() external view returns(address){
        return myProjectOwner;
    }
}
