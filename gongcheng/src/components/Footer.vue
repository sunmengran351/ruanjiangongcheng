<template>
  <footer class="footer">
    <div class="container">
      <div class="footer-content">
        <p>&copy; 2025 作品集展示网站. 使用 Supabase + Netlify 构建</p>
        <div class="footer-links">
          <span>技术栈: Vue 3, Supabase, Netlify</span>
        </div>
      </div>
    </div>
  </footer>
</template>

<script>
export default {
  name: 'Footer'
}
</script>

<style scoped>
.footer {
  background: #1f2937;
  color: white;
  padding: 2rem 0;
  margin-top: auto;
}

.footer-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
  gap: 1rem;
}

.footer-links {
  color: #9ca3af;
}

@media (max-width: 768px) {
  .footer-content {
    flex-direction: column;
    text-align: center;
  }
}
</style>