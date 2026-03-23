# 发布到 GitHub 和 JitPack 指南

## 发布步骤

### 第一步: 修改配置

1. **修改 `yyevac/build.gradle` 中的 groupId**

   打开 `yyevac/build.gradle`,找到以下位置,将 `YOUR_USERNAME` 替换为你的 GitHub 用户名:

   ```gradle
   groupId = 'com.github.YOUR_USERNAME'
   ```

   例如,如果你的 GitHub 用户名是 `john`,则改为:
   ```gradle
   groupId = 'com.github.john'
   ```

2. **修改发布脚本中的仓库地址**

   打开 `publish.sh` 或 `publish.bat`,将:
   - `YOUR_USERNAME` 替换为你的 GitHub 用户名
   - `REPO_NAME` 替换为你的仓库名称

### 第二步: 推送到 GitHub

#### 方式一: 使用发布脚本

**Windows 用户:**
```bash
publish.bat
```

**Mac/Linux 用户:**
```bash
chmod +x publish.sh
./publish.sh
```

#### 方式二: 手动执行命令

```bash
# 1. 提交代码
git add .
git commit -m "Release version 1.0.0"

# 2. 创建标签
git tag -a v1.0.0 -m "Release version 1.0.0"

# 3. 推送代码和标签
git push origin main
git push origin v1.0.0
```

### 第三步: 在 JitPack 上构建

1. 访问 [JitPack.io](https://jitpack.io/)
2. 输入你的 GitHub 仓库地址: `https://github.com/YOUR_USERNAME/REPO_NAME`
3. 点击 "Look up" 按钮
4. 在版本列表中找到 `v1.0.0`,点击 "Get it" 按钮开始构建
5. 等待构建完成(通常需要几分钟)
6. 构建成功后会显示绿色的勾号 ✅

### 第四步: 使用依赖

构建成功后,其他开发者可以通过以下方式使用你的库:

#### 1. 在项目根目录的 `build.gradle` 中添加:

```gradle
allprojects {
    repositories {
        google()
        mavenCentral()
        maven { url 'https://jitpack.io' }
    }
}
```

#### 2. 在模块的 `build.gradle` 中添加依赖:

```gradle
dependencies {
    implementation 'com.github.YOUR_USERNAME:REPO_NAME:1.0.0'
}
```

## 发布新版本

当你要发布新版本时:

1. 修改 `yyevac/build.gradle` 中的版本号:
   ```gradle
   version = '1.0.1'
   ```

2. 提交代码并打新标签:
   ```bash
   git add .
   git commit -m "Release version 1.0.1"
   git tag -a v1.0.1 -m "Release version 1.0.1"
   git push origin main
   git push origin v1.0.1
   ```

3. 在 JitPack 上重新构建新版本

## 注意事项

1. **首次构建可能较慢**: JitPack 首次构建你的仓库时可能需要下载依赖,可能需要 5-10 分钟
2. **仓库必须公开**: 要让其他人能使用,你的 GitHub 仓库必须设置为 Public
3. **版本号格式**: 标签名称建议以 `v` 开头,如 `v1.0.0`
4. **构建失败排查**: 如果构建失败,可以在 JitPack 页面点击构建日志查看具体错误信息

## 常见问题

### Q: 构建失败怎么办?
A: 点击构建日志查看错误,常见问题:
- 缺少依赖: 检查 `build.gradle` 中所有依赖是否正确
- 编译错误: 确保代码在本地可以正常编译
- 配置错误: 检查 `jitpack.yml` 配置是否正确

### Q: 如何更新版本?
A: 修改版本号后,提交新标签并推送到 GitHub,然后在 JitPack 上构建新版本

### Q: 如何回滚版本?
A: 删除对应的 Git 标签:
```bash
git tag -d v1.0.0
git push origin :refs/tags/v1.0.0
```
