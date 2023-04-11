<template>
  <div class="customer-page">
    <el-card class="card-container">
      <div class="title">Customer Information</div>

      <el-form
        ref="form"
        :model="formData"
        class="form"
        style="max-width: 600px"
      >
        <el-form-item label="Previous block hash">
          <el-input v-model="formData.previousHash"></el-input>
        </el-form-item>
        <el-form-item label="Purchase Date">
          <el-date-picker
            v-model="formData.purchaseDate"
            type="date"
            placeholder="Purchase Date"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="Store Location">
          <el-input v-model="formData.storeLocation"></el-input>
        </el-form-item>
        <el-form-item label="Vegetable Type">
          <el-select v-model="formData.vegetableType">
            <el-option label="Tomatoes" value="Tomatoes"></el-option>
            <el-option label="Peppers" value="Peppers"></el-option>
            <el-option label="Cucumbers" value="Cucumbers"></el-option>
            <el-option label="Eggplants" value="Eggplants"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="Price">
          <el-input v-model="formData.price"></el-input>
        </el-form-item>
        <el-form-item label="Feedback/Review">
          <el-input type="textarea" v-model="formData.feedback"></el-input>
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
export default {
  data() {
    return {
      formData: {
        previousHash: '',
        purchaseDate: '',
        storeLocation: '',
        vegetableType: '',
        price: '',
        feedback: '',
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
.customer-page {
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
