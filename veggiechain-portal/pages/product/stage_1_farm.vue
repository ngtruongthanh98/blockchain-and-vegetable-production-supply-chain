<template>
  <div class="stage-container">
    <div class="title">Farm</div>

    <div class="item">
      <div class="item-title">Farm name:</div>
      <div class="item-content">{{ stageDetail.farmName }}</div>
    </div>

    <div class="item">
      <div class="item-title">Location:</div>
      <div class="item-content">{{ stageDetail.location }}</div>
    </div>

    <div class="item">
      <div class="item-title">Farmer/Owner information:</div>
      <div class="item-content">{{ stageDetail.farmerOwnerInfo }}</div>
    </div>

    <div class="item">
      <div class="item-title">Vegetable type(s):</div>
      <div class="item-content">{{ stageDetail.vegetableType }}</div>
    </div>

    <div class="item">
      <div class="item-title">Planting and harvest dates:</div>
      <div class="item-content">Planting: {{ stageDetail.plantingDate }} Harvest: {{ stageDetail.harvestDate }}</div>
    </div>

    <div class="item">
      <div class="item-title">Pesticide and herbicide use:</div>
      <div class="item-content">Pesticide: {{ stageDetail.pesticideUse }} Herbicide: {{ stageDetail.herbicideUse }}</div>
    </div>

    <div class="item">
      <div class="item-title">Certification status:</div>
      <div class="item-content">{{ stageDetail.certificationStatus }}</div>
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
        .getVeggieByConsignmentAndStage(this.productId, 'Farmer')
        .call()

      let stageJSON = JSON.parse(stageInfo.comment)
      console.log('stageDetail: ', stageJSON)
      this.stageDetail = {
        farmName: stageJSON.farmName,
        location: stageJSON.location,
        farmerOwnerInfo: stageJSON.farmerOwnerInfo,
        vegetableType: stageJSON.vegetableType,
        pesticideUse: stageJSON.pesticideUse,
        herbicideUse: stageJSON.herbicideUse,
        plantingDate: stageJSON.plantingDate,
        harvestDate: stageJSON.harvestDate,
        certificationStatus: stageJSON.certificationStatus
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
