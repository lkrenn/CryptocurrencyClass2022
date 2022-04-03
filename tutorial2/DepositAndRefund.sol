// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract depositAndRefund{

    uint balance; 

    mapping(address => uint) balanceMapping;



    function getBalance(address _party) public returns(uint){
        balance = address(_party).balance;
        return balance;
    }


    function deposit(uint amount) public{
        

        balanceMapping[msg.sender] += amount;
    }
}