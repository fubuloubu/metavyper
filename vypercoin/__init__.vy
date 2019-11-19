balanceOf: public(map(address, uint256))  # Only define public here
allowance: public(map(address, map(address, uint256)))  # Ditto...

proxy_registrations: map(method_id, address)  # Used for internal proxy registration


# Part of the proxy contract's public API
@public
def transfer(to: address, amt: uint256) -> bool:
    return delegate_call(self.proxy_registrations[self.transfer],  # get proxy address
                         self.transfer,  # Method ID
                         abi.encode(to, amt)  # Arguments
                        )  # returns success

...

# Define some authorization logic around this....
def register_proxy(method: method_id, proxy_address: address):
    self.proxy_registrations[method] = proxy_address
