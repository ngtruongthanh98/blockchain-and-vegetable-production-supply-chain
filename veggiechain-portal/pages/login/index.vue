<template>
  <div class="login-page">
    <b>Login</b>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isUserLogged: this.$store.state.userInfo.isLoggedIn,
    }
  },
}
</script>

<style lang="scss" scoped>
.login-page {
  min-height: calc(100vh - 72px - 80px);
}
</style>