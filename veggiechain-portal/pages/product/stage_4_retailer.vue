<template>
  <div class="stage-container">
    <div class="title">Retailer</div>

    <div class="item">
      <div class="item-title">Store name:</div>
      <div class="item-content">{{ stageDetail.storeName }}</div>
    </div>

    <div class="item">
      <div class="item-title">Location:</div>
      <div class="item-content">{{ stageDetail.storeName }}</div>
    </div>

    <div class="item">
      <div class="item-title">Contact information:</div>
      <div class="item-content">Name: {{ stageDetail.contactName }} <br> Email: {{ stageDetail.contactEmail }} <br> Phone {{ stageDetail.contactPhone }}</div>
    </div>

    <div class="item">
      <div class="item-title">Date of receipt:</div>
      <div class="item-content">{{ stageDetail.receiptDate }}</div>
    </div>

    <div class="item">
      <div class="item-title">Storage conditions:</div>
      <div class="item-content">{{ stageDetail.storageConditions }}</div>
    </div>

    <div class="item">
      <div class="item-title">Sale price:</div>
      <div class="item-content">{{ stageDetail.salePrice }}</div>
    </div>

    <div class="item">
      <div class="item-title">Promotions or discounts:</div>
      <div class="item-content">{{ stageDetail.promotions }}</div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      stageDetail: {}
    }    
  },

  props: {
    productId: {
      type: String,
      default: '',
    },
  },

  mounted() {
    this.loadStageInfo()
  },

  methods: {
    async loadStageInfo() {
      console.log('productId: ', this.productId)

      const stageInfo = await this.$store.state.contractMethods
        .getVeggieByConsignmentAndStage(this.productId, 'Retailer')
        .call()

      let stageJSON = JSON.parse(stageInfo.comment)
      console.log('stageDetail: ', stageJSON)
      this.stageDetail = {
        storeName: stageJSON.storeName,
        location: stageJSON.location,
        contactName: stageJSON.contactName,
        contactEmail: stageJSON.contactEmail,
        contactPhone: stageJSON.contactPhone,
        receiptDate: stageJSON.receiptDate,
        storageConditions: stageJSON.storageConditions,
        salePrice: stageJSON.salePrice,
        promotions: stageJSON.promotions
      }
    }
  },
}
</script>

<style lang="scss" scoped>
.stage-container {
  width: 700px;

  .title {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
  }

  .item {
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
}
</style>
