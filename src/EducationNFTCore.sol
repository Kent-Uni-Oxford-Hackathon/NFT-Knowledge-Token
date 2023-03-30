// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract EducationNFTCore is ERC721URIStorage, Ownable {
    enum TokenCategory { Math, Science, English, History }
    
    mapping(uint256 => TokenCategory) private _tokenCategories;
    
    uint256 private _tokenCount;
    
    constructor() ERC721("EducationNFTCore", "EDUCORE") {}
    
    function mintToken(address recipient, TokenCategory category, string memory tokenURI) public onlyOwner returns (uint256) {
        require(category >= TokenCategory.Math && category <= TokenCategory.History, "Invalid token category");
        _tokenCount++;
        uint256 tokenId = _tokenCount;
        _mint(recipient, tokenId);
        _setTokenURI(tokenId, tokenURI);
        _tokenCategories[tokenId] = category;
        return tokenId;
    }
}