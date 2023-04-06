<template>
  <div class="general-info">
    <div class="item">
      <div class="item-title">Product name:</div>
      <span class="item-content">{{ productName }}</span>
    </div>

    <div class="item">
      <div class="item-title">Id:</div>
      <span class="item-content">{{ productId }}</span>
    </div>

    <el-card class="image-card">
      <img :src="productImageUrl" alt="Product image" width="400px" />
    </el-card>
  </div>
</template>

<script>
export default {
  data() {
    return {}
  },
  props: {
    productName: {
      type: String,
      default: '',
    },
    productId: {
      type: String,
      default: '',
    },
    productImageUrl: {
      type: String,
      default: '',
    },
  },
}
</script>

<style lang="scss" scoped>
.general-info {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;

  .item {
    width: 500px;
    display: grid;
    grid-template-columns: 1fr 2fr;
    gap: 10px;
    align-items: center;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    background-color: #fff;
  }

  .item-title {
    font-weight: bold;
    text-transform: uppercase;
  }

  .item-content {
    font-size: 16px;
  }

  .image-card {
    margin-top: 24px;
  }
}
</style>