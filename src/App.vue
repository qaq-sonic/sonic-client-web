<script setup lang="ts">
import './assets/light.css';
import './assets/dark.css';
import { ref, watch, computed } from 'vue';
import { useStore } from 'vuex';
import { getElementPlusLocale } from './locales/setupI18n';
import { RouterView } from 'vue-router';
import { ElConfigProvider } from 'element-plus';

const store = useStore();
const locale = ref(getElementPlusLocale());
const storelocale = computed(() => {
  return store.getters.getLocale;
});
// 监听语言切换
watch(storelocale, () => {
  locale.value = getElementPlusLocale();
});
</script>

<template>
  <ElConfigProvider :locale="locale">
    <RouterView />
  </ElConfigProvider>
</template>

<style>
@import './assets/common.css';
</style>
