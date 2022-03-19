// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract NewToken is ERC20, Ownable {
    uint256 public rate = 1000 * 10 ** decimals();
    constructor() ERC20("NewToken", "NET") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
        balances[msg.sender] = totalSupply_;

    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

  function buyTokens(address receiver) public payable returns (bool) {}
        msg.value = 1 * 10**18;
        require(numTokens <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender].sub(numTokens);
        balances[receiver] = balances[receiver].add(numTokens);
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }
}