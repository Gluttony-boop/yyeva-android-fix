# YYEVA-Android - 修改版

这是基于 YYEVA-Android 的修改版本,经过定制化调整后发布到 GitHub。

## 快速开始

### 1. 在项目中添加依赖

在项目根目录的 `build.gradle` 中添加:

```gradle
allprojects {
    repositories {
        google()
        mavenCentral()
        maven { url 'https://jitpack.io' }
    }
}
```

在模块的 `build.gradle` 中添加:

```gradle
dependencies {
    implementation 'com.github.YOUR_USERNAME:REPO_NAME:1.0.0'
}
```

### 2. 使用示例

```kotlin
// 创建 EvaAnimView
val evaAnimView = EvaAnimView(context)

// 开始播放
evaAnimView.startPlay(File("/path/to/your.mp4"))

// 停止播放
evaAnimView.stopPlay()

// 设置循环播放
evaAnimView.setLoop(3) // 循环 3 次

// 设置静音
evaAnimView.setMute(true)
```

## 与原版的区别

- [列出你的修改内容]
- [说明新增的功能]
- [说明修复的问题]

## 注意事项

1. 本库基于 YYEVA-Android 原版修改,遵循原项目的开源协议
2. 使用前请确保了解 YYEVA 的设计规范和资源制作要求

## 原版项目

- [YYEVA-Android](https://github.com/yylive/YYEVA-Android)
