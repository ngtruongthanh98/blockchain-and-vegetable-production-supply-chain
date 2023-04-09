<template>
  <div class="product-cycle-page">
    <div class="row-container">
      <GeneralInfo
        class="general-info-box"
        :productName="productName"
        :productId="productId"
        :productImageUrl="productImageUrl"
      />

      <div class="product-cycle-container">
        <Stage1 v-show="step === 1" />
        <Stage2 v-if="step === 2" />
        <Stage3 v-if="step === 3" />
        <Stage4 v-if="step === 4" />
        <Stage5 v-if="step === 5" />
      </div>
    </div>

    <ChainingBlock @blockChanged="handleBlockChanged" />
  </div>
</template>

<script>
import GeneralInfo from './general-info'
import Stage1 from './stage_1_farm'
import Stage2 from './stage_2_distributor'
import Stage3 from './stage_3_factory'
import Stage4 from './stage_4_retailer'
import Stage5 from './stage_5_costumer'
import ChainingBlock from './chaining-blocks'

export default {
  components: {
    GeneralInfo,
    Stage1,
    Stage2,
    Stage3,
    Stage4,
    Stage5,
    ChainingBlock,
  },
  data() {
    return {
      productId: '',
      productName: 'Carrot',
      productImageUrl:
        'https://media.phunutoday.vn/files/mai.doan/2019/01/31/ca-rot-1035.jpg',
      step: 1,
    }
  },

  mounted() {
    this.productId = this.$route.params.id
  },
  methods: {
    handleBlockChanged(newBlock) {
      console.log('Block changed:', newBlock)
      // Do something with the new block value
      this.step = newBlock
    },
  },
}
</script>

<style lang="scss" scoped>
.product-cycle-page {
  min-height: calc(100vh - 72px - 80px);

  .row-container {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
  }

  .general-info-box {
    margin-top: 24px;
    margin-left: 48px;
    margin-right: 48px;
  }

  .product-cycle-container {
    margin-top: 24px;
    display: flex;
    flex-direction: column;
    align-items: center;

    .stage-container {
      margin-left: 48px;
      margin-right: 48px;
    }
  }
}
</style>