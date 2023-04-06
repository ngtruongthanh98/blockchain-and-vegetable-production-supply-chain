<template>
  <div class="stage-container">
    <div class="title">Customer</div>

    <div class="item">
      <div class="item-title">Purchase date:</div>
      <div class="item-content">2023-04-05</div>
    </div>

    <div class="item">
      <div class="item-title">Store location:</div>
      <div class="item-content">123 Main St.</div>
    </div>

    <div class="item">
      <div class="item-title">Vegetable type:</div>
      <div class="item-content">Tomato</div>
    </div>

    <div class="item">
      <div class="item-title">Price:</div>
      <div class="item-content">$2.99</div>
    </div>

    <div class="item">
      <div class="item-title">Feedback/review:</div>
      <div class="item-content">This tomato was delicious!</div>
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
