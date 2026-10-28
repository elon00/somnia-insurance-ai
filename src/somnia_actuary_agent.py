# -*- coding: utf-8 -*-
import hashlib
import time
import json

class SomniaPerpInsuranceActuary:
    def __init__(self, network: str = "Somnia Tokyo Testnet"):
        self.network = network

    def calculate_slippage_indemnity(self, order_id: str, expected_price: float, executed_price: float, size: float) -> dict:
        slippage_pct = abs(executed_price - expected_price) / expected_price * 100
        indemnity_due = size * (slippage_pct / 100) if slippage_pct > 1.5 else 0.0
        return {
            "order_id": order_id,
            "network": self.network,
            "expected_price": expected_price,
            "executed_price": executed_price,
            "slippage_percentage": round(slippage_pct, 3),
            "indemnity_payable": round(indemnity_due, 4),
            "status": "APPROVED_FOR_INSTANT_PAYOUT" if indemnity_due > 0 else "NORMAL_SLIPPAGE_THRESHOLD",
            "timestamp": int(time.time())
        }

if __name__ == "__main__":
    actuary = SomniaPerpInsuranceActuary()
    res = actuary.calculate_slippage_indemnity("som_ord_99812", 1.450, 1.485, 25000.0)
    print("Somnia Slippage Assessment:", json.dumps(res, indent=2))
