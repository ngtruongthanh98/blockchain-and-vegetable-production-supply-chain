<template>
  <div class="retailer-page">
    <div class="title">Retailer Information</div>

    <el-form
      ref="form"
      :model="formData"
      label-width="120px"
      class="form"
      style="max-width: 600px"
    >
      <el-form-item label="Previous hash">
        <el-input v-model="formData.previousHash"></el-input>
      </el-form-item>
      <el-form-item label="Store Name">
        <el-input v-model="formData.storeName"></el-input>
      </el-form-item>
      <el-form-item label="Location">
        <el-input v-model="formData.location"></el-input>
      </el-form-item>
      <el-form-item label="Contact Name">
        <el-input v-model="formData.contactName"></el-input>
      </el-form-item>
      <el-form-item label="Contact Email">
        <el-input v-model="formData.contactEmail"></el-input>
      </el-form-item>
      <el-form-item label="Contact Phone">
        <el-input v-model="formData.contactPhone"></el-input>
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
  </div>
</template>

<script>
export default {
  data() {
    return {
      formData: {
        previousHash: '',
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
  methods: {
    submitForm() {
      console.log(this.formData)
      // submit data to server or store in local storage
    },
    resetForm() {
      this.$refs.form.resetFields()
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

  .form {
    margin-top: 20px;
    width: 50vw;
  }
}
</style>
