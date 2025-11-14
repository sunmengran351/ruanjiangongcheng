-- Supabase 数据库表结构设计
-- 项目表 (projects)
CREATE TABLE IF NOT EXISTS projects (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    image_url VARCHAR(500),
    project_url VARCHAR(500),
    github_url VARCHAR(500),
    category_id UUID REFERENCES categories(id),
    tech_stack_id UUID REFERENCES tech_stacks(id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 分类表 (categories)
CREATE TABLE IF NOT EXISTS categories (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 技术栈表 (tech_stacks)
CREATE TABLE IF NOT EXISTS tech_stacks (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    icon VARCHAR(200),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 插入示例数据
INSERT INTO categories (name, description) VALUES 
('前端开发', '前端相关项目'),
('后端开发', '后端相关项目'),
('全栈项目', '前后端完整的项目'),
('移动端应用', '移动端应用开发');

INSERT INTO tech_stacks (name, icon) VALUES 
('Vue.js', 'vue-icon'),
('React', 'react-icon'),
('Node.js', 'nodejs-icon'),
('Python', 'python-icon'),
('Java', 'java-icon'),
('MySQL', 'mysql-icon'),
('MongoDB', 'mongodb-icon');

-- 插入示例项目数据
INSERT INTO projects (title, description, image_url, project_url, github_url, category_id, tech_stack_id) VALUES
('个人博客系统', '基于Vue 3和Node.js的个人博客系统，支持文章发布、评论功能', 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?w=400', 'https://blog.example.com', 'https://github.com/user/blog-project', (SELECT id FROM categories WHERE name = '全栈项目'), (SELECT id FROM tech_stacks WHERE name = 'Vue.js')),
('电商网站', '完整的电商平台，包含商品展示、购物车、支付功能', 'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=400', 'https://shop.example.com', 'https://github.com/user/ecommerce', (SELECT id FROM categories WHERE name = '全栈项目'), (SELECT id FROM tech_stacks WHERE name = 'React')),
('天气应用', '实时天气查询应用，支持全球城市搜索', 'https://images.unsplash.com/photo-1504608524841-42fe6f032b4b?w=400', 'https://weather.example.com', 'https://github.com/user/weather-app', (SELECT id FROM categories WHERE name = '前端开发'), (SELECT id FROM tech_stacks WHERE name = 'Vue.js'));