<template>
  <div class="product-cycle-page">
    <b>Product Cycle {{ productId }}</b>

    <GeneralInfo />
  </div>
</template>

<script>
import GeneralInfo from './general-info.vue'
export default {
  components: {
    GeneralInfo,
  },
  data() {
    return {
      productId: '',
    }
  },

  mounted() {
    this.productId = this.$route.params.id
  },
}
</script>

<style lang="scss" scoped>
.product-cycle-page {
  min-height: calc(100vh - 72px - 80px);
}
</style>