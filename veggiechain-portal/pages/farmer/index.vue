<template>
  <div class="farmer-page">
    <el-card class="card-container">
      <div class="title">Farmer Information</div>

      <el-form
        ref="form"
        :model="formData"
        class="form"
        style="max-width: 600px"
      >
        <el-form-item label="Next Destination (Factory)">
          <el-radio-group v-model="formData.nextDestination">
            <el-radio
              v-for="(factory, index) in transformArray(
                factories,
                this.$store.state.originAddressList
              )"
              :key="index"
              :label="factory"
            />
          </el-radio-group>
        </el-form-item>
        <el-form-item label="Farm Name">
          <el-input v-model="formData.farmName"></el-input>
        </el-form-item>
        <el-form-item label="Location">
          <el-input v-model="formData.location"></el-input>
        </el-form-item>
        <el-form-item label="Farmer/Owner Information">
          <el-input v-model="formData.farmerOwnerInfo"></el-input>
        </el-form-item>
        <el-form-item label="Vegetable Type">
          <el-input v-model="formData.vegetableType"></el-input>
        </el-form-item>
        <el-form-item label="Planting and Harvest Dates">
          <el-date-picker
            v-model="formData.plantingDate"
            type="date"
            placeholder="Planting Date"
          ></el-date-picker>
          <el-date-picker
            v-model="formData.harvestDate"
            type="date"
            placeholder="Harvest Date"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="Pesticide Use">
          <el-radio-group v-model="formData.pesticideUse">
            <el-radio label="Yes"></el-radio>
            <el-radio label="No"></el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="Herbicide Use">
          <el-radio-group v-model="formData.herbicideUse">
            <el-radio label="Yes"></el-radio>
            <el-radio label="No"></el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="Certification Status">
          <el-radio-group v-model="formData.certificationStatus">
            <el-radio label="Certified Organic"></el-radio>
            <el-radio label="Conventional"></el-radio>
            <el-radio label="Transitional"></el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="Vegetable Image">
          <el-input v-model="formData.vegetableImage"></el-input>
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
import { findFactories, transformArray } from '@/utils'

export default {
  data() {
    return {
      loadContract: {},
      formData: {
        nextDestination: '',
        farmName: '',
        location: '',
        farmerOwnerInfo: '',
        vegetableType: '',
        plantingDate: '',
        harvestDate: '',
        pesticideUse: '',
        herbicideUse: '',
        certificationStatus: '',
        vegetableImage: '',
      },
      farmerAddress: '0x70f8Dc728c9ed0DC1aF05Cc591b2A2c61709595f',
      factories: [],
    }
  },
  mounted() {
    this.loadContract = loadContract()

    if (!this.$store.state.contractMethods) {
      this.$store.commit('addContractMethods', this.loadContract.methods)
    }

    this.factories = findFactories(
      this.$store.state.accountMappingRole,
      this.$store.state.accountAddress
    )
  },
  methods: {
    transformArray,
    async submitForm() {
      console.log('this.formData: ', this.formData)

      try {
        await this.loadContract.methods
          .createNewVieggiesBlock(
            this.formData.nextDestination,
            JSON.stringify(this.formData),
            'Farmer'
          )
          .send({ from: this.$store.state.accountAddress, gas: 3000000 })
      } catch (error) {
        console.log(error)
      }

      try {
        const transactionData = await this.loadContract.methods
          .getVeggieBlocksWithStage('Farmer')
          .call()

        console.log('transactionData: ', transactionData)
      } catch (error) {
        console.log(error)
      }

      this.resetForm()

      console.log('Send data successfully')
    },
    resetForm() {
      this.nextDestination = ''
      this.formData.farmName = ''
      this.formData.location = ''
      this.formData.farmerOwnerInfo = ''
      this.formData.vegetableType = ''
      this.formData.plantingDate = ''
      this.formData.harvestDate = ''
      this.formData.pesticideUse = ''
      this.formData.herbicideUse = ''
      this.formData.certificationStatus = ''
      this.formData.vegetableImage = ''
    },
  },
}
</script>

<style lang="scss" scoped>
.farmer-page {
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
