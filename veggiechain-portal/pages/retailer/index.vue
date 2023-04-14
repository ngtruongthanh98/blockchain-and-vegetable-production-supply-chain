<template>
  <div class="retailer-page">
    <el-card class="card-container">
      <div class="title">Retailer Information</div>

      <el-form
        ref="form"
        :model="formData"
        class="form"
        style="max-width: 600px"
      >
        <el-form-item label="Store Name">
          <el-input v-model="formData.storeName"></el-input>
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
        <el-form-item label="Date of Receipt">
          <el-date-picker
            v-model="formData.receiptDate"
            type="date"
            placeholder="Receipt Date"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="Storage Conditions">
          <el-input v-model="formData.storageConditions"></el-input>
        </el-form-item>
        <el-form-item label="Sale Price">
          <el-input v-model="formData.salePrice"></el-input>
        </el-form-item>
        <el-form-item label="Promotions or Discounts">
          <el-input v-model="formData.promotions"></el-input>
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
        nextDestination: null,
        storeName: '',
        location: '',
        contactName: '',
        contactEmail: '',
        contactPhone: '',
        receiptDate: '',
        storageConditions: '',
        salePrice: '',
        promotions: '',
      },
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
            this.$store.state.accountAddress,
            JSON.stringify(this.formData),
            'Retailer'
          )
          .send({ from: this.$store.state.accountAddress, gas: 3000000 })
      } catch (error) {
        console.log(error)
      }

      try {
        const transactionData = await this.loadContract.methods
          .getVeggieBlocksWithStage('Retailer')
          .call()

        console.log('transactionData: ', transactionData)
      } catch (error) {
        console.log(error)
      }

      this.resetForm()

      console.log('Send data successfully')
    },
    resetForm() {
      this.formData.nextDestination = null
      this.formData.farmName = ''
      this.formData.location = ''
      this.formData.farmerOwnerInfo = ''
      this.formData.vegetableType = ''
      this.formData.plantingDate = ''
      this.formData.harvestDate = ''
      this.formData.pesticideUse = ''
      this.formData.herbicideUse = ''
      this.formData.certificationStatus = ''
    },
  },
}
</script>

<style lang="scss" scoped>
.retailer-page {
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
