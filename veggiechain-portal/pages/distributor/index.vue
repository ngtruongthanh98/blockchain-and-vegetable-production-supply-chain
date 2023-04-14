<template>
  <div class="distributor-page">
    <el-card class="card-container">
      <div class="title">Distributor Information</div>

      <el-form ref="form" :model="formData" style="max-width: 600px">
        <el-form-item label="Next Destination (Retailer)">
          <el-radio-group v-model="formData.nextDestination">
            <el-radio
              v-for="(retailer, index) in RETAILER_LIST"
              :key="index"
              :label="retailer.address"
            />
          </el-radio-group>
        </el-form-item>
        <el-form-item label="Company Name">
          <el-input v-model="formData.companyName"></el-input>
        </el-form-item>
        <el-form-item label="Location">
          <el-input v-model="formData.location"></el-input>
        </el-form-item>
        <el-form-item label="Contact Information">
          <el-input
            v-model="formData.contactName"
            placeholder="Name"
          ></el-input>
          <el-input
            v-model="formData.contactEmail"
            placeholder="Email"
          ></el-input>
          <el-input
            v-model="formData.contactPhone"
            placeholder="Phone"
          ></el-input>
        </el-form-item>
        <el-form-item label="Date of Pickup">
          <el-date-picker
            type="date"
            v-model="formData.pickupDate"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="Transportation Information">
          <el-input v-model="formData.transportation"></el-input>
        </el-form-item>
        <el-form-item label="Quality Control Information">
          <el-input v-model="formData.qualityControlInfo"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm">Submit</el-button>
          <el-button @click="resetForm">Reset</el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script>
import { loadContract } from '@/utils/loadContract'

export default {
  data() {
    return {
      formData: {
        nextDestination: '',
        companyName: '',
        location: '',
        contactName: '',
        contactEmail: '',
        contactPhone: '',
        pickupDate: '',
        transportation: '',
        qualityControlInfo: '',
      },
      RETAILER_LIST: [
        {
          name: 'Bach hoa xanh',
          address: '0x6D40F326bB56599c66E525158Bab93c3f7cB750e',
        },
        {
          name: 'Coop Mart',
          address: '0xd72B4Ba88DC8ee4BAabF1242C1FDFCf9b3DA9C5a',
        },
      ],
    }
  },
  mounted() {
    this.loadContract = loadContract()

    if (!this.$store.state.contractMethods) {
      this.$store.commit('addContractMethods', this.loadContract.methods)
    }
  },
  methods: {
    async submitForm() {
      console.log(this.formData)

      try {
        await this.loadContract.methods
          .createNewVieggiesBlock(
            this.formData.nextDestination,
            JSON.stringify(this.formData),
            'Factory'
          )
          .send({ from: this.$store.state.accountAddress, gas: 3000000 })
      } catch (error) {
        console.log(error)
      }

      try {
        const transactionData = await this.loadContract.methods
          .getVeggieBlocksWithStage('Factory')
          .call()

        console.log('transactionData: ', transactionData)
      } catch (error) {
        console.log(error)
      }

      this.resetForm()

      console.log('Send data successfully')
    },
    resetForm() {
      this.formData.nextDestination = ''
      this.formData.companyName = ''
      this.formData.location = ''
      this.formData.contactName = ''
      this.formData.contactEmail = ''
      this.formData.contactPhone = ''
      this.formData.pickupDate = ''
      this.formData.transportation = ''
      this.formData.qualityControlInfo = ''
    },
  },
}
</script>

<style lang="scss" scoped>
.distributor-page {
  min-height: calc(100vh - 72px - 80px);
  display: flex;
  flex-direction: column;
  align-items: center;

  .title {
    font-size: 24px;
    margin-top: 24px;
    margin-bottom: 20px;
    color: #333;
    text-align: center;
  }

  .el-form {
    margin-top: 20px;
    width: 50vw;

    .el-form-item {
      margin-bottom: unset;
    }

    .el-form-item__label {
      font-weight: bold;
      color: #333;
    }

    .el-form-item__content {
      display: flex;
      flex-direction: column;

      .el-input {
        margin-bottom: 12px;
      }

      .el-date-editor {
        width: 100%;
        margin-bottom: 12px;
      }
    }

    .el-button {
      margin-top: 20px;
      margin-right: 16px;
    }
  }

  .card-container {
    margin-top: 48px;
    margin-bottom: 48px;
  }
}
</style>
