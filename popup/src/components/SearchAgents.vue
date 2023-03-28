<script setup lang="ts">
import { ref } from 'vue'

import { ID, Agent } from 'repeer-common'
import a from 'repeer-common'

const idTypeSearch = ref('')
const search = ref('')

const searchResults = ref([{
  id: 0, 
  name: 'felix', 
  ids: 'aimparency.org', 
  value: 1000000 
}] as Agent[])

</script>

<template>
  <div class="greetings">
    <h2>
      Browse Identities
    </h2>
    <input type="text" v-model="idTypeSearch" placeholder='ID type' />
    <input type="text" v-model="search" placeholder='search ID or name'/>
    <div class="search-results">
      <div v-for="result in searchResults" :key="result.id">
        <div class="result">
          <div class="result-name">
            {{ result.name }}
          </div>
          <div class="result-ids">
            {{ result.ids }}
          </div>
          <div class="result-value">
            {{ result.value }}
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
</style>
