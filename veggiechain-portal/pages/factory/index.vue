<template>
  <div class="factory-page">
    <el-card class="card-container">
      <div class="title">Factory Information</div>

      <el-form
        ref="form"
        :model="formData"
        class="form"
        style="max-width: 600px"
      >
        <el-form-item label="Next Destination (Distributor)">
          <el-radio-group v-model="formData.nextDestination">
            <el-radio
              v-for="(distributor, index) in DISTRIBUTOR_LIST"
              :key="index"
              :label="distributor.address"
            />
          </el-radio-group>
        </el-form-item>
        <el-form-item label="Processing Facility Name">
          <el-input v-model="formData.facilityName"></el-input>
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
        <el-form-item label="Processing Date">
          <el-date-picker
            v-model="formData.processingDate"
            type="date"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="Type of Processing">
          <el-radio-group v-model="formData.processingType">
            <el-radio label="Canning"></el-radio>
            <el-radio label="Freezing"></el-radio>
            <el-radio label="Drying"></el-radio>
          </el-radio-group>
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
        facilityName: '',
        location: '',
        contactName: '',
        contactEmail: '',
        contactPhone: '',
        processingDate: '',
        processingType: '',
        qualityControlInfo: '',
      },
      DISTRIBUTOR_LIST: [
        {
          name: 'Giao hang nhanh',
          address: '0x09E94710a44464f53DF76ebD4C2399dF3715F7B4',
        },
        {
          name: 'Vietel Post',
          address: '0x0203d29Ae59EC6c13785d8E4655b07e8731438D3',
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
      this.formData.facilityName = ''
      this.formData.location = ''
      this.formData.contactName = ''
      this.formData.contactEmail = ''
      this.formData.contactPhone = ''
      this.formData.processingDate = ''
      this.formData.processingType = ''
      this.formData.qualityControlInfo = ''
    },
  },
}
</script>
<style lang="scss" scoped>
.factory-page {
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