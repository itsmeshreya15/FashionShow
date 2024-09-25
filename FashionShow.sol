// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract FashionShowToken is ERC20, Ownable, ERC20Burnable {

    constructor() ERC20("FashionShow", "FST") Ownable(msg.sender) {}

    // Struct to hold the number of each outfit item a player owns
    struct OutfitItems {
        uint256 dresses;
        uint256 shoes;
        uint256 hats;
    }

    // Mapping from player address to their outfit items balance
    mapping(address => OutfitItems) public outfitItems;

    // Function to mint new tokens, only callable by the owner
    function mintTokens(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    // Function to transfer tokens to another address
    function transferTokens(address to, uint256 amount) external {
        _transfer(_msgSender(), to, amount);
    }

    // Enum for different types of outfit items
    enum OutfitItem { Dress, Shoes, Hat }

    // Function to redeem tokens for outfit items
    function redeemOutfit(OutfitItem item) external {
        uint256 cost;

        // Define costs for each item
        if (item == OutfitItem.Dress) {
            cost = 100;
        } else if (item == OutfitItem.Shoes) {
            cost = 50;
        } else if (item == OutfitItem.Hat) {
            cost = 25;
        } else {
            revert("Invalid outfit item");
        }

        require(balanceOf(msg.sender) >= cost, "Insufficient balance");
        burn(cost);

        // Logic to assign the redeemed outfit item to the player
        if (item == OutfitItem.Dress) {
            outfitItems[msg.sender].dresses += 1;
        } else if (item == OutfitItem.Shoes) {
            outfitItems[msg.sender].shoes += 1;
        } else if (item == OutfitItem.Hat) {
            outfitItems[msg.sender].hats += 1;
        }
    }

    // Function to get the token balance of a player
    function getBalance(address account) external view returns (uint256) {
        return balanceOf(account);
    }

    // Function to get the outfit items balance of a player
    function getOutfitItems(address account) external view returns (OutfitItems memory) {
        return outfitItems[account];
    }
}