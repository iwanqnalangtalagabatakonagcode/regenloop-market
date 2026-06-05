#!/usr/bin/env bash
set -euo pipefail
cd contract
stellar contract deploy --wasm target/wasm32v1-none/release/regenloop_market_contract.wasm --source ${SOURCE:-alice} --network ${NETWORK:-testnet} -- --admin ${SOURCE:-alice} --asset ${XLM_SAC:-CDLZFC3SYJYDZT7K67VZ75HPJVIEUVNIXF47ZG2FB2RMQQVU2HHGCYSC} --project_name "RegenLoop Market"
