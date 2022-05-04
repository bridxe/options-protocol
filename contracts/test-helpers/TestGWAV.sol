//SPDX-License-Identifier: ISC
pragma solidity 0.8.9;

import "../interfaces/ISynthetix.sol";
// Debug
import "./ITestERC20.sol";
import "../synthetix/DecimalMath.sol";
import "../lib/GWAV.sol";

contract TestGWAV {
  using GWAV for GWAV.Params;

  GWAV.Params public gwav;

  function initialize(uint currentVal, uint currentTimestamp) public {
    gwav.initialize(currentVal, currentTimestamp);
  }

  function recordMany(uint[] memory vals, uint[] memory timestamps) public {
    for (uint i = 0; i < vals.length; i++) {
      gwav.write(vals[i], timestamps[i]);
    }
  }

  function recordObservation(uint currentVal, uint currentTimestamp) public {
    gwav.write(currentVal, currentTimestamp);
  }

  function getGWAVBetween(uint timeA, uint timeB) public view returns (uint) {
    return gwav.getGWAVForPeriod(timeA, timeB);
  }

  function observe(uint[] memory times) public view returns (int[] memory qCumulatives, uint[] memory timestamps) {
    return gwav.observe(block.timestamp, times);
  }
}
