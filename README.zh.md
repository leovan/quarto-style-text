# Quarto 样式文本扩展

![Release](https://img.shields.io/github/release/leovan/quarto-style-text.svg)
![License](https://img.shields.io/github/license/leovan/quarto-style-text.svg)
![Issues](https://img.shields.io/github/issues/leovan/quarto-style-text.svg)

---

🇺🇸 [README](README.md) | 🇨🇳 [中文说明](README.zh.md)

一个用于在 `html` 和 `pdf` 文档中渲染样式文本的 Quarto 扩展。其基于带有 `.style-text` 类的 [Divs 和 Spans](https://quarto.org/docs/authoring/markdown-basics.html#divs-and-spans) 实现。

> [!CAUTION]
> 不支持 `pdflatex` PDF 引擎。

## 安装

```bash
quarto add leovan/style-text
```

这将在 `_extensions` 子目录中安装本插件。如果使用版本控制，请检入到此目录。

## 使用

将如下内容添加到文档的头部或 `_quarto.yml` 文件中：

```yml
filters:
  - style-text
```

扩展参数如下所示：

| 参数                        | 默认值 | 可选值                                          | 格式   | 描述                 |
| --------------------------- | ------ | ----------------------------------------------- | ------ | -------------------- |
| `color`                     |        |                                                 | 全部   | 文本颜色。           |
| `opacity`                   | 1      |                                                 | 全部   | 文本不透明度。       |
| `font`                      |        |                                                 | 全部   | 文本字体。           |
| `font-size`                 | 1      |                                                 | 全部   | 文本字体大小。       |
| `font-weight`               | normal | normal<br/>middle<br/>bold                      | 全部   | 文本字体字重。       |
| `font-style`                | normal | normal<br/>italic                               | 全部   | 文本字体样式。       |
| `box-background-color`      |        |                                                 | 全部   | 盒子背景颜色。       |
| `box-background-opacity`    | 1      |                                                 | 全部   | 盒子背景不透明度。   |
| `box-border-color`          |        |                                                 | 全部   | 盒子边框颜色。       |
| `box-border-opacity`        | 1      |                                                 | 全部   | 盒子边框不透明度。   |
| `box-border-style`          | solid  | solid<br/>dashed<br/>dotted                     | 全部   | 盒子边框样式。       |
| `box-border-width`          | 0      |                                                 | 全部   | 盒子边框线条宽度。   |
| `box-padding`               | 0      |                                                 | 全部   | 盒子内边距。         |
| `box-padding-top`           | 0      |                                                 | 全部   | 盒子顶部内边距。     |
| `box-padding-right`         | 0      |                                                 | 全部   | 盒子右侧内边距。     |
| `box-padding-bottom`        | 0      |                                                 | 全部   | 盒子底部内边距。     |
| `box-padding-left`          | 0      |                                                 | 全部   | 盒子左侧内边距。     |
| `box-radius`                | 0      |                                                 | 全部   | 盒子圆角半径。       |
| `box-radius-top-left`       | 0      |                                                 | `html` | 盒子圆角左上半径。   |
| `box-radius-top-right`      | 0      |                                                 | `html` | 盒子圆角右上半径。   |
| `box-radius-bottom-right`   | 0      |                                                 | `html` | 盒子圆角右下半径。   |
| `box-radius-bottom-left`    | 0      |                                                 | `html` | 盒子圆角左下半径。   |
| `box-shadow-color`          |        |                                                 | 全部   | 盒子阴影颜色。       |
| `box-shadow-opacity`        | 1      |                                                 | 全部   | 盒子阴影不透明度。   |
| `box-shadow-x-offset`       | 0      |                                                 | 全部   | 盒子阴影横向偏移。   |
| `box-shadow-y-offset`       | 0      |                                                 | 全部   | 盒子阴影纵向偏移。   |
| `box-shadow-blur-radius`    | 0      |                                                 | 全部   | 盒子阴影模糊度半径。 |
| `box-shadow-spread-radius`  | 0      |                                                 | `html` | 盒子阴影扩展度半径。 |
| `text-decoration-line`      |        | underline<br/>line-through                      | 全部   | 文本装饰线类型。     |
| `text-decoration-style`     | solid  | solid<br/>dashed<br/>dotted<br/>double<br/>wavy | 全部   | 文本装饰线样式。     |
| `text-decoration-color`     |        |                                                 | `html` | 文本装饰线颜色。     |
| `text-decoration-thinkness` |        |                                                 | `html` | 文本装饰线粗细。     |
| `text-shadow-color`         |        |                                                 | 全部   | 文本阴影颜色。       |
| `text-shadow-opacity`       | 1      |                                                 | 全部   | 文本阴影不透明度。   |
| `text-shadow-x-offset`      | 0      |                                                 | 全部   | 文本阴影横向偏移。   |
| `text-shadow-y-offset`      | 0      |                                                 | 全部   | 文本阴影纵向偏移。   |
| `text-shadow-blur-radius`   | 0      |                                                 | `html` | 文本阴影模糊度半径。 |

> [!TIP]
> 支持动态参数值，更多细节详见示例。

> [!NOTE]
>
> 1. `em` 用作所有长度、宽度和尺寸的单位。
> 2. 颜色值应为 Hex 格式。
> 3. 不透明度值应介于 0 和 1 之间。
> 4. 所有小数值至多保留两位小数。

## 示例

示例文档代码详见：[example.qmd](example.qmd)。

## 版权

The MIT License (MIT)

Copyright (c) 2024 [范叶亮 | Leo Van](https://leovan.me)
