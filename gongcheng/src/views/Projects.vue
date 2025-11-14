<template>
  <div class="projects">
    <div class="container">
      <!-- Page Header -->
      <div class="page-header">
        <h1 class="page-title">作品展示</h1>
        <p class="page-description">这里展示了我所有的项目作品，包含前端、后端和全栈开发项目</p>
      </div>

      <!-- Filters -->
      <div class="filters">
        <div class="filter-group">
          <label for="category-filter">分类筛选:</label>
          <select id="category-filter" v-model="selectedCategory" @change="filterProjects">
            <option value="">全部项目</option>
            <option v-for="category in categories" :key="category.id" :value="category.id">
              {{ category.name }}
            </option>
          </select>
        </div>
        
        <div class="filter-group">
          <label for="tech-filter">技术栈:</label>
          <select id="tech-filter" v-model="selectedTech" @change="filterProjects">
            <option value="">全部技术</option>
            <option v-for="tech in techStacks" :key="tech.id" :value="tech.id">
              {{ tech.name }}
            </option>
          </select>
        </div>

        <div class="search-group">
          <input 
            type="text" 
            v-model="searchQuery" 
            @input="filterProjects" 
            placeholder="搜索项目..."
            class="search-input"
          />
        </div>
      </div>

      <!-- Projects Grid -->
      <div class="projects-grid">
        <div v-for="project in filteredProjects" :key="project.id" class="project-card">
          <div class="project-image">
            <img :src="project.image_url" :alt="project.title" />
            <div class="project-overlay">
              <div class="project-links">
                <a :href="project.project_url" target="_blank" class="btn btn-primary">查看演示</a>
                <a :href="project.github_url" target="_blank" class="btn btn-secondary">GitHub</a>
              </div>
            </div>
          </div>
          <div class="project-content">
            <h3 class="project-title">{{ project.title }}</h3>
            <p class="project-description">{{ project.description }}</p>
            <div class="project-meta">
              <span class="category-tag">{{ project.categories.name }}</span>
              <span class="tech-tag">{{ project.tech_stacks.name }}</span>
            </div>
            <div class="project-date">
              {{ formatDate(project.created_at) }}
            </div>
          </div>
        </div>
      </div>

      <!-- No Results -->
      <div v-if="filteredProjects.length === 0" class="no-results">
        <h3>没有找到匹配的项目</h3>
        <p>请尝试调整筛选条件或搜索关键词</p>
      </div>

      <!-- Loading State -->
      <div v-if="loading" class="loading">
        <div class="spinner"></div>
        <p>加载中...</p>
      </div>
    </div>
  </div>
</template>

<script>
import { supabaseAPI } from '../config/supabase.js'

export default {
  name: 'Projects',
  data() {
    return {
      projects: [],
      categories: [],
      techStacks: [],
      selectedCategory: '',
      selectedTech: '',
      searchQuery: '',
      loading: false
    }
  },
  computed: {
    filteredProjects() {
      return this.projects.filter(project => {
        const matchesCategory = !this.selectedCategory || project.category_id === this.selectedCategory
        const matchesTech = !this.selectedTech || project.tech_stack_id === this.selectedTech
        const matchesSearch = !this.searchQuery || 
          project.title.toLowerCase().includes(this.searchQuery.toLowerCase()) ||
          project.description.toLowerCase().includes(this.searchQuery.toLowerCase())
        
        return matchesCategory && matchesTech && matchesSearch
      })
    }
  },
  async mounted() {
    await this.loadData()
  },
  methods: {
    async loadData() {
      this.loading = true
      try {
        // 并行加载所有数据
        const [projectsData, categoriesData, techStacksData] = await Promise.all([
          supabaseAPI.getProjects(),
          supabaseAPI.getCategories(),
          supabaseAPI.getTechStacks()
        ])
        
        this.projects = projectsData
        this.categories = categoriesData
        this.techStacks = techStacksData
      } catch (error) {
        console.error('数据加载失败:', error)
        // 使用模拟数据
        this.projects = [
          {
            id: 1,
            title: '个人博客系统',
            description: '基于Vue 3和Node.js的个人博客系统，支持文章发布、评论功能',
            image_url: 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?w=400',
            project_url: '#',
            github_url: '#',
            category_id: '1',
            tech_stack_id: '1',
            categories: { name: '全栈项目' },
            tech_stacks: { name: 'Vue.js' },
            created_at: new Date().toISOString()
          },
          {
            id: 2,
            title: '电商网站',
            description: '完整的电商平台，包含商品展示、购物车、支付功能',
            image_url: 'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=400',
            project_url: '#',
            github_url: '#',
            category_id: '1',
            tech_stack_id: '2',
            categories: { name: '全栈项目' },
            tech_stacks: { name: 'React' },
            created_at: new Date().toISOString()
          },
          {
            id: 3,
            title: '天气应用',
            description: '实时天气查询应用，支持全球城市搜索',
            image_url: 'https://images.unsplash.com/photo-1504608524841-42fe6f032b4b?w=400',
            project_url: '#',
            github_url: '#',
            category_id: '2',
            tech_stack_id: '1',
            categories: { name: '前端开发' },
            tech_stacks: { name: 'Vue.js' },
            created_at: new Date().toISOString()
          }
        ]
        
        this.categories = [
          { id: '1', name: '全栈项目' },
          { id: '2', name: '前端开发' }
        ]
        
        this.techStacks = [
          { id: '1', name: 'Vue.js' },
          { id: '2', name: 'React' }
        ]
      } finally {
        this.loading = false
      }
    },
    
    filterProjects() {
      // 计算属性会自动更新，这里不需要额外处理
    },
    
    formatDate(dateString) {
      const date = new Date(dateString)
      return date.toLocaleDateString('zh-CN', {
        year: 'numeric',
        month: 'long',
        day: 'numeric'
      })
    }
  }
}
</script>

<style scoped>
.projects {
  min-height: 100vh;
  padding: 2rem 0;
}

.page-header {
  text-align: center;
  margin-bottom: 3rem;
}

.page-title {
  font-size: 2.5rem;
  color: #1f2937;
  margin-bottom: 1rem;
}

.page-description {
  font-size: 1.125rem;
  color: #6b7280;
  max-width: 600px;
  margin: 0 auto;
}

.filters {
  background: white;
  padding: 1.5rem;
  border-radius: 12px;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
  margin-bottom: 2rem;
  display: flex;
  gap: 2rem;
  align-items: center;
  flex-wrap: wrap;
}

.filter-group {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

.filter-group label {
  font-weight: 500;
  color: #374151;
}

.filter-group select {
  padding: 0.5rem 1rem;
  border: 1px solid #d1d5db;
  border-radius: 6px;
  background: white;
}

.search-group {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

.search-input {
  padding: 0.5rem 1rem;
  border: 1px solid #d1d5db;
  border-radius: 6px;
  width: 100%;
}

.projects-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
  gap: 2rem;
  margin-bottom: 2rem;
}

.project-card {
  background: white;
  border-radius: 16px;
  overflow: hidden;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.project-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
}

.project-image {
  position: relative;
  overflow: hidden;
}

.project-image img {
  width: 100%;
  height: 200px;
  object-fit: cover;
  transition: transform 0.3s ease;
}

.project-card:hover .project-image img {
  transform: scale(1.05);
}

.project-overlay {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.7);
  display: flex;
  align-items: center;
  justify-content: center;
  opacity: 0;
  transition: opacity 0.3s ease;
}

.project-card:hover .project-overlay {
  opacity: 1;
}

.project-links {
  display: flex;
  gap: 0.5rem;
}

.project-content {
  padding: 1.5rem;
}

.project-title {
  font-size: 1.25rem;
  font-weight: 600;
  margin-bottom: 0.5rem;
  color: #1f2937;
}

.project-description {
  color: #6b7280;
  margin-bottom: 1rem;
  line-height: 1.6;
}

.project-meta {
  display: flex;
  gap: 0.5rem;
  margin-bottom: 1rem;
}

.category-tag,
.tech-tag {
  padding: 0.25rem 0.75rem;
  border-radius: 20px;
  font-size: 0.875rem;
  font-weight: 500;
}

.category-tag {
  background: #f0f9ff;
  color: #0369a1;
}

.tech-tag {
  background: #f0fdf4;
  color: #166534;
}

.project-date {
  color: #9ca3af;
  font-size: 0.875rem;
}

.no-results {
  text-align: center;
  padding: 4rem 2rem;
  color: #6b7280;
}

.loading {
  text-align: center;
  padding: 4rem 2rem;
}

.spinner {
  width: 40px;
  height: 40px;
  border: 4px solid #e5e7eb;
  border-left: 4px solid #3b82f6;
  border-radius: 50%;
  animation: spin 1s linear infinite;
  margin: 0 auto 1rem;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

@media (max-width: 768px) {
  .filters {
    flex-direction: column;
    align-items: stretch;
  }
  
  .projects-grid {
    grid-template-columns: 1fr;
  }
}
</style>