<template>
  <div class="information-blocks">
    <div
      class="block block-1"
      :class="{ active: currentBlock === 1 }"
      :style="
        isHasCustomer
          ? 'width: calc(100% / 5 - 16px)'
          : 'width: calc(100% / 4 - 16px)'
      "
    >
      <div class="block-title">Farm</div>
      <div class="block-content">
        <button @click="changeBlock(1)">View</button>
      </div>
    </div>

    <div
      class="block block-2"
      :class="{ active: currentBlock === 2 }"
      :style="
        isHasCustomer
          ? 'width: calc(100% / 5 - 16px)'
          : 'width: calc(100% / 4 - 16px)'
      "
    >
      <div class="block-title">Factory</div>
      <div class="block-content">
        <button @click="changeBlock(2)">View</button>
      </div>
    </div>

    <div
      class="block block-3"
      :class="{ active: currentBlock === 3 }"
      :style="
        isHasCustomer
          ? 'width: calc(100% / 5 - 16px)'
          : 'width: calc(100% / 4 - 16px)'
      "
    >
      <div class="block-title">Distributor</div>
      <div class="block-content">
        <button @click="changeBlock(3)">View</button>
      </div>
    </div>

    <div
      class="block block-4"
      :class="{ active: currentBlock === 4 }"
      :style="
        isHasCustomer
          ? 'width: calc(100% / 5 - 16px)'
          : 'width: calc(100% / 4 - 16px)'
      "
    >
      <div class="block-title">Retailer</div>
      <div class="block-content">
        <button @click="changeBlock(4)">View</button>
      </div>
    </div>

    <div
      v-if="isHasCustomer"
      class="block block-5"
      :class="{ active: currentBlock === 5 }"
      :style="
        isHasCustomer
          ? 'width: calc(100% / 5 - 16px)'
          : 'width: calc(100% / 4 - 16px)'
      "
    >
      <div class="block-title">Customer</div>
      <div class="block-content">
        <p>Customer name</p>
        <button @click="changeBlock(5)">View</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      currentBlock: 1,
    }
  },
  props: {
    isHasCustomer: {
      type: Boolean,
      default: true,
    },
  },
  methods: {
    changeBlock(newBlock) {
      this.currentBlock = newBlock
      this.$emit('blockChanged', newBlock)
    },
  },
}
</script>

<style lang="scss" scoped>
.information-blocks {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  margin-top: 36px;

  padding-bottom: 36px;
  padding-right: 32px;
  padding-left: 32px;
}

.block {
  padding: 10px;
  width: calc(100% / 4 - 16px);
  transition: opacity 0.2s ease-in-out;
  border: 1px dashed black;

  & + .block {
    margin-left: 1px;
    margin-top: 1px;
  }

  &-title {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 8px;
    color: #4b4b4b;
  }

  &-content {
    margin-bottom: 16px;
    padding: 16px;

    p {
      margin-bottom: 8px;
      color: #666666;
    }

    button {
      margin-right: 8px;
      background-color: #e63946;
      color: #ffffff;
      border: none;
      border-radius: 4px;
      padding: 8px 16px;
      font-size: 14px;
      font-weight: bold;
      cursor: pointer;
      transition: background-color 0.2s ease-in-out;

      &:hover {
        background-color: #bf1650;
      }
    }
  }

  &.active {
    opacity: 1;
  }

  &.inactive {
    opacity: 0;
  }
}

.block-1 {
  order: 1;

  &.active {
    background-color: $primary-third;
  }

  .block-title {
    color: #e63946;
  }
}

.block-2 {
  order: 2;

  &.active {
    background-color: $primary-third;
  }

  .block-title {
    color: #fca311;
  }

  button {
    background-color: #fca311;
    color: #ffffff;

    &:hover {
      background-color: #fb923c;
    }
  }
}

.block-3 {
  order: 3;

  &.active {
    background-color: $primary-third;
  }

  .block-title {
    color: #2a9d8f;
  }

  button {
    background-color: #2a9d8f;
    color: #ffffff;

    &:hover {
      background-color: #21867a;
    }
  }
}

.block-4 {
  order: 4;

  &.active {
    background-color: $primary-third;
  }

  .block-title {
    color: #023047;
  }

  button {
    background-color: #023047;
    color: #ffffff;

    &:hover {
      background-color: #001d2e;
    }
  }
}

.block-5 {
  order: 5;

  &.active {
    background-color: $primary-third;
  }

  .block-title {
    color: #7209b7;
  }

  button {
    background-color: #7209b7;
    color: #ffffff;

    &:hover {
      background-color: #560bad;
    }
  }
}
</style>
