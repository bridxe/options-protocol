//SPDX-License-Identifier: ISC
pragma solidity 0.8.9;

import "../PoolHedger.sol";

contract TestPoolHedger is PoolHedger {
  function hedgeDeltaExt(int expectedHedge) external {
    _hedgeDelta(expectedHedge);
  }

  function increaseLongExt(SynthetixAdapter.ExchangeParams memory exchangeParams, uint amount) external {
    // Last field is optional, only for event
    increaseLong(exchangeParams, amount, 0);
  }

  function decreaseLongExt(uint amount) external {
    // Last field is optional, only for event
    decreaseLong(amount, 0);
  }

  function callTransferQuoteToHedge(SynthetixAdapter.ExchangeParams memory exchangeParams, uint amount) external {
    liquidityPool.transferQuoteToHedge(exchangeParams, amount);
  }

  function setShortToExt(
    SynthetixAdapter.ExchangeParams memory exchangeParams,
    uint desiredShort,
    uint currentShort,
    uint currentCollateral
  ) external {
    setShortTo(exchangeParams, desiredShort, currentShort, currentCollateral);
  }

  function sendAllQuoteToLPExt() external {
    sendAllQuoteToLP();
  }
}
