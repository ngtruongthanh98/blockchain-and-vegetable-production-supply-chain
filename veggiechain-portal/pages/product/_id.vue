<template>
  <div class="product-cycle-page">
    <div class="title-row">
      <div class="title">Product cycle</div>
      <nuxt-link
        :to="{
          name: 'products',
        }"
        class="back-button"
      >
        See all products
      </nuxt-link>
    </div>

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

    <ChainingBlock
      @blockChanged="handleBlockChanged"
      :isHasCustomer="isHasCustomer"
    />
  </div>
</template>

<script>
import GeneralInfo from './general-info'
import Stage1 from './stage_1_farm'
import Stage2 from './stage_2_factory'
import Stage3 from './stage_3_distributor'
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
      isHasCustomer: false,
    }
  },

  mounted() {
    this.productId = this.$route.params.id
    this.productImageUrl = this.$route.params.imageUrl
    this.productName = this.$route.params.productName
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

  .title-row {
    .title {
      font-size: 24px;
      margin-top: 24px;
      margin-bottom: 20px;
      color: #333;
      text-align: center;
    }
    .back-button {
      background-color: #333;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      width: fit-content;
      height: 48px;

      display: flex;
      justify-content: center;
      align-items: center;
      padding: 16px;

      margin: 16px;

      &:hover {
        background-color: #555;
      }

      .icon-back {
        background: url('../../static/svg/left-arrow.svg') no-repeat;
        background-position: 50% 50%;
        background-size: 36px;

        width: 60px;
        height: 60px;
        background-color: red;
        border-radius: 50%;
        margin-right: 5px;
      }
    }
  }

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