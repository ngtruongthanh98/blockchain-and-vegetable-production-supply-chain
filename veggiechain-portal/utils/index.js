export function maskAddress(address) {
  if (address.length < 10) {
    return address
  } else {
    return `${address.slice(0, 4)}****${address.slice(-4)}`
  }
}