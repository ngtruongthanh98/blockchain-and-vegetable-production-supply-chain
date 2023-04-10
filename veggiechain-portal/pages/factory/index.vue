<template>
  <div class="factory-page">
    <div class="title">Factory Information</div>
    <el-form
      ref="form"
      :model="formData"
      label-width="150px"
      class="form"
      style="max-width: 600px"
    >
      <el-form-item label="Previous hash">
        <el-input v-model="formData.previousHash"></el-input>
      </el-form-item>
      <el-form-item label="Processing Facility Name">
        <el-input v-model="formData.facilityName"></el-input>
      </el-form-item>
      <el-form-item label="Location">
        <el-input v-model="formData.location"></el-input>
      </el-form-item>
      <el-form-item label="Contact Information">
        <el-input v-model="formData.contactName" placeholder="Name"></el-input>
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
  </div>
</template>
<script>
export default {
  data() {
    return {
      formData: {
        previousHash: '',
        facilityName: '',
        location: '',
        contactName: '',
        contactEmail: '',
        contactPhone: '',
        processingDate: '',
        processingType: '',
        qualityControlInfo: '',
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
}
</style>