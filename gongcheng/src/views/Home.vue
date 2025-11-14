<template>
  <div class="home">
    <!-- Hero Section -->
    <section class="hero">
      <div class="container">
        <div class="hero-content">
          <h1 class="hero-title">个人作品集展示</h1>
          <p class="hero-description">
            展示我的前端开发、后端开发以及全栈项目作品。使用现代技术栈构建，包含完整的项目案例和代码展示。
          </p>
          <div class="hero-actions">
            <router-link to="/projects" class="btn btn-primary">查看作品</router-link>
            <router-link to="/about" class="btn btn-secondary">了解更多</router-link>
          </div>
        </div>
        <div class="hero-image">
          <div class="tech-icons">
            <div class="tech-icon" v-for="tech in featuredTechs" :key="tech.name">
              <span class="icon">{{ tech.icon }}</span>
              <span class="name">{{ tech.name }}</span>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Featured Projects -->
    <section class="featured-projects">
      <div class="container">
        <h2 class="section-title">精选项目</h2>
        <div class="projects-grid">
          <div v-for="project in featuredProjects" :key="project.id" class="project-card">
            <div class="project-image">
              <img :src="project.image_url" :alt="project.title" />
            </div>
            <div class="project-content">
              <h3 class="project-title">{{ project.title }}</h3>
              <p class="project-description">{{ project.description }}</p>
              <div class="project-tech">
                <span class="tech-tag">{{ project.tech_stacks.name }}</span>
              </div>
              <div class="project-links">
                <a :href="project.project_url" target="_blank" class="btn btn-primary">查看演示</a>
                <a :href="project.github_url" target="_blank" class="btn btn-secondary">GitHub</a>
              </div>
            </div>
          </div>
        </div>
        <div class="section-actions">
          <router-link to="/projects" class="btn btn-primary">查看所有项目</router-link>
        </div>
      </div>
    </section>

    <!-- Stats Section -->
    <section class="stats">
      <div class="container">
        <div class="stats-grid">
          <div class="stat-item">
            <div class="stat-number">{{ projectsCount }}</div>
            <div class="stat-label">项目总数</div>
          </div>
          <div class="stat-item">
            <div class="stat-number">{{ categoriesCount }}</div>
            <div class="stat-label">分类数量</div>
          </div>
          <div class="stat-item">
            <div class="stat-number">{{ techStacksCount }}</div>
            <div class="stat-label">技术栈</div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import { supabaseAPI } from '../config/supabase.js'

export default {
  name: 'Home',
  data() {
    return {
      featuredProjects: [],
      projectsCount: 0,
      categoriesCount: 0,
      techStacksCount: 0,
      featuredTechs: [
        { name: 'Vue.js', icon: '⚡' },
        { name: 'React', icon: '⚛️' },
        { name: 'Node.js', icon: '🟢' },
        { name: 'Python', icon: '🐍' }
      ]
    }
  },
  async mounted() {
    await this.loadData()
  },
  methods: {
    async loadData() {
      try {
        // 获取特色项目（前3个）
        const projects = await supabaseAPI.getProjects()
        this.featuredProjects = projects.slice(0, 3)
        this.projectsCount = projects.length

        // 获取分类数量
        const categories = await supabaseAPI.getCategories()
        this.categoriesCount = categories.length

        // 获取技术栈数量
        const techStacks = await supabaseAPI.getTechStacks()
        this.techStacksCount = techStacks.length
      } catch (error) {
        console.error('数据加载失败:', error)
        // 使用模拟数据
        this.featuredProjects = [
          {
            id: 1,
            title: '个人博客系统',
            description: '基于Vue 3和Node.js的个人博客系统',
            image_url: 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?w=400',
            project_url: '#',
            github_url: '#',
            tech_stacks: { name: 'Vue.js' }
          }
        ]
        this.projectsCount = 3
        this.categoriesCount = 4
        this.techStacksCount = 7
      }
    }
  }
}
</script>

<style scoped>
.hero {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  padding: 6rem 0;
  min-height: 80vh;
  display: flex;
  align-items: center;
}

.hero .container {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 4rem;
  align-items: center;
}

.hero-title {
  font-size: 3.5rem;
  font-weight: 700;
  margin-bottom: 1.5rem;
  line-height: 1.2;
}

.hero-description {
  font-size: 1.25rem;
  margin-bottom: 2rem;
  opacity: 0.9;
  line-height: 1.6;
}

.hero-actions {
  display: flex;
  gap: 1rem;
}

.tech-icons {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 1rem;
}

.tech-icon {
  background: rgba(255, 255, 255, 0.1);
  padding: 1rem;
  border-radius: 12px;
  text-align: center;
  backdrop-filter: blur(10px);
}

.tech-icon .icon {
  font-size: 2rem;
  display: block;
  margin-bottom: 0.5rem;
}

.featured-projects {
  padding: 6rem 0;
}

.section-title {
  font-size: 2.5rem;
  text-align: center;
  margin-bottom: 3rem;
  color: #1f2937;
}

.projects-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
  gap: 2rem;
  margin-bottom: 3rem;
}

.project-card {
  background: white;
  border-radius: 16px;
  overflow: hidden;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease;
}

.project-card:hover {
  transform: translateY(-8px);
}

.project-image img {
  width: 100%;
  height: 200px;
  object-fit: cover;
}

.project-content {
  padding: 1.5rem;
}

.project-title {
  font-size: 1.5rem;
  font-weight: 600;
  margin-bottom: 0.5rem;
  color: #1f2937;
}

.project-description {
  color: #6b7280;
  margin-bottom: 1rem;
  line-height: 1.6;
}

.project-tech {
  margin-bottom: 1rem;
}

.tech-tag {
  background: #eff6ff;
  color: #3b82f6;
  padding: 0.25rem 0.75rem;
  border-radius: 20px;
  font-size: 0.875rem;
  font-weight: 500;
}

.project-links {
  display: flex;
  gap: 0.5rem;
}

.section-actions {
  text-align: center;
}

.stats {
  background: #1f2937;
  color: white;
  padding: 4rem 0;
}

.stats-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 2rem;
  text-align: center;
}

.stat-number {
  font-size: 3rem;
  font-weight: 700;
  color: #3b82f6;
}

.stat-label {
  font-size: 1.25rem;
  color: #d1d5db;
}

@media (max-width: 768px) {
  .hero .container {
    grid-template-columns: 1fr;
    text-align: center;
  }
  
  .hero-title {
    font-size: 2.5rem;
  }
  
  .projects-grid {
    grid-template-columns: 1fr;
  }
  
  .stats-grid {
    grid-template-columns: 1fr;
  }
}
</style>