balanceOf: map(address, uint256)  # Same storage slot location as __init__.vy

def transfer(to: address, amt: uint256) -> bool:
    self.balanceOf[msg.sender] -= amt
    self.balanceOf[to] += amt
    return True
