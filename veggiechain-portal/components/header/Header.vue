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
        v-if="userRole === 'farmer'"
        :to="{ name: 'farmer' }"
        class="product-element flex items-center"
        exact-active-class="is-active"
      >
        <div class="icon-farmer"></div>
        <span>Farmer</span>
      </nuxt-link>

      <nuxt-link
        v-if="userRole === 'distributor'"
        :to="{ name: 'distributor' }"
        class="product-element flex items-center"
        exact-active-class="is-active"
      >
        <div class="icon-distributor"></div>
        <span>Distributor</span>
      </nuxt-link>

      <nuxt-link
        v-if="userRole === 'factory'"
        :to="{ name: 'factory' }"
        class="product-element flex items-center"
        exact-active-class="is-active"
      >
        <div class="icon-factory"></div>
        <span>Factory</span>
      </nuxt-link>

      <nuxt-link
        v-if="userRole === 'factory'"
        :to="{ name: 'factory' }"
        class="product-element flex items-center"
        exact-active-class="is-active"
      >
        <div class="icon-factory"></div>
        <span>Factory</span>
      </nuxt-link>

      <nuxt-link
        v-if="userRole === 'retailer'"
        :to="{ name: 'retailer' }"
        class="product-element flex items-center"
        exact-active-class="is-active"
      >
        <div class="icon-retailer"></div>
        <span>Retailer</span>
      </nuxt-link>

      <nuxt-link
        v-if="userRole === 'customer'"
        :to="{ name: 'customer' }"
        class="product-element flex items-center"
        exact-active-class="is-active"
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

      <nuxt-link
        :to="{ name: 'about-us' }"
        class="about flex items-center"
        exact-active-class="is-active"
      >
        <div class="icon-info"></div>
        <span>About us</span>
      </nuxt-link>
    </div>
  </nav>
</template>


<script>
export default {
  name: 'VmHeader',
  computed: {
    userRole() {
      return this.$store.getters.getUserRole
    },
  },
}
</script>

<style lang="scss" scoped>
.custom-navbar {
  box-shadow: rgba(0, 0, 0, 0.08) 0px 4px 12px;
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

  .about {
    padding: 16px;
    height: 100%;

    .icon-info {
      background: url('../../static/info-icon.png') no-repeat;
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
</style>
