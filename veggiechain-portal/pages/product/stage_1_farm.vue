<template>
  <div class="stage-container">
    <div class="title">Farm</div>

    <div class="item">
      <div class="item-title">Farm name:</div>
      <div class="item-content">abab</div>
    </div>

    <div class="item">
      <div class="item-title">Location:</div>
      <div class="item-content">City, State</div>
    </div>

    <div class="item">
      <div class="item-title">Farmer/Owner information:</div>
      <div class="item-content">Name, Email, Phone</div>
    </div>

    <div class="item">
      <div class="item-title">Vegetable type(s):</div>
      <div class="item-content">Tomatoes, Lettuce, Carrots</div>
    </div>

    <div class="item">
      <div class="item-title">Planting and harvest dates:</div>
      <div class="item-content">June 1st to August 30th</div>
    </div>

    <div class="item">
      <div class="item-title">Farming practices:</div>
      <div class="item-content">Organic</div>
    </div>

    <div class="item">
      <div class="item-title">Pesticide and herbicide use:</div>
      <div class="item-content">None</div>
    </div>

    <div class="item">
      <div class="item-title">Certification status:</div>
      <div class="item-content">Certified Organic</div>
    </div>
  </div>
</template>

<script>
export default {
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
