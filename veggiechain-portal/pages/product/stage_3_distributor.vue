<template>
  <div class="stage-container">
    <div class="title">Distributor</div>

    <div class="item">
      <div class="item-title">Company name:</div>
      <div class="item-content">{{ stageDetail.companyName }}</div>
    </div>

    <div class="item">
      <div class="item-title">Location:</div>
      <div class="item-content">{{ stageDetail.location }}</div>
    </div>

    <div class="item">
      <div class="item-title">Contact information:</div>
      <div class="item-content">Name: {{ stageDetail.contactName }} <br> Email: {{ stageDetail.contactEmail }} <br> Phone {{ stageDetail.contactPhone }}</div>
    </div>

    <div class="item">
      <div class="item-title">Date of pickup from farm:</div>
      <div class="item-content">{{ stageDetail.pickupDate }}</div>
    </div>

    <div class="item">
      <div class="item-title">Transportation information:</div>
      <div class="item-content">{{ stageDetail.transportation }}</div>
    </div>

    <div class="item">
      <div class="item-title">Inspection and quality control information:</div>
      <div class="item-content">
        {{ stageDetail.qualityControlInfo }}
      </div>
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
        .getVeggieByConsignmentAndStage(this.productId, 'Distributor')
        .call()

      let stageJSON = JSON.parse(stageInfo.comment)
      console.log('stageDetail: ', stageJSON)
      this.stageDetail = {
        companyName: stageJSON.companyName,
        location: stageJSON.location,
        contactName: stageJSON.contactName,
        contactEmail: stageJSON.contactEmail,
        contactPhone: stageJSON.contactPhone,
        pickupDate: stageJSON.pickupDate,
        transportation: stageJSON.transportation,
        qualityControlInfo: stageJSON.qualityControlInfo
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
