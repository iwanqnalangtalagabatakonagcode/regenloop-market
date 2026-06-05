# Testnet Transaction Verification

Test date: 2026-06-05

## Summary

RegenLoop Market was deployed and tested on Stellar testnet with the local Stellar CLI identity `alice`.

## Deployment

- Contract ID: `CBJBNRIQZU7NXA5DDMZJBJJW2SKSHI3VGYA5RP7USOX4TI76RLJTM5ZZ`
- Deploy transaction: https://stellar.expert/explorer/testnet/tx/58a92e6c67dc5db7f02c84b0395f325b75ac1fe35519f683b12b12c952c4a6cc
- Lab contract page: https://lab.stellar.org/r/testnet/contract/CBJBNRIQZU7NXA5DDMZJBJJW2SKSHI3VGYA5RP7USOX4TI76RLJTM5ZZ

## Transaction Flow Tested

Record ID: `tx-regenloop-001`

1. `open_recovery_batch` opened the record.
   Transaction: https://stellar.expert/explorer/testnet/tx/5e8fce5c017cf3a11427f6a2d561a9cf57c1c7c687829a07f92e6a50d7560c51
2. `fund_buyer_escrow` funded escrow with `500000` XLM SAC units.
   Transaction: https://stellar.expert/explorer/testnet/tx/07d7f0035372518b49ba25acdd69813c12ec2e1f08a88e85b9677eeed4c2a867
3. `verify_processing` recorded score `92` and status `processed`.
   Transaction: https://stellar.expert/explorer/testnet/tx/55dcd6fc166a057b6654671707063a33edde1bf7d26c4ede405da54e9ea2de6c
4. `release_recycler_payment` released `250000` XLM SAC units.
   Transaction: https://stellar.expert/explorer/testnet/tx/5009663e35da3e92671d2bf7fd717b6264cd236a1b4addcf8bb9caed5a83a93b
5. `total_locked` returned `250000`.
6. `get_record` returned `funded=500000`, `released=250000`, and `status=released`.

## Result

Passed. The contract accepted signed writes, moved testnet XLM SAC through the token interface, emitted events, and returned the expected final state.
