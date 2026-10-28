// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title SomniaDeFiInsuranceVault
 * @dev Ultra-High-Throughput 100k TPS Perp Slippage & Liquidation Coverage Vault
 */
contract SomniaDeFiInsuranceVault {
    struct MarginPolicy {
        address trader;
        uint256 coveredPositionSize;
        uint256 maxSlippageBps;
        uint256 depositCollateral;
        bool isActive;
    }

    mapping(address => MarginPolicy) public marginPolicies;
    uint256 public constant MAX_SLIPPAGE_TOLERANCE = 1000; // 10%

    event SlippagePolicyCreated(address indexed trader, uint256 positionSize, uint256 maxSlippage);
    event SlippageCompensated(address indexed trader, uint256 indemnityAmount, uint256 actualSlippage);

    function purchaseSlippageCover(uint256 positionSize, uint256 maxSlippage) external payable {
        require(msg.value > 0, "Zero collateral");
        require(maxSlippage <= MAX_SLIPPAGE_TOLERANCE, "Exceeds max allowed slippage");

        marginPolicies[msg.sender] = MarginPolicy({
            trader: msg.sender,
            coveredPositionSize: positionSize,
            maxSlippageBps: maxSlippage,
            depositCollateral: msg.value,
            isActive: true
        });

        emit SlippagePolicyCreated(msg.sender, positionSize, maxSlippage);
    }

    function claimSlippageIndemnity(uint256 actualSlippageBps) external {
        MarginPolicy storage p = marginPolicies[msg.sender];
        require(p.isActive, "Policy inactive");
        require(actualSlippageBps > p.maxSlippageBps, "No excess slippage");

        uint256 excessBps = actualSlippageBps - p.maxSlippageBps;
        uint256 indemnity = (p.coveredPositionSize * excessBps) / 10000;
        p.isActive = false;

        payable(msg.sender).transfer(indemnity);
        emit SlippageCompensated(msg.sender, indemnity, actualSlippageBps);
    }
}
