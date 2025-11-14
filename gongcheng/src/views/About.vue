<template>
  <div class="about">
    <div class="container">
      <!-- Page Header -->
      <div class="page-header">
        <h1 class="page-title">关于我</h1>
        <p class="page-description">全栈开发者，专注于现代Web技术栈</p>
      </div>

      <!-- Profile Section -->
      <div class="profile-section">
        <div class="profile-content">
          <div class="profile-image">
            <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300" alt="个人头像" />
          </div>
          <div class="profile-info">
            <h2>张明</h2>
            <p class="profile-title">全栈开发者</p>
            <p class="profile-description">
              拥有3年Web开发经验，专注于Vue.js、React、Node.js等技术栈。
              热爱技术，享受创造优秀用户体验的过程。
            </p>
            <div class="contact-info">
              <div class="contact-item">
                <span class="icon">📧</span>
                <span>zhangming@example.com</span>
              </div>
              <div class="contact-item">
                <span class="icon">💼</span>
                <span>GitHub: zhangming-dev</span>
              </div>
              <div class="contact-item">
                <span class="icon">📍</span>
                <span>中国 · 北京</span>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Skills Section -->
      <section class="skills-section">
        <h2 class="section-title">技术栈</h2>
        <div class="skills-grid">
          <div class="skill-category">
            <h3>前端技术</h3>
            <div class="skills-list">
              <div v-for="skill in frontendSkills" :key="skill.name" class="skill-item">
                <span class="skill-name">{{ skill.name }}</span>
                <div class="skill-level">
                  <div class="skill-bar" :style="{ width: skill.level + '%' }"></div>
                </div>
                <span class="skill-percentage">{{ skill.level }}%</span>
              </div>
            </div>
          </div>
          
          <div class="skill-category">
            <h3>后端技术</h3>
            <div class="skills-list">
              <div v-for="skill in backendSkills" :key="skill.name" class="skill-item">
                <span class="skill-name">{{ skill.name }}</span>
                <div class="skill-level">
                  <div class="skill-bar" :style="{ width: skill.level + '%' }"></div>
                </div>
                <span class="skill-percentage">{{ skill.level }}%</span>
              </div>
            </div>
          </div>
          
          <div class="skill-category">
            <h3>工具与数据库</h3>
            <div class="skills-list">
              <div v-for="skill in toolsSkills" :key="skill.name" class="skill-item">
                <span class="skill-name">{{ skill.name }}</span>
                <div class="skill-level">
                  <div class="skill-bar" :style="{ width: skill.level + '%' }"></div>
                </div>
                <span class="skill-percentage">{{ skill.level }}%</span>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- Experience Section -->
      <section class="experience-section">
        <h2 class="section-title">项目经验</h2>
        <div class="timeline">
          <div v-for="exp in experiences" :key="exp.id" class="timeline-item">
            <div class="timeline-marker"></div>
            <div class="timeline-content">
              <h3 class="timeline-title">{{ exp.title }}</h3>
              <p class="timeline-company">{{ exp.company }}</p>
              <p class="timeline-period">{{ exp.period }}</p>
              <p class="timeline-description">{{ exp.description }}</p>
              <div class="timeline-tech">
                <span v-for="tech in exp.technologies" :key="tech" class="tech-tag">{{ tech }}</span>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- Contact Section -->
      <section class="contact-section">
        <h2 class="section-title">联系我</h2>
        <div class="contact-grid">
          <div class="contact-card">
            <div class="contact-icon">📧</div>
            <h3>邮箱</h3>
            <p>zhangming@example.com</p>
            <a href="mailto:zhangming@example.com" class="btn btn-primary">发送邮件</a>
          </div>
          
          <div class="contact-card">
            <div class="contact-icon">💼</div>
            <h3>GitHub</h3>
            <p>查看我的开源项目</p>
            <a href="https://github.com/zhangming-dev" target="_blank" class="btn btn-secondary">访问GitHub</a>
          </div>
          
          <div class="contact-card">
            <div class="contact-icon">🌐</div>
            <h3>个人网站</h3>
            <p>了解更多关于我的信息</p>
            <a href="https://zhangming.dev" target="_blank" class="btn btn-primary">访问网站</a>
          </div>
        </div>
      </section>
    </div>
  </div>
</template>

<script>
export default {
  name: 'About',
  data() {
    return {
      frontendSkills: [
        { name: 'Vue.js', level: 90 },
        { name: 'React', level: 85 },
        { name: 'TypeScript', level: 80 },
        { name: 'CSS/SCSS', level: 88 },
        { name: 'Tailwind CSS', level: 85 }
      ],
      backendSkills: [
        { name: 'Node.js', level: 85 },
        { name: 'Python', level: 75 },
        { name: 'Express.js', level: 80 },
        { name: 'RESTful API', level: 85 },
        { name: 'GraphQL', level: 70 }
      ],
      toolsSkills: [
        { name: 'Git', level: 90 },
        { name: 'Docker', level: 75 },
        { name: 'MySQL', level: 80 },
        { name: 'MongoDB', level: 75 },
        { name: 'AWS', level: 70 }
      ],
      experiences: [
        {
          id: 1,
          title: '全栈开发者',
          company: '科技公司',
          period: '2023年 - 至今',
          description: '负责公司主要产品的全栈开发，使用Vue.js和Node.js构建高性能Web应用',
          technologies: ['Vue.js', 'Node.js', 'MySQL', 'Docker']
        },
        {
          id: 2,
          title: '前端开发工程师',
          company: '互联网公司',
          period: '2022年 - 2023年',
          description: '专注于React应用开发，优化用户体验和页面性能',
          technologies: ['React', 'TypeScript', 'Redux', 'Webpack']
        },
        {
          id: 3,
          title: 'Web开发实习生',
          company: '创业公司',
          period: '2021年 - 2022年',
          description: '学习Web开发基础，参与多个小型项目的开发',
          technologies: ['HTML/CSS', 'JavaScript', 'PHP', 'MySQL']
        }
      ]
    }
  }
}
</script>

<style scoped>
.about {
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
}

.profile-section {
  background: white;
  border-radius: 16px;
  padding: 3rem;
  margin-bottom: 3rem;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
}

.profile-content {
  display: grid;
  grid-template-columns: auto 1fr;
  gap: 3rem;
  align-items: center;
}

.profile-image img {
  width: 150px;
  height: 150px;
  border-radius: 50%;
  object-fit: cover;
}

.profile-info h2 {
  font-size: 2rem;
  color: #1f2937;
  margin-bottom: 0.5rem;
}

.profile-title {
  color: #3b82f6;
  font-size: 1.25rem;
  margin-bottom: 1rem;
  font-weight: 500;
}

.profile-description {
  color: #6b7280;
  line-height: 1.6;
  margin-bottom: 1.5rem;
}

.contact-info {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

.contact-item {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  color: #6b7280;
}

.section-title {
  font-size: 2rem;
  color: #1f2937;
  margin-bottom: 2rem;
  text-align: center;
}

.skills-section {
  margin-bottom: 3rem;
}

.skills-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
}

.skill-category {
  background: white;
  padding: 1.5rem;
  border-radius: 12px;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
}

.skill-category h3 {
  font-size: 1.25rem;
  color: #1f2937;
  margin-bottom: 1rem;
}

.skills-list {
  display: flex;
  flex-direction: column;
  gap: 1rem;
}

.skill-item {
  display: grid;
  grid-template-columns: 1fr auto;
  gap: 1rem;
  align-items: center;
}

.skill-name {
  font-weight: 500;
  color: #374151;
}

.skill-level {
  width: 100px;
  height: 8px;
  background: #e5e7eb;
  border-radius: 4px;
  overflow: hidden;
}

.skill-bar {
  height: 100%;
  background: #3b82f6;
  border-radius: 4px;
  transition: width 0.3s ease;
}

.skill-percentage {
  font-size: 0.875rem;
  color: #6b7280;
  min-width: 40px;
}

.experience-section {
  margin-bottom: 3rem;
}

.timeline {
  position: relative;
  max-width: 800px;
  margin: 0 auto;
}

.timeline::before {
  content: '';
  position: absolute;
  left: 30px;
  top: 0;
  bottom: 0;
  width: 2px;
  background: #e5e7eb;
}

.timeline-item {
  position: relative;
  margin-bottom: 2rem;
  padding-left: 80px;
}

.timeline-marker {
  position: absolute;
  left: 24px;
  top: 0;
  width: 12px;
  height: 12px;
  border-radius: 50%;
  background: #3b82f6;
  border: 3px solid white;
  box-shadow: 0 0 0 3px #3b82f6;
}

.timeline-content {
  background: white;
  padding: 1.5rem;
  border-radius: 12px;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
}

.timeline-title {
  font-size: 1.25rem;
  color: #1f2937;
  margin-bottom: 0.5rem;
}

.timeline-company {
  color: #3b82f6;
  font-weight: 500;
  margin-bottom: 0.25rem;
}

.timeline-period {
  color: #6b7280;
  font-size: 0.875rem;
  margin-bottom: 1rem;
}

.timeline-description {
  color: #6b7280;
  line-height: 1.6;
  margin-bottom: 1rem;
}

.timeline-tech {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
}

.tech-tag {
  background: #eff6ff;
  color: #3b82f6;
  padding: 0.25rem 0.75rem;
  border-radius: 20px;
  font-size: 0.875rem;
  font-weight: 500;
}

.contact-section {
  margin-bottom: 3rem;
}

.contact-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 2rem;
}

.contact-card {
  background: white;
  padding: 2rem;
  border-radius: 12px;
  text-align: center;
  box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease;
}

.contact-card:hover {
  transform: translateY(-4px);
}

.contact-icon {
  font-size: 3rem;
  margin-bottom: 1rem;
}

.contact-card h3 {
  font-size: 1.25rem;
  color: #1f2937;
  margin-bottom: 0.5rem;
}

.contact-card p {
  color: #6b7280;
  margin-bottom: 1rem;
}

@media (max-width: 768px) {
  .profile-content {
    grid-template-columns: 1fr;
    text-align: center;
  }
  
  .skills-grid {
    grid-template-columns: 1fr;
  }
  
  .timeline::before {
    left: 20px;
  }
  
  .timeline-item {
    padding-left: 60px;
  }
  
  .timeline-marker {
    left: 14px;
  }
  
  .contact-grid {
    grid-template-columns: 1fr;
  }
}
</style>