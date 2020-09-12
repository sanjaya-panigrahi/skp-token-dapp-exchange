pragma solidity ^0.5.16;

contract Exchange{

    address public feeAccount;
    uint256 public feePercent;
    constructor (address _feeAccount, uint256 _feePercent) public {
        feeAccount = _feeAccount;
        feePercent = _feePercent;
    }

    function depositToken(address _token, uint _amount) public {
        // We will implement the Smart Contract Exchange - 1> Which Token to Transfer, 2> How Much
        //3> Send Token to Contract, 4> Manage Deposits and Event emmission
        Token(_token).transferFrom(msg.sender, address(this), _amount)
    }
}