# RegenLoop Market

A resource-recovery marketplace that locks buyer funds and releases payment when verified waste batches are processed.

Former project name: Waste Processing Cooperative Resource Recovery

## Problem

Waste cooperatives need trustworthy settlement for verified material processing, but manual receipts make recovery claims hard to audit. RegenLoop Market ties batch verification to Stellar escrow and token-transfer events.

## How It Works

1. A user connects a Freighter wallet on Stellar testnet.
2. The app opens a recovery batch in a Soroban Rust contract.
3. Funds move into the contract using the Stellar XLM SAC token interface.
4. A verifier records the project-specific score and status.
5. The contract releases payment to the approved recipient and leaves an auditable event trail.

## How It Uses Stellar

- Stellar testnet for fast, low-cost payment settlement.
- Freighter wallet for user-controlled signing.
- Soroban Rust smart contract for verified recovery batch marketplace.
- XLM SAC for live testnet escrow transfers.
- Soroban RPC for simulation, submission, and finality.
- Express API exposes an x402-style payment quote route.
- Aquarius and Soroswap are documented as future liquidity discovery and asset conversion paths for material-backed reward flows.

## Track

Track 6 Open Innovation

## Tech Stack

- Framework: Next.js 15 + React 19 + TypeScript
- Backend: Express + TypeScript
- Database: Prisma + SQLite
- Smart contract: Rust + Soroban SDK
- Stellar SDK: @stellar/stellar-sdk
- Wallet: Freighter
- Network: Stellar testnet

## Rust Contract API

- `open_recovery_batch(id, owner, target)`
- `fund_buyer_escrow(id, from, amount)`
- `verify_processing(id, score, status)`
- `release_recycler_payment(id, to, amount)`
- `get_record(id)`
- `total_locked()`

## Setup & Run

```bash
git clone https://github.com/iwanqnalangtalagabatakonagcode/regenloop-market.git
cd regenloop-market
npm install
npm run db:generate
npm --workspace backend run db:migrate
npm run db:seed
npm run dev
```

Frontend: http://localhost:3000
Backend: http://localhost:4000

## Contract

```bash
cd contract
cargo test
stellar contract build
```

Deploy after building:

```bash
stellar contract deploy --wasm target/wasm32v1-none/release/regenloop_market_contract.wasm --source alice --network testnet -- --admin alice --asset CDLZFC3SYJYDZT7K67VZ75HPJVIEUVNIXF47ZG2FB2RMQQVU2HHGCYSC --project_name "RegenLoop Market"
```

## Network Details

- Network: Stellar testnet
- RPC URL: https://soroban-testnet.stellar.org
- Horizon URL: https://horizon-testnet.stellar.org
- XLM SAC: CDLZFC3SYJYDZT7K67VZ75HPJVIEUVNIXF47ZG2FB2RMQQVU2HHGCYSC
- USDC SAC: CBIELTK6YBZJU5UP2WWQEUCYKLPU6AUNZ2BQ4WWFEIE3USCIHMXQDAMA
- Contract ID: CBJBNRIQZU7NXA5DDMZJBJJW2SKSHI3VGYA5RP7USOX4TI76RLJTM5ZZ

## Docs

- docs/Submission_Guideliness.md
- docs/stellar-fullstack-cheatsheet.md
- docs/dev_setup.md
- docs/contract.md
- docs/api.md

## Originality

This is original StellarX Philippines hackathon work. It uses open-source Stellar SDKs, Soroban Rust SDK, AI-assisted development, and disclosed ecosystem integration paths. It is not a barely modified template.

## Team

- loaferss - @iwanqnalangtalagabatakonagcode

## License

MIT
