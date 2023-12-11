// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Authentication} from "../src/Authentication.sol";
import {DSTest} from "ds-test/test.sol";


contract CounterTest is DSTest {
    Authentication public authentication;

    function setUp() public {
        authentication = new Authentication("sdfg");
    }
    // add product function;
    function testProductCode() public {
        authentication.AddProduct(123, 100, "Nike AirJordan", 124587365, 100);
        Authentication.product memory storedStruct = authentication.Product1(1);
        assertEq(storedStruct.Code, 123,"poduct code is different");

    }

    function testProductId() public {
        authentication.AddProduct(123, 100, "Nike AirJordan", 124587365, 100);
        Authentication.product memory storedStruct = authentication.Product1(1);
        assertEq(storedStruct.Id, 1,"poduct id is different");
    }

     function testProductPrice() public {
        authentication.AddProduct(123, 100, "Nike AirJordan", 124587365, 100);
        Authentication.product memory storedStruct = authentication.Product1(1);
        assertEq(storedStruct.price, 100,"poduct price is different");

    }
     function testProductManufacture() public {
        authentication.AddProduct(123, 100, "Nike AirJordan", 124587365, 100);
        Authentication.product memory storedStruct = authentication.Product1(1);
        assertEq(storedStruct.manufactureTimestamp, 124587365,"poduct manufacture timestamp is different");

    }
     function testProductQuantityAvailable() public {
        authentication.AddProduct(123, 100, "Nike AirJordan", 124587365, 100);
        Authentication.product memory storedStruct = authentication.Product1(1);
        assertEq(storedStruct.quantityAvailable,100,"poduct quantity is different");

    }

    // test authenticity of the product

    function testAuthenticity() public {
        authentication.AddProduct(123, 100, "Nike AirJordan", 124587365, 100);
        (bool yes) = authentication.CheckAuthenticity(123);
        assertTrue(yes);
    }
}
