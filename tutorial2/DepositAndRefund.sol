// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract depositAndRefund{

    uint balance; 

    mapping(address => uint) balanceMapping;

    function getBalance(address _party) public returns(uint){
        balance = address(_party).balance;
        return balance;
    }

    function deposit() public payable{
        require(getBalance(msg.sender) >= msg.value);
        balanceMapping[msg.sender] += msg.value; 
    }

    function withdraw(uint256 amountInEth) public payable{
        require(getBalance(msg.sender) >= amountInEth * 1000000000000000000);
        balanceMapping[msg.sender] -= amountInEth; 
        payable(msg.sender).transfer(amountInEth * 1000000000000000000);
    }

    // modifier onlyOwner(){
    //     require(msg.sender == owner);
    //     _;
    // }



}