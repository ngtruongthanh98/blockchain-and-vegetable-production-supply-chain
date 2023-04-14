export function maskAddress(address) {
  if (address.length < 10) {
    return address
  } else {
    return `${address.slice(0, 4)}****${address.slice(-4)}`
  }
}

export function findFarmers(accountMappingRole, accountAddress) {
  const farmers = [];

  accountMappingRole.forEach(account => {
    if (account.roles.includes('factory') && account.address !== accountAddress) {
      farmers.push(account.address);
    }
  });

  return farmers;
}

export function findFactories(accountMappingRole, accountAddress) {
  const factories = [];

  accountMappingRole.forEach(account => {
    if (account.roles.includes('factory') && account.address !== accountAddress) {
      factories.push(account.address);
    }
  });

  return factories;
}

export function findDistributors(accountMappingRole, accountAddress) {
  const distributors = [];

  accountMappingRole.forEach(account => {
    if (account.roles.includes('factory') && account.address !== accountAddress) {
      distributors.push(account.address);
    }
  });

  return distributors;
}

export function findRetailers(accountMappingRole, accountAddress) {
  const retailers = [];

  accountMappingRole.forEach(account => {
    if (account.roles.includes('factory') && account.address !== accountAddress) {
      retailers.push(account.address);
    }
  });

  return retailers;
}

export function transformArray(accountAddressList, originAddressList) {
  const mappedAddressList = accountAddressList.map((address) => {
    const index = originAddressList.findIndex((originAddress) => originAddress.toLowerCase() === address.toLowerCase());
    if (index === -1) {
      return null;
    }
    return originAddressList[index];
  });

  return mappedAddressList
}

export function findIndexes(accountAddresses, originAddressList) {
  const indexes = [];

  for (const accountAddress of accountAddresses) {
    const index = originAddressList.findIndex(
      (address) => address.toLowerCase() === accountAddress.toLowerCase()
    );
    indexes.push(index);
  }

  return indexes;
}