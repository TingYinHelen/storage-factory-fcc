// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

import "./SimpleStorage.sol";
// 使用is指定继承关系
contract ExtraStorage is SimpleStorage {
  // 重写store函数，还需要在SimpleStorage的store函数加上virtual修饰符
    function store(uint256 _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber + 5;
    }
}

