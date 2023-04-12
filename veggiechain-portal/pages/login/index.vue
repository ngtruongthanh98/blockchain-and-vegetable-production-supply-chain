<template>
  <div class="login-page">
    <el-card class="login-card">
      <span slot="header">Login</span>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="User role" prop="userRole">
          <el-radio-group v-model="form.userRole">
            <el-radio label="Farmer"></el-radio>
            <el-radio label="Factory"></el-radio>
            <el-radio label="Distributor"></el-radio>
            <el-radio label="Retailer"></el-radio>
            <el-radio label="Customer"></el-radio>
          </el-radio-group>
        </el-form-item>

        <el-form-item>
          <el-button type="primary" @click="onMetamaskLogin"
            >Login with Metamask</el-button
          >
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script>
import Web3 from 'web3'
export default {
  name: 'Login',
  data() {
    return {
      connected: false,
      selectedOption: '',
      isUserLogged: this.$store.state.userInfo.isLoggedIn,
      form: {
        userRole: '',
      },
      rules: {
        userRole: [
          {
            required: true,
            message: 'Please select a user role',
            trigger: 'blur',
          },
        ],
      },
    }
  },
  methods: {
    onMetamaskLogin() {
      if (!window.ethereum) {
        alert('Metamask is not installed in your browser')
        return
      }

      window.ethereum
        .request({ method: 'eth_requestAccounts' })
        .then((accounts) => {
          const ethereumAddress = accounts[0]
          this.$store.commit('isUserLoggedIn', true)
          this.$store.commit('setUserRole', this.form.userRole.toLowerCase())
          this.$store.commit('setEthereumAddress', ethereumAddress)
          this.$router.push(`/${this.form.userRole.toLowerCase()}`)
        })
        .catch((error) => {
          alert('Metamask login failed')
          console.error(error)
        })
    },
  },
}
</script>
<style lang="scss" scoped>
.login-page {
  min-height: calc(100vh - 72px - 80px);
  display: flex;
  justify-content: center;
  align-items: center;

  .login-card {
    width: 400px;

    .el-radio-group {
      display: flex;
      flex-direction: column;
      margin-bottom: 10px;

      .el-radio {
        margin-bottom: 10px;

        &:last-child {
          margin-bottom: 0;
        }

        .el-radio__label {
          font-size: 16px;
          font-weight: 500;
          color: #333;
          padding-left: 8px;
        }

        .el-radio__input {
          border: 2px solid #c4c4c4;
          border-radius: 50%;
          width: 16px;
          height: 16px;
          margin-right: 10px;
          position: relative;

          &:before {
            content: '';
            display: block;
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background-color: #c4c4c4;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) scale(0);
            transition: transform 0.3s ease-in-out;
          }

          &:hover:before {
            transform: translate(-50%, -50%) scale(1.2);
          }

          &.is-checked:before {
            transform: translate(-50%, -50%) scale(1);
            background-color: #47a9eb;
          }
        }
      }
    }
  }
}
</style>
