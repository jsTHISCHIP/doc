const { execSync } = require('child_process')
const path = require('path')
const fs = require('fs')

// 项目路径
const outDir = path.resolve(__dirname, '.vitepress/dist')

// 构建
execSync('npm run docs:build', { stdio: 'inherit' })

// 进入输出目录
process.chdir(outDir)

// 初始化 Git 并提交
execSync('git init', { stdio: 'inherit' })
execSync('git add -A', { stdio: 'inherit' })
execSync('git commit -m "deploy"', { stdio: 'inherit' })

// 推送到 gh-pages 分支（注意替换为你的仓库地址）
execSync('git push -f https://github.com/jsTHISCHIP/doc.git master:gh-pages', {
  stdio: 'inherit',
})