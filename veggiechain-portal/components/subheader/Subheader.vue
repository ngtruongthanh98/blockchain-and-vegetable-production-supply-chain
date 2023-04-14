<template>
  <div class="subheader-wrapper text-center"></div>
</template>

<script>
export default {
  name: 'VmSubheader',
}
</script>

<style lang="scss" scoped>
.subheader-wrapper {
  height: calc(100vh - $header-height - $hero-height - $header-height);
  background-image: url('@/static/images/vegetables.jpeg');
  background-size: cover; // Scale the image to cover the entire element
  background-position: center; // Center the image within the element
}
</style>
