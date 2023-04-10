<template>
  <div class="products-page">
    <div class="title">Vegetable Products</div>
    <div
      class="product-item"
      v-for="product in sortedProducts"
      :key="product.id"
    >
      <div
        class="product-container flex items-center"
        exact-active-class="is-active"
      >
        <div
          class="product-image"
          :style="{ backgroundImage: `url(${product.image})` }"
        ></div>
        <div class="product-info">
          <h2>{{ product.name }}</h2>
          <p>{{ product.description }}</p>
        </div>
        <nuxt-link
          :to="{
            name: 'product-id',
            params: {
              id: product.id,
              imageUrl: product.image,
              productName: product.name,
            },
          }"
          class="view-btn"
          >View transactions</nuxt-link
        >
      </div>
    </div>

    <button
      v-show="showScrollButton"
      @click="scrollToTop"
      class="scroll-to-top"
    >
      Scroll to Top
    </button>
  </div>
</template>
<script>
export default {
  data() {
    return {
      showScrollButton: false,

      products: [
        {
          id: 'carrot7162gshqks',
          name: 'Carrot',
          description: 'Fresh organic carrots',
          image:
            'https://cf.organicbazar.net/wp-content/uploads/2021/06/Untitled-design-44.jpg',
        },
        {
          id: 'tomato2378ghdks',
          name: 'Tomato',
          description: 'Juicy vine-ripe tomatoes',
          image:
            'https://www.heddensofwoodtown.co.uk/wp-content/uploads/2020/05/tomatoes_opt.jpg',
        },
        {
          id: 'lettuce8271sjhdkf',
          name: 'Lettuce',
          description: 'Crisp and refreshing lettuce',
          image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgkwHEcR0iFsZCBJ7WD98RzD6qjzEm9BHCqEo-lB60hYXskBsO0HDd1sCGyhtA9wBFOSs&usqp=CAU',
        },
        {
          id: 'cucumber3196fjksd',
          name: 'Cucumber',
          description: 'Crunchy and refreshing cucumbers',
          image:
            'https://cdn.shopify.com/s/files/1/0273/5551/2875/products/cucumber-seeds-malaysia-t103m_1024x.jpg?v=1591175147',
        },
        {
          id: 'broccoli2109dksld',
          name: 'Broccoli',
          description: 'Nutritious and delicious broccoli florets',
          image:
            'https://images.cookforyourlife.org/wp-content/uploads/2018/08/shutterstock_294838064-min.jpg',
        },
        {
          id: 'spinach4823fksld',
          name: 'Spinach',
          description: 'Fresh and healthy spinach leaves',
          image:
            'data:image/jpeg;base64,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',
        },
        {
          id: 'zucchini7693fjksl',
          name: 'Zucchini',
          description: 'Versatile and delicious zucchini',
          image:
            'https://a-z-animals.com/media/2022/08/fresh-whole-and-sliced-zucchini-isolated-on-white-background-from-top-picture-id1149201983.jpg',
        },
        {
          id: 'bellpepper8729dksl',
          name: 'Bell Pepper',
          description: 'Colorful and flavorful bell peppers',
          image:
            'https://www.gomarket.com.ng/wp-content/uploads/2020/05/bellp.jpg',
        },
        {
          id: 'cauliflower3168dkls',
          name: 'Cauliflower',
          description: 'Nutritious and versatile cauliflower',
          image:
            'https://naturallyvietnam.com/wp-content/uploads/2020/05/cauliflower.jpg',
        },
        {
          id: 'celery4817djksl',
          name: 'Celery',
          description: 'Crunchy and refreshing celery stalks',
          image:
            'https://images.delightedcooking.com/celery-against-white-background.jpg',
        },
        {
          id: 'corn7218fksl',
          name: 'Corn',
          description: 'Sweet and juicy corn on the cob',
          image:
            'https://extension.purdue.edu/foodlink/functions/getImage.php?id=36',
        },
        {
          id: 'greenbeans6184dksl',
          name: 'Green Beans',
          description: 'Tender and delicious green beans',
          image:
            'https://www.acouplecooks.com/wp-content/uploads/2022/05/How-to-blanch-green-beans-005.jpg',
        },
        {
          id: 'asparagus8624gjksd',
          name: 'Asparagus',
          description: 'Nutrient-rich and delicious asparagus',
          image:
            'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2020/06/10/0/FNK_ASPARAGUS_0_H_f_s4x3.jpg.rend.hgtvcom.616.462.suffix/1591798301676.jpeg',
        },
        {
          id: 'cabbage4157fjksd',
          name: 'Cabbage',
          description: 'Crunchy and flavorful cabbage',
          image:
            'https://i5.walmartimages.ca/images/Enlarge/272/109/6000191272109.jpg',
        },
        {
          id: 'eggplant5291djksd',
          name: 'Eggplant',
          description: 'Versatile and delicious eggplant',
          image: 'https://www.burpee.com/media/catalog/category/EGG-Cat1.jpg',
        },
        {
          id: 'garlic3208dksld',
          name: 'Garlic',
          description: 'Aromatic and flavorful garlic',
          image:
            'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/61ISKQLF1oL._SL1500_.jpg',
        },
        {
          id: 'kale7310fjsld',
          name: 'Kale',
          description: 'Healthy and nutrient-packed kale leaves',
          image:
            'https://cdn.shopify.com/s/files/1/0294/7527/4827/products/KaledesktopexcellentsnapKale_ficha-original3_grande.jpg?v=1595522450',
        },
        {
          id: 'mushroom8172djksd',
          name: 'Mushroom',
          description: 'Earthy and savory mushrooms',
          image:
            'https://images.immediate.co.uk/production/volatile/sites/30/2017/05/Chesnut-mushrooms-f2497d2.jpg',
        },
        {
          id: 'onion3168dksld',
          name: 'Onion',
          description: 'Versatile and flavorful onion',
          image:
            'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/51v2ozMXy8L._SX522_.jpg',
        },
        {
          id: 'peas4721fjksd',
          name: 'Peas',
          description: 'Sweet and tender peas',
          image:
            'https://www.almanac.com/sites/default/files/styles/or/public/image_nodes/peas-and-pea-pods.jpg?itok=Hq3Aoavs',
        },
        {
          id: 'potato6291djksd',
          name: 'Potato',
          description: 'Versatile and filling potatoes',
          image: 'https://cdn.mos.cms.futurecdn.net/iC7HBvohbJqExqvbKcV3pP.jpg',
        },
        {
          id: 'pumpkin8271djksl',
          name: 'Pumpkin',
          description: 'Sweet and hearty pumpkins',
          image:
            'https://cdn.shopify.com/s/files/1/0244/4961/3905/products/Premiumpumpkin_grande.png?v=1609570487',
        },
        {
          id: 'radish3147fjksd',
          name: 'Radish',
          description: 'Crunchy and refreshing radishes',
          image:
            'https://www.gardeningknowhow.com/wp-content/uploads/2009/03/radish.jpg',
        },
        {
          id: 'sweetpotato2187fjsld',
          name: 'Sweet Potato',
          description: 'Naturally sweet and nutritious sweet potatoes',
          image:
            'https://c.ndtvimg.com/2018-10/rn4qsd9_sweet-potatoes-_625x300_10_October_18.jpg',
        },
        {
          id: 'watermelon7368djksd',
          name: 'Watermelon',
          description: 'Juicy and refreshing watermelon',
          image: 'https://images.heb.com/is/image/HEBGrocery/000320934-1',
        },

        // add more vegetable products here
      ],
    }
  },
  computed: {
    sortedProducts() {
      return this.products.sort((a, b) => a.name.localeCompare(b.name))
    },
  },
  methods: {
    scrollToTop() {
      window.scrollTo({
        top: 0,
        behavior: 'smooth',
      })
    },
    handleScroll() {
      if (window.pageYOffset > 50) {
        this.showScrollButton = true
      } else {
        this.showScrollButton = false
      }
    },
  },
  created() {
    if (typeof window !== 'undefined') {
      window.addEventListener('scroll', this.handleScroll)
    }
  },
  destroyed() {
    if (typeof window !== 'undefined') {
      window.removeEventListener('scroll', this.handleScroll)
    }
  },
}
</script>
<style lang="scss" scoped>
.products-page {
  min-height: calc(100vh - 72px - 80px);
  display: flex;
  flex-direction: column;
  align-items: center;

  .title {
    font-size: 24px;
    margin-top: 24px;
    margin-bottom: 20px;
    color: #333;

    text-align: center;
  }

  .product-item {
    width: 50vw;

    & + .product-item {
      margin-top: 16px;
    }

    .product-container {
      display: flex;
      align-items: center;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
      transition: background-color 0.2s ease;

      &:hover,
      &.is-active {
        background-color: $primary-third;
      }

      .view-btn {
        display: inline-block;
        padding: 8px 16px;
        border-radius: 4px;
        background-color: #4caf50;
        color: #ffffff;
        text-decoration: none;
        font-size: 16px;
        font-weight: bold;
        text-align: center;
        cursor: pointer;
        transition: background-color 0.3s ease-in-out;
        margin-left: 16px;

        &:hover {
          background-color: #388e3c;
        }
      }
    }

    .product-image {
      width: 100px;
      height: 100px;
      background-size: cover;
      background-position: center;
      margin-right: 20px;
    }

    .product-info {
      flex-grow: 1;
    }

    .product-name {
      font-size: 18px;
      margin-bottom: 10px;
      color: #333;
    }

    .product-description {
      font-size: 14px;
      color: #666;
    }
  }

  .scroll-to-top {
    position: fixed;
    bottom: 20px;
    right: 20px;
    padding: 10px;
    background-color: #333;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  }

  .scroll-to-top:hover {
    background-color: #555;
  }

  .scroll-to-top.show {
    display: block;
  }
}
</style>