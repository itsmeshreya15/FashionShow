

# FashionShowToken Smart Contract 

## Overview  
The *FashionShowToken* is an ERC20 token designed to operate on the Ethereum blockchain, developed using Solidity. This contract facilitates a unique gaming experience by allowing users to mint, burn, and transfer tokens that can be redeemed for virtual items such as dresses, shoes, and hats in an engaging virtual fashion show environment. The contract integrates functionalities to effectively manage both token balances and the inventory of virtual outfits, enhancing the interactive gaming experience for players.

## Features  
1. **ERC20 Token**:  
   - The *FashionShowToken* adheres to the ERC20 standard, providing a reliable and widely recognized framework for token creation. The token features a custom name, "FashionShow," and a symbol, "FST."
   - The implementation leverages OpenZeppelin's robust libraries for ERC20, Ownable, and Burnable extensions, ensuring security and compliance with best practices in smart contract development.

2. **Ownership**:  
   - By employing the Ownable extension, the contract designates a single owner (the deployer) who possesses exclusive rights to perform certain critical actions, such as minting new tokens, enhancing control over the token supply.

3. **Minting Tokens**:  
   - The owner can create new tokens for any user through the `mintTokens` function, allowing for dynamic token distribution and user engagement within the platform.

4. **Burnable Tokens**:  
   - Users have the ability to burn their tokens when redeeming them for virtual fashion items via the `redeemOutfit` function, promoting the token's utility and encouraging active participation in the ecosystem.

5. **Outfit Items**:  
   - The contract enables users to redeem tokens for various outfit items, including dresses, shoes, and hats. 
   - An `OutfitItems` struct tracks the quantities of each type of outfit item owned by players, ensuring organized inventory management.

6. **Transferable Tokens**:  
   - Users can transfer their tokens to other participants using the `transferTokens` function, fostering a collaborative environment and enhancing social interaction within the game.

## Contract Details  
### 1. Token Name and Symbol  
- **Name**: FashionShow  
- **Symbol**: FST  

### 2. Outfit Items Structure  
The `OutfitItems` struct represents a player's collection of virtual outfit items:
- **dresses**: Number of dresses owned.  
- **shoes**: Number of shoes owned.  
- **hats**: Number of hats owned.  
A mapping effectively manages each player's `OutfitItems` balance, ensuring accurate tracking of inventory.

### 3. Outfit Item Enum  
An enumeration, `OutfitItem`, defines three possible values to categorize redeemable items:
- **Dress**  
- **Shoes**  
- **Hat**  

### 4. Redeeming Outfit Items  
The `redeemOutfit` function allows players to exchange tokens for virtual outfit items:
- **Dress**: Costs 100 tokens.  
- **Shoes**: Costs 50 tokens.  
- **Hat**: Costs 25 tokens.  
When redeeming, the specified token amount is deducted from the user’s balance through token burning, while the respective outfit item is added to their inventory, encouraging user engagement and participation.

### 5. Minting Tokens  
- The `mintTokens` function is restricted to the contract owner, allowing them to mint a specified quantity of tokens to a designated address. This control mechanism ensures the integrity of the token supply.

### 6. Transfer Tokens  
- The `transferTokens` function enables users to send their tokens to another address, promoting interaction and collaboration within the user community.

### 7. Getting Balances  
- The `getBalance` function retrieves the FST token balance of a specified account, providing transparency and enabling users to monitor their holdings.
- The `getOutfitItems` function returns the number of each type of outfit item (dresses, shoes, hats) owned by the specified account, allowing users to track their virtual inventory effectively.

## Functions  
### Constructor  
```solidity
constructor() ERC20("FashionShow", "FST") Ownable(msg.sender) {}
```
- Initializes the ERC20 token with the name "FashionShow" and symbol "FST."
- Sets the contract owner to the address that deployed the contract, establishing control for minting and other administrative functions.

### Mint Tokens  
```solidity
function mintTokens(address to, uint256 amount) external onlyOwner 
```
- Enables the owner to mint a specified amount of FST tokens to the designated address, facilitating user engagement and rewards distribution.

### Transfer Tokens  
```solidity
function transferTokens(address to, uint256 amount) external 
```
- Allows users to transfer their tokens to another address, enhancing interaction and fostering a community spirit among users.

### Redeem Outfit Items  
```solidity
function redeemOutfit(OutfitItem item) external 
```
- Permits users to redeem tokens for virtual outfit items by burning the required tokens, enriching their virtual inventory with fashion items.

### Get Token Balance  
```solidity
function getBalance(address account) external view returns (uint256) 
```
- Provides a mechanism for users to check their FST token balance, promoting transparency and accountability.

### Get Outfit Items Balance  
```solidity
function getOutfitItems(address account) external view returns (OutfitItems memory) 
```
- Allows users to view the quantity of each type of outfit item (dresses, shoes, hats) they own, ensuring effective inventory management.

## Prerequisites  
- **Solidity** version ^0.8.24.  
- **OpenZeppelin Contracts**:  
  - ERC20  
  - Ownable  
  - ERC20Burnable  

## How to Use  
1. **Deploy the contract**:  
   - The contract is deployed by a single owner, who holds the authority to manage token minting and inventory.

2. **Mint Tokens**:  
   - The owner can mint tokens to distribute among users, encouraging participation in the virtual fashion ecosystem.

3. **Transfer Tokens**:  
   - Users can transfer their tokens among each other, fostering interaction and collaboration.

4. **Redeem Tokens for Items**:  
   - Users can burn their tokens in exchange for virtual fashion items, enriching their inventory and enhancing their gaming experience.

5. **Check Balances**:  
   - Users can easily check their token balance and the number of outfit items they own, providing transparency and encouraging engagement.

## License  
This contract is licensed under the MIT License.
## Video Explanation
https://www.loom.com/share/7a5ad42cbcdf424f9a5805391cefe176

