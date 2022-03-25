// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract NewToken is ERC20, Ownable {
    uint256 public rate = 1000 * 10 **18;
    uint256 public unitsOneEthCanBuy  = 1000;
    address public tokenOwner;         // the owner of the token   
    
    // constructor will only be invoked during contract 
    // deployment time
    uint256 public FixedSupply;
    
    constructor() ERC20("NewToken", "NET") {
        tokenOwner = msg.sender;       // address of the token owner 
        FixedSupply = 1000000 * 10 **18;
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    // this function is called when someone sends ether to the token contract
    receive() external payable {        
        // msg.value (in Wei) is the ether sent to the token contract
        // msg.sender is the account that sends the ether to the token contract        
        // amount is the token bought by the sender
        uint256 amount = msg.value * unitsOneEthCanBuy;        // ensure you have enough tokens to sell
        require(balanceOf(tokenOwner) >= amount, 
            "Not enough tokens");        // transfer the token to the buyer
        _transfer(tokenOwner, msg.sender, amount);        // emit an event to inform of the transfer        
        emit Transfer(tokenOwner, msg.sender, amount);
        
        // send the ether earned to the token owner
        payable(tokenOwner).transfer(msg.value);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function buyTokens(address receiver) public payable {
        require (msg.value > 0, "Minting not successful, Insufficient balance");
        uint amountToBuy = msg.value *unitsOneEthCanBuy;
        require (FixedSupply >= amountToBuy, "Cannot Exceed Fixed Supply");
        _mint(receiver, amountToBuy);
    }
}
