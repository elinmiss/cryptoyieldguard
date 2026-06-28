// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract YieldGuard is Ownable {
    struct Position {
        address user;
        address token;
        uint256 amount;
        uint256 riskScore;
        uint256 timestamp;
    }

    mapping(address => Position) public userPositions;
    mapping(address => uint256) public protectionBalance;

    event PositionRegistered(address indexed user, uint256 riskScore);
    event ProtectionClaimed(address indexed user, uint256 amount);

    constructor() Ownable(msg.sender) {}

    function registerPosition(address token, uint256 amount) external {
        uint256 riskScore = calculateRiskScore(token);
        
        userPositions[msg.sender] = Position({
            user: msg.sender,
            token: token,
            amount: amount,
            riskScore: riskScore,
            timestamp: block.timestamp
        });

        emit PositionRegistered(msg.sender, riskScore);
    }

    function calculateRiskScore(address token) internal pure returns (uint256) {
        // Logic dummy - nanti bisa dikembangkan
        return 65;
    }

    function claimProtection() external {
        require(protectionBalance[msg.sender] > 0, "No protection available");
        uint256 amount = protectionBalance[msg.sender];
        protectionBalance[msg.sender] = 0;
        
        emit ProtectionClaimed(msg.sender, amount);
    }
}
