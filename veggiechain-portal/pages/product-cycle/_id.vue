<template>
  <div class="product-cycle-page">
    <GeneralInfo
      class="general-info-box"
      :productName="productName"
      :productId="productId"
      :productImageUrl="productImageUrl"
    />

    <div class="product-cycle-container">
      <Stage1 />
      <Stage2 />
      <Stage3 />
      <Stage4 />
      <Stage5 />
    </div>
  </div>
</template>

<script>
import GeneralInfo from './general-info'
import Stage1 from './stage_1_farm'
import Stage2 from './stage_2_distributor'
import Stage3 from './stage_3_factory'
import Stage4 from './stage_4_retailer'
import Stage5 from './stage_5_costumer'

export default {
  components: {
    GeneralInfo,
    Stage1,
    Stage2,
    Stage3,
    Stage4,
    Stage5,
  },
  data() {
    return {
      productId: '',
      productName: 'Carrot',
      productImageUrl:
        'https://media.phunutoday.vn/files/mai.doan/2019/01/31/ca-rot-1035.jpg',
    }
  },

  mounted() {
    this.productId = this.$route.params.id
  },
}
</script>

<style lang="scss" scoped>
.product-cycle-page {
  min-height: calc(100vh - 72px - 24px - 80px);

  .general-info-box {
    margin-top: 24px;
  }

  .product-cycle-container {
    margin-top: 24px;

    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;

    .stage-container {
      padding: 16px;
    }
  }
}
</style>