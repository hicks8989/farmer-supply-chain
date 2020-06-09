// SPDX-License-Identifier: MIT
pragma solidity >=0.4.24;

/// Provides basic authorization control
contract Ownable {
    address payable origOwner;

    // Define an Event
    event TransferOwnership(address indexed oldOwner, address indexed newOwner);

    /// Assign the contract to an owner
    constructor () internal {
        origOwner = msg.sender;
        emit TransferOwnership(address(0), origOwner);
    }

    /// Look up the address of the owner
    function owner() external view returns (address) {
        return origOwner;
    }

    /// Define a function modifier 'onlyOwner'
    modifier onlyOwner() {
        require(isOwner(), "Only the owner is able to access this function");
        _;
    }

    /// Check if the calling address is the owner of the contract
    function isOwner() public view returns (bool) {
        return msg.sender == origOwner;
    }

    /// Define a function to renounce ownerhip
    function renounceOwnership() external onlyOwner {
        emit TransferOwnership(origOwner, address(0));
        origOwner = address(0);
    }

    /// Define a public function to transfer ownership
    function transferOwnership(address payable newOwner) external onlyOwner {
        _transferOwnership(newOwner);
    }

    /// Define an internal function to transfer ownership
    function _transferOwnership(address payable newOwner) internal {
        require(newOwner != address(0), "Cannot transfer ownership between owner and themself");
        emit TransferOwnership(origOwner, newOwner);
        origOwner = newOwner;
    }

    // Define a function 'kill' if required
    function kill() external payable {
        if (msg.sender == origOwner) {
            selfdestruct(origOwner);
        }
    }
}
