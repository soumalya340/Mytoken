// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.2;

contract Token{
    mapping(address => uint) public balances;
    mapping(address => mapping(address => uint)) public allowance ;
    uint public totalSupply =  100000 * 10 ** 18;
    string  public name = "My Sou Token";
    string public symbol ="TKN";
    uint public decimals= 18;
    
    event Transfer(address indexed from, address indexed to  , uint value);
    event Approval(address indexed from, address indexed to  , uint value);
    
    constructor (){
        balances[msg.sender] =   totalSupply;
        
    }
     function balanceOf(address owner) public view returns(uint){
        return balances[owner];     
    }
    
    function transferFrom(address from, address to, uint value) public returns(bool){
                require(balanceOf(msg.sender) >= value,"balance too low");
                require(allowance[from][msg.sender]>=value,"allowance too low");
                balances[to]+= value;
                balances[msg.sender] -= value;
                emit Transfer(from,to,value);
                return true;
    }
    function transfer(address to, uint value) public returns(bool){
                require(balanceOf(msg.sender) >= value,"balance too low");
                balances[to]+= value;
                balances[msg.sender] -= value;
                emit Transfer(msg.sender,to,value);
                return true;
                 
        
    }
    function approve(address spender, uint value)public returns(bool){
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender,spender,value);
        return true;
        
    }
    
}
