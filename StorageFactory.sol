// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.7;
// 现在编译版本是0.8的任意版本都可用。而SimpleStorage的是^0.8.8，那么是可以编译通过的，
// 如果将StorageFactor的版本改为^0.7.0，编译就会报错，因为StorageFactor是0.7版本的任意版本都可以用
// 而Simplestore是0.8.8以上，那么这两个版本不兼容，所以两个编译版本需要兼容
// 这里可以指定其他文件的路径，也可以指定其他包或者Github的路径
import "./SimpleStorage.sol"; 

contract StorageFactory {
    
    SimpleStorage[] public simpleStorageArray;
    
    function createSimpleStorageContract() public {
      // 使用new方法就可以部署合约
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }
    
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // Address 
        // ABI 
        // SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber);
        simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }
    
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        // return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve();
        return simpleStorageArray[_simpleStorageIndex].retrieve();
    }
}
// 这里查看simpleStorageArr，可以看到部署后合约的地址

// 与其他合约交互需要两样东西，1. 合约地址，2. 合约ABI
// Address：这里我们把地址存在了simpleStorageArr里
// ABI: 是指应用程序二进制接口，ABI会告诉我们的代码如何来跟合约交互，只要我们导入的合约，就能获取他的ABI


