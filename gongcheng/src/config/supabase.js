import { createClient } from '@supabase/supabase-js'

// Supabase 配置
// 在实际部署时，这些配置需要从环境变量中读取
const supabaseUrl = import.meta.env.VITE_SUPABASE_URL || 'https://your-project.supabase.co'
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY || 'your-anon-key'

// 创建 Supabase 客户端
export const supabase = createClient(supabaseUrl, supabaseAnonKey)

// 数据库操作函数
export const supabaseAPI = {
  // 获取所有项目
  async getProjects() {
    const { data, error } = await supabase
      .from('projects')
      .select(`
        *,
        categories(name),
        tech_stacks(name)
      `)
      .order('created_at', { ascending: false })
    
    if (error) throw error
    return data
  },

  // 根据分类筛选项目
  async getProjectsByCategory(categoryId) {
    const { data, error } = await supabase
      .from('projects')
      .select(`
        *,
        categories(name),
        tech_stacks(name)
      `)
      .eq('category_id', categoryId)
      .order('created_at', { ascending: false })
    
    if (error) throw error
    return data
  },

  // 获取所有分类
  async getCategories() {
    const { data, error } = await supabase
      .from('categories')
      .select('*')
      .order('name')
    
    if (error) throw error
    return data
  },

  // 获取所有技术栈
  async getTechStacks() {
    const { data, error } = await supabase
      .from('tech_stacks')
      .select('*')
      .order('name')
    
    if (error) throw error
    return data
  }
}