// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract LinguisticsEnglishTokens is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    
    uint256 public constant MAX_TOKENS = 10000;
    uint256 public constant MAX_TOKENS_PER_REQUEST = 10;
    
    uint256 public tokensMinted = 0;
    
    mapping (uint256 => string) private _tokenURIs;

    constructor() ERC721("English Linguistics Tokens", "ENL") {}

    function requestTokens(uint256 _numberOfTokens, string memory _tokenName) public {
        require(_numberOfTokens > 0, "Number of tokens requested must be greater than zero");
        require(tokensMinted + _numberOfTokens <= MAX_TOKENS, "Exceeds maximum number of tokens that can be minted");
        require(_numberOfTokens <= MAX_TOKENS_PER_REQUEST, "Exceeds maximum tokens that can be minted per request");

        for (uint256 i = 0; i < _numberOfTokens; i++) {
            uint256 tokenId = tokensMinted + 1;
            _safeMint(msg.sender, tokenId);
            _setTokenURI(tokenId, string(abi.encodePacked(_tokenName, "-", block.timestamp)));
            tokensMinted++;
        }
    }
    
    function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal virtual {
        require(_exists(tokenId), "ERC721Metadata: URI set of nonexistent token");
        _tokenURIs[tokenId] = _tokenURI;
    }
    
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
        return _tokenURIs[tokenId];
    }
}


