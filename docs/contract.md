# Contract Design

RegenLoop Market follows the three-part Soroban guide:

1. Struct + impl: `contract/src/lib.rs`
2. Storage: `contract/src/storage.rs`
3. Errors + types: `contract/src/errors.rs` and `contract/src/types.rs`

## Domain API

- `open_recovery_batch`: open a recovery batch.
- `fund_buyer_escrow`: transfer XLM SAC into contract escrow.
- `verify_processing`: admin/verifier records score and status.
- `release_recycler_payment`: transfer approved funds out of contract escrow.

Storage TTL is extended for both instance and persistent keys.
