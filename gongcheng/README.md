# 作品集展示网站

这是一个使用 Vue 3 + Supabase + Netlify 构建的个人作品集展示网站。

## 功能特性

- 🎨 现代化响应式设计
- 📱 移动端适配
- 🔍 项目筛选和搜索功能
- 📊 数据统计展示
- 🌐 多页面导航
- 🗄️ Supabase 数据库集成

## 技术栈

- **前端**: Vue 3, Vue Router
- **样式**: CSS3, Flexbox, Grid
- **后端**: Supabase (PostgreSQL)
- **部署**: Netlify
- **构建工具**: Vite

## 项目结构

```
src/
├── components/          # 公共组件
│   ├── Navbar.vue     # 导航栏组件
│   └── Footer.vue     # 页脚组件
├── views/              # 页面组件
│   ├── Home.vue       # 首页
│   ├── Projects.vue   # 作品展示页
│   └── About.vue      # 关于我页
├── config/             # 配置
│   └── supabase.js    # Supabase 配置
├── router/            # 路由配置
│   └── index.js
├── style.css          # 全局样式
└── main.js            # 入口文件
```

## 数据库设计

网站使用了 3 张数据表：

### 1. projects (项目表)
- id: 项目ID
- title: 项目标题
- description: 项目描述
- image_url: 项目图片
- project_url: 项目演示链接
- github_url: GitHub 链接
- category_id: 分类ID
- tech_stack_id: 技术栈ID

### 2. categories (分类表)
- id: 分类ID
- name: 分类名称
- description: 分类描述

### 3. tech_stacks (技术栈表)
- id: 技术栈ID
- name: 技术栈名称
- icon: 技术栈图标

## 本地开发

1. 克隆项目
```bash
git clone <repository-url>
cd portfolio-website
```

2. 安装依赖
```bash
npm install
```

3. 配置环境变量
复制 `.env.example` 为 `.env` 并填入你的 Supabase 配置：
```env
VITE_SUPABASE_URL=your_supabase_project_url
VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
```

4. 启动开发服务器
```bash
npm run dev
```

5. 构建生产版本
```bash
npm run build
```

## 部署到 Netlify

### 方法一：通过 Git 仓库部署
1. 将代码推送到 GitHub/GitLab
2. 登录 Netlify，选择 "New site from Git"
3. 连接你的 Git 仓库
4. 配置构建设置：
   - Build Command: `npm run build`
   - Publish Directory: `dist`
5. 添加环境变量：
   - `VITE_SUPABASE_URL`: 你的 Supabase URL
   - `VITE_SUPABASE_ANON_KEY`: 你的 Supabase Anon Key
6. 点击 "Deploy site"

### 方法二：通过拖拽部署
1. 运行 `npm run build` 构建项目
2. 将 `dist` 文件夹拖拽到 Netlify 部署区域

## Supabase 配置

1. 在 [Supabase](https://supabase.com) 创建新项目
2. 运行 `supabase-schema.sql` 中的 SQL 语句创建表结构
3. 在项目设置中获取 URL 和 Anon Key
4. 将配置信息填入环境变量

## 页面功能

### 首页 (/)
- Hero 区域介绍
- 精选项目展示
- 数据统计卡片

### 作品展示页 (/projects)
- 项目列表展示
- 分类筛选
- 技术栈筛选
- 搜索功能
- 响应式网格布局

### 关于我页 (/about)
- 个人简介
- 技能展示
- 项目经验时间线
- 联系方式

## 响应式设计

网站采用响应式设计，支持：
- 桌面端 (1200px+)
- 平板端 (768px-1199px)
- 移动端 (<768px)

## 浏览器支持

- Chrome 60+
- Firefox 55+
- Safari 12+
- Edge 79+

## 许可证

MIT License

## 开发计划

- [ ] 添加项目详情页面
- [ ] 集成评论系统
- [ ] 添加项目标签功能
- [ ] 优化图片懒加载
- [ ] 添加 PWA 支持

## 联系方式

如有问题或建议，请通过以下方式联系：
- 邮箱: developer@example.com
- GitHub: [your-username](https://github.com/your-username)