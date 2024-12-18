// SPDX-License-Identifier: MIT
pragma solidity 0.8.24; // solidity version

contract SimpleStorage {
    // Basic types: boolean, uint, int, address, bytes, string
    // Can specify the number of bits for uint & int (max 256)
    // Bytes max = 32 and string type converts to bytes easily
    
    // Four different visibility settings (public, private, external, internal)
    // Public is equivalent to creating a getter function for variable
    // variables created outside of functions are automatically set as storage - permanent
    uint256 myFavoriteNumber; // defaults as 0 with no assignment
    
    // uint256[] listOfFavoriteNumbers;
    struct Person{ // custom type
        uint256 favoriteNumber;
        string name;
    }

    // create new instance of custom Person type
    // Person public pat = Person({favoriteNumber: 7, name: "Pat"});

    // dynamic array - size can grow/shrink (no number within brackets)
    Person[] public listOfPeople; // defaults to an empty list
    // mapping to allow for searching on name and returning the favorite number
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    // view (read state only), pure (disallow reading and modifying state) - requires no transaction and gas, except when another function calls it
    function retrieve() public view returns(uint256) {
        return myFavoriteNumber;
    }

    // calldata (temp @ function call / cannot be changed), memory (temp @ function call / can be changed), storage - places EVM can store data
    // most function variables default to memory, but strings don't
    // create mapping: would have to iterate through by index to find person
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push( Person(_favoriteNumber, _name) ); // Adds new items to array
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}

// KEY TERMS
// -----------
// DATA TYPES: boolean, uint, int, address, bytes, string
// VISIBILITY SETTINGS: public, private, external, internal
// ARRAYS: dynamic, static
// STORAGE SETTINGS: calldata, memory, storage
