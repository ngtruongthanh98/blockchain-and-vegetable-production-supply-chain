<template>
  <div class="stage-container">
    <div class="title">Retailer</div>

    <div class="item">
      <div class="item-title">Store name:</div>
      <div class="item-content">XYZ Market</div>
    </div>

    <div class="item">
      <div class="item-title">Location:</div>
      <div class="item-content">City, State</div>
    </div>

    <div class="item">
      <div class="item-title">Contact information:</div>
      <div class="item-content">Name, Email, Phone</div>
    </div>

    <div class="item">
      <div class="item-title">Date of receipt:</div>
      <div class="item-content">MM/DD/YYYY</div>
    </div>

    <div class="item">
      <div class="item-title">Storage conditions:</div>
      <div class="item-content">Temperature, humidity, etc.</div>
    </div>

    <div class="item">
      <div class="item-title">Sale price:</div>
      <div class="item-content">$XX.XX</div>
    </div>

    <div class="item">
      <div class="item-title">Promotions or discounts:</div>
      <div class="item-content">Promo codes, sales, discounts, etc.</div>
    </div>
  </div>
</template>

<script>
export default {}
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
