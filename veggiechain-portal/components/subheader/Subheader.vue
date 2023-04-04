<template>
  <div class="subheader-wrapper m-4 p-4 text-center">
    <img
      src="@/static/images/vegetables.jpeg"
      alt="vegetables image"
      width="700px"
      class="vegetables-image"
    />
  </div>
</template>

<script>
import EcgViewer from '../EcgViewer'

export default {
  name: 'VmSubheader',

  components: {
    EcgViewer,
  },
}
</script>

<style lang="scss" scoped>
.subheader-wrapper {
  min-height: calc(
    100vh - $header-height - $hero-height - $header-height - $element-32
  );

  display: flex;
  align-items: center;
  justify-content: center;
}
</style>
