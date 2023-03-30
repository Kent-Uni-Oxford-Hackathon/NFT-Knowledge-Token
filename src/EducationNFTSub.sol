pragma solidity ^0.8.0;



import "./EducationNFTCore.sol";

contract EducationNFTSub is EducationNFTCore {
    enum MathSubCategory { Algebra, Geometry, Calculus, Trigonometry }
    enum ScienceSubCategory { Physics, Chemistry, Biology, ComputerScience }
    enum EnglishSubCategory { Grammar, Literature, Writing, PublicSpeaking }
    enum HistorySubCategory { AncientHistory, ModernHistory, SocialHistory, PoliticalHistory }

    mapping(uint256 => MathSubCategory) private _mathSubCategories;
    mapping(uint256 => ScienceSubCategory) private _scienceSubCategories;
    mapping(uint256 => EnglishSubCategory) private _englishSubCategories;
    mapping(uint256 => HistorySubCategory) private _historySubCategories;

    uint256 private _tokenCount = 0;

    function _generateTokenURI(TokenCategory category, uint256 subCategory) internal returns (string memory) {
        string[3] memory parts;
        parts[0] = "EducationNFT - ";
        parts[1] = getCategoryName(category);
        parts[2] = " - Token ID: ";
        string memory uri = string(abi.encodePacked(parts[0], parts[1], "/", getSubCategoryName(category, subCategory), parts[2], Strings.toString(_tokenCount)));
        return uri;
    }

    function getCategoryName(TokenCategory category) internal pure returns (string memory) {
        if (category == TokenCategory.Math) {
            return "Mathematics";
        } else if (category == TokenCategory.Science) {
            return "Science";
        } else if (category == TokenCategory.English) {
            return "English";
        } else {
            return "History";
        }
    }

    function getSubCategoryName(TokenCategory category, uint256 subCategory) internal pure returns (string memory) {
        if (category == TokenCategory.Math) {
            return getMathSubCategoryName(MathSubCategory(subCategory));
        } else if (category == TokenCategory.Science) {
            return getScienceSubCategoryName(ScienceSubCategory(subCategory));
        } else if (category == TokenCategory.English) {
            return getEnglishSubCategoryName(EnglishSubCategory(subCategory));
        } else {
            return getHistorySubCategoryName(HistorySubCategory(subCategory));
        }
    }

    function getMathSubCategoryName(MathSubCategory subCategory) internal pure returns (string memory) {
        if (subCategory == MathSubCategory.Algebra) {
            return "Algebra";
        } else if (subCategory == MathSubCategory.Geometry) {
            return "Geometry";
        } else if (subCategory == MathSubCategory.Calculus) {
            return "Calculus";
        } else {
            return "Trigonometry";
        }
    }

    function getScienceSubCategoryName(ScienceSubCategory subCategory) internal pure returns (string memory) {
        if (subCategory == ScienceSubCategory.Physics) {
            return "Physics";
        } else if (subCategory == ScienceSubCategory.Chemistry) {
            return "Chemistry";
        } else if (subCategory == ScienceSubCategory.Biology) {
            return "Biology";
        } else {
            return "Computer Science";
        }
    }

    function getEnglishSubCategoryName(EnglishSubCategory subCategory) internal pure returns (string memory) {
        if (subCategory == EnglishSubCategory.Grammar) {
            return "Grammar";
        } else if (subCategory == EnglishSubCategory.Literature) {
            return "Literature";
        } else if (subCategory == EnglishSubCategory.Writing) {
            return "Writing";
        } else if (subCategory == EnglishSubCategory.PublicSpeaking) {
            return "Public Speaking";
        }
    }
    function getHistorySubCategoryName(HistorySubCategory subCategory) internal pure returns (string memory) {
        if (subCategory == HistorySubCategory.AncientHistory) {
            return "Ancient History";
        } else if (subCategory == HistorySubCategory.ModernHistory) {
            return "Modern History";
        } else if (subCategory == HistorySubCategory.SocialHistory) {
            return "Social History";
        } else {
            return "Political History";
        }
    }
}