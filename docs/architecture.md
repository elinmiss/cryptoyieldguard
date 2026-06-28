# Architecture CryptoYieldGuard

## Overview
CryptoYieldGuard adalah platform DeFi Protection yang menggabungkan risk assessment, automated hedging, dan community insurance pool.

## Tech Stack
- Smart Contract: Solidity 0.8.24 + Foundry
- Frontend: Next.js 15 + Wagmi + Viem
- Oracle: Chainlink Data Feeds
- Indexing: The Graph
- Storage: IPFS

## Main Components
1. **RiskEngine** → Menghitung risk score posisi user
2. **YieldGuard** → Core contract untuk register & claim protection
3. **ProtectionPool** → Community insurance pool
4. **RiskBadgeNFT** → Reputation system

## Future Development
- AI Alert System
- Multi-chain support (Base, Arbitrum, Solana)
- Advanced hedging strategy
