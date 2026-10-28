# Somnia Insurance AI ($SOMINS)
[![CI/CD Pipeline](https://github.com/elon00/somnia-insurance-ai/actions/workflows/ci-cd-pipeline.yml/badge.svg)](https://github.com/elon00/somnia-insurance-ai/actions/workflows/ci-cd-pipeline.yml)
[![Reality Check](https://img.shields.io/badge/Reality%20Check-100%2F100%20GENUINE%20GREEN-emerald.svg)](tests/reality_check_harness.py)
[![PQC Standard](https://img.shields.io/badge/NIST-FIPS%20203%2F204-purple.svg)]()
[![Blockchain](https://img.shields.io/badge/Blockchain-Somnia%20Network%20L1%20(Tokyo%20Testnet)-blue.svg)]()

> **Sub-Millisecond Perpetual DEX Margin & Slippage Protection, Liquidation Cascade Buffer, and High-Throughput Claim Processing on Somnia L1.**

---

## 🏛️ Project Profile
- **Project Identity:** Somnia Insurance AI
- **Asset Ticker:** $SOMINS
- **Core Theme:** Sub-Millisecond Perp Margin & Slippage Protection Protocol
- **Blockchain:** Somnia Network L1 (Tokyo Testnet)
- **Smart Contract:** `SomniaDeFiInsuranceVault.sol`

---

## 🚀 Key Features
- **Deterministic 64-bit Conway Engine:** Non-linear invariant state machine in zero-dependency Rust (`src/main.rs`).
- **Native Smart Contract:** `SomniaDeFiInsuranceVault.sol` enforcing non-custodial parametric insurance and solvency invariants.
- **Agentic Actuary Service:** Autonomous Python client in `src/somnia_actuary_agent.py`.
- **Interactive QUX Launchpad:** Responsive dashboard with live Conway visualizer and Web4 QR generator (`index.html`).
- **Model Context Protocol (MCP):** 2 native tools exposed via `mcp.json`.

---

## 🧪 Testing & Verification
```bash
# Run 5-Gate Reality Check Test Harness
python tests/reality_check_harness.py

# Run Unit & Integrity Test Suite
python -m unittest discover tests
```
