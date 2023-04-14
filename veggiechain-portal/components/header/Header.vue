<template>
  <nav
    class="flex justify-between sticky top-0 bg-white z-10 custom-navbar"
    role="navigation"
    aria-label="main navigation"
  >
    <nuxt-link
      :to="{ name: 'index' }"
      class="app-logo navbar-item flex items-center"
    >
      <h1 class="icon"></h1>
      <span class="logo-title">VeggieChain</span>
    </nuxt-link>

    <div class="flex items-center item-container">
      <nuxt-link
        :to="{ name: 'farmer' }"
        class="product-element flex items-center"
        exact-active-class="is-active"
        v-if="isUserLogged && userRole === 'farmer'"
      >
        <div class="icon-farmer"></div>
        <span>Farmer</span>
      </nuxt-link>

      <nuxt-link
        :to="{ name: 'distributor' }"
        class="product-element flex items-center"
        exact-active-class="is-active"
        v-if="isUserLogged && userRole === 'distributor'"
      >
        <div class="icon-distributor"></div>
        <span>Distributor</span>
      </nuxt-link>

      <nuxt-link
        :to="{ name: 'factory' }"
        class="product-element flex items-center"
        exact-active-class="is-active"
        v-if="isUserLogged && userRole === 'factory'"
      >
        <div class="icon-factory"></div>
        <span>Factory</span>
      </nuxt-link>

      <nuxt-link
        :to="{ name: 'retailer' }"
        class="product-element flex items-center"
        exact-active-class="is-active"
        v-if="isUserLogged && userRole === 'retailer'"
      >
        <div class="icon-retailer"></div>
        <span>Retailer</span>
      </nuxt-link>

      <nuxt-link
        :to="{ name: 'customer' }"
        class="product-element flex items-center"
        exact-active-class="is-active"
        v-if="isUserLogged && userRole === 'customer'"
      >
        <div class="icon-customer"></div>
        <span>Customer</span>
      </nuxt-link>

      <nuxt-link
        :to="{ name: 'products' }"
        class="product-element flex items-center"
        exact-active-class="is-active"
      >
        <div class="icon-product-cycle"></div>
        <span>Products</span>
      </nuxt-link>
    </div>

    <div class="button-container">
      <div
        v-if="this.$store.state.accountAddress && isUserLogged"
        class="getting-text"
      >
        <span>Hi</span>
        <b>{{ maskAddress(this.$store.state.accountAddress) }}</b>
      </div>

      <a
        href="#"
        class="login-btn flex items-center"
        :class="{ hidden: $route.name === 'login' }"
        @click.prevent="onHandleLogin"
      >
        <span>{{ isUserLogged ? 'Logout' : 'Login with MetaMask' }}</span>
      </a>
    </div>
  </nav>
</template>


<script>
import { maskAddress } from '@/utils'
import Web3 from 'web3'
import accounts from '../../../accounts.json'

export default {
  name: 'VmHeader',
  computed: {
    isUserLogged() {
      return this.$store.state.userInfo.isLoggedIn
    },
    userRole() {
      return this.$store.getters.getUserRole
    },
  },
  mounted() {
    console.log('accounts: ', accounts)

    const accountList = accounts.accountList
    this.$store.commit('setOriginAddressList', accountList)

    const customAccountList = []

    const roles = [
      ['farmer', 'distributor', 'retailer'],
      ['distributor', 'factory', 'retailer'],
      ['farmer', 'factory', 'retailer'],
      ['distributor', 'farmer', 'factory'],
      ['factory', 'distributor', 'retailer'],
      ['farmer', 'distributor', 'retailer'],
      ['factory', 'distributor', 'retailer'],
      ['farmer', 'retailer'],
      ['farmer', 'distributor', 'retailer'],
      ['distributor', 'retailer'],
    ]

    const accountArray = []
    for (let i = 0; i < accountList.length; i++) {
      const account = {
        address: accountList[i].toLowerCase(),
        roles: roles[i],
      }
      accountArray.push(account)

      customAccountList.push(accountList[i].toLowerCase())
    }

    this.$store.commit('setAccountMappingRole', accountArray)
    this.$store.commit('setAccountList', customAccountList)
  },
  methods: {
    maskAddress,
    onHandleLogin() {
      if (this.isUserLogged) {
        this.$store.commit('isUserLoggedIn', false)
        this.$store.commit('setAccountAddress', '')
        this.$store.commit('setUserRole', '')
        this.$router.push('/')
      } else {
        if (!window.ethereum) {
          alert('Metamask is not installed in your browser')
          return
        }

        window.ethereum
          .request({ method: 'eth_requestAccounts' })
          .then((accounts) => {
            const ethereumAddress = accounts[0]
            console.log('ethereumAddress: ', accounts[0])
            this.$store.commit('isUserLoggedIn', true)
            this.$store.commit('setAccountAddress', ethereumAddress)
            this.$router.push('/select-role')
          })
          .catch((error) => {
            alert('Metamask login failed')
            console.error(error)
          })
      }
    },
  },
}
</script>

<style lang="scss" scoped>
.custom-navbar {
  box-shadow: rgba(0, 0, 0, 0.08) 0px 4px 12px;
  align-items: center;
}

.app-logo {
  padding: 16px;

  .icon {
    background: url('../../static/vegetable.png') no-repeat;
    background-position: 50% 50%;
    background-size: 40px;
    height: 40px;
    width: 40px;
    margin-left: 5px;
  }

  .logo-title {
    font-weight: 500;
    margin-left: 4px;
  }
}

.item-container {
  .product-element {
    padding: 16px;
    height: 100%;

    .icon-product-cycle {
      background: url('../../static/smart-contracts.png') no-repeat;
      background-position: 50% 50%;
      background-size: 40px;

      width: 40px;
      height: 40px;
      margin-right: 5px;
    }

    .icon-farmer {
      background: url('../../static/svg/farmer.svg') no-repeat;
      background-position: 50% 50%;
      background-size: 40px;

      width: 40px;
      height: 40px;
      margin-right: 5px;
    }

    .icon-distributor {
      background: url('../../static/distributor.png') no-repeat;
      background-position: 50% 50%;
      background-size: 40px;

      width: 40px;
      height: 40px;
      margin-right: 5px;
    }

    .icon-factory {
      background: url('../../static/factory.png') no-repeat;
      background-position: 50% 50%;
      background-size: 40px;

      width: 40px;
      height: 40px;
      margin-right: 5px;
    }

    .icon-retailer {
      background: url('../../static/retailer.png') no-repeat;
      background-position: 50% 50%;
      background-size: 40px;

      width: 40px;
      height: 40px;
      margin-right: 5px;
    }

    .icon-customer {
      background: url('../../static/customer.png') no-repeat;
      background-position: 50% 50%;
      background-size: 40px;

      width: 40px;
      height: 40px;
      margin-right: 5px;
    }

    &:hover {
      cursor: pointer;
      background-color: $primary-third;
    }

    &.is-active {
      background-color: $primary-secondary;
    }
  }
}

.button-container {
  display: flex;
  justify-content: space-between;
  align-items: center;

  .login-btn {
    display: flex;
    justify-content: center;

    background-color: #89cff0;
    color: white;
    padding: 10px 20px;
    border-radius: 5px;
    text-decoration: none;
    font-size: 1rem;
    transition: background-color 0.3s ease-in-out;
    margin-right: 16px;
    min-width: 100px;
    text-align: center;
  }

  .login-btn:hover {
    background-color: #9acffa;
  }

  .hidden {
    display: none;
  }

  .getting-text {
    margin-right: 16px;
  }
}
</style>
