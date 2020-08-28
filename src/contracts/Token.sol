pragma solidity ^0.5.16;

import "openzeppelin-solidity/contracts/math/SafeMath.sol";

contract Token {
    using SafeMath for uint;
    
    string public name = "(S)anjaya (K)umar (P)anigrahi - Token";
    string public symbol = "SKP";
    uint256 public decimals = 18;
    uint256 public totalSupply;


    // Track Balances
    mapping(address => uint256) public balanceOf;

    event Transfer(address from, address to, uint256 value);
    constructor() public{
        totalSupply =  1000000 * (10 ** decimals);
        balanceOf[msg.sender] = totalSupply;
    }

   
    // Send tokens
    function transfer(address _to, uint256 _value) public returns( bool success) {
        require(balanceOf[msg.sender] >= _value);

        balanceOf[msg.sender] = balanceOf[msg.sender].sub(_value);
        balanceOf[_to] = balanceOf[_to].add(_value);

        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}