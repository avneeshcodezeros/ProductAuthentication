// SPDX-License-Identifier: UNLICENSED
pragma solidity^0.8.19;

contract Authentication {
    string public manufacturer;


    constructor( string memory _manufacturer) {
        manufacturer = _manufacturer;
    }

    uint public numOfProductsAdded;


    struct product{
        uint Id;
        uint Code;
        string description;
        uint price;
        uint manufactureTimestamp;
        uint quantityAvailable;
    }

    mapping(uint => product) public Product;

    function AddProduct(uint _code, uint _price, string memory _description, uint _manufactureTime, uint _quantity) public {
        for(uint i = 0; i <= numOfProductsAdded; i++) {
        if(Product[i+1].Id == 0) {
            Product[i+1].Id = i+1;
            Product[i+1].Code = _code;
            Product[i+1].description = _description;
            Product[i+1].price = _price;
            Product[i+1].manufactureTimestamp = _manufactureTime;
            Product[i+1].quantityAvailable = _quantity;
            numOfProductsAdded++;
            return;
        }

        else if(Product[i+1].Code == _code) {
            Product[i+1].description = _description;
            Product[i+1].quantityAvailable += _quantity;
            return; 
        }
    }
    }

    function CheckAuthenticity(uint _code) public view returns(bool) {
        bool yes = false;
        for(uint i=0;i<numOfProductsAdded;i++) {
            if(_code == Product[i+1].Code) {
                yes = true;
            }
        }
        return yes;
    }


    function Product1(uint _id) public view returns(product memory) {
        return Product[_id];
    }
}
