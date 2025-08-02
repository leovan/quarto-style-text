# Quarto Style Text Extension

![Release](https://img.shields.io/github/release/leovan/quarto-style-text.svg)
![License](https://img.shields.io/github/license/leovan/quarto-style-text.svg)
![Issues](https://img.shields.io/github/issues/leovan/quarto-style-text.svg)

---

🇺🇸 [README](README.md) | 🇨🇳 [中文说明](README.zh.md)

A Quarto extension to render style text for `html` and `pdf` document. It's based on [Divs and Spans](https://quarto.org/docs/authoring/markdown-basics.html#sec-divs-and-spans) with `.style-text` class.

> [!CAUTION]
> `pdflatex` PDF engine is not supported.

## Installing

```bash
quarto add leovan/quarto-style-text
```

This will install the extension under the `_extensions` subdirectory. If you're using version control, you will want to check in this directory.

## Using

Put this in the header of your document, or in the `_quarto.yml` file.

```yml
filters:
  - style-text
```

Parameters for this extension are listed as below:

| Parameter                   | Default | Options                                         | Format | Description                     |
| --------------------------- | ------- | ----------------------------------------------- | ------ | ------------------------------- |
| `color`                     |         |                                                 | All    | Text color.                     |
| `opacity`                   | 1       |                                                 | All    | Text opacity.                   |
| `font`                      |         |                                                 | All    | Text font.                      |
| `font-size`                 | 1       |                                                 | All    | Text font size.                 |
| `font-weight`               | normal  | normal<br/>middle<br/>bold                      | All    | Text font weight.               |
| `font-style`                | normal  | normal<br/>italic                               | All    | Text font style.                |
| `box-background-color`      |         |                                                 | All    | Box background color.           |
| `box-background-opacity`    | 1       |                                                 | All    | Box background opacity.         |
| `box-border-color`          |         |                                                 | All    | Box border color.               |
| `box-border-opacity`        | 1       |                                                 | All    | Box border opacity.             |
| `box-border-style`          | solid   | solid<br/>dashed<br/>dotted                     | All    | Box border line style.          |
| `box-border-width`          | 0       |                                                 | All    | Box border line width.          |
| `box-padding`               | 0       |                                                 | All    | Box padding.                    |
| `box-padding-top`           | 0       |                                                 | All    | Box top padding.                |
| `box-padding-right`         | 0       |                                                 | All    | Box right padding.              |
| `box-padding-bottom`        | 0       |                                                 | All    | Box bottom padding.             |
| `box-padding-left`          | 0       |                                                 | All    | Box left padding.               |
| `box-radius`                | 0       |                                                 | All    | Box radius.                     |
| `box-radius-top-left`       | 0       |                                                 | `html` | Box top left radius.            |
| `box-radius-top-right`      | 0       |                                                 | `html` | Box top right radius.           |
| `box-radius-bottom-right`   | 0       |                                                 | `html` | Box bottom right radius.        |
| `box-radius-bottom-left`    | 0       |                                                 | `html` | Box bottom left radius.         |
| `box-shadow-color`          |         |                                                 | All    | Box shadow color.               |
| `box-shadow-opacity`        | 1       |                                                 | All    | Box shadow opacity.             |
| `box-shadow-x-offset`       | 0       |                                                 | All    | Box shadow horizontal offset.   |
| `box-shadow-y-offset`       | 0       |                                                 | All    | Box shadow vertical offset.     |
| `box-shadow-blur-radius`    | 0       |                                                 | All    | Box shadow blur radius.         |
| `box-shadow-spread-radius`  | 0       |                                                 | `html` | Box shadow spread radius.       |
| `text-decoration-line`      |         | underline<br/>line-through                      | All    | Text decoration line type.      |
| `text-decoration-style`     | solid   | solid<br/>dashed<br/>dotted<br/>double<br/>wavy | All    | Text decoration line style.     |
| `text-decoration-color`     |         |                                                 | `html` | Text decoration line color.     |
| `text-decoration-thinkness` |         |                                                 | `html` | Text decoration line thinkness. |
| `text-shadow-color`         |         |                                                 | All    | Text shadow color.              |
| `text-shadow-opacity`       | 1       |                                                 | All    | Text shadow opacity.            |
| `text-shadow-x-offset`      | 0       |                                                 | All    | Text shadow horizontal offset.  |
| `text-shadow-y-offset`      | 0       |                                                 | All    | Text shadow vertical offset.    |
| `text-shadow-blur-radius`   | 0       |                                                 | `html`   | Text shadow blur radius.        |

> [!TIP]
> Dynamic parameter value is supported, for more details see example.

> [!NOTE]
>
> 1. `em` is used as unit for all length, width and size.
> 2. Color values should be in Hex format.
> 3. Opacity values should be between 0 and 1.
> 4. All decimal values should keep two decimal places at most.

## Example

Here is the source code for a minimal example: [example.qmd](example.qmd).

## License

The MIT License (MIT)

Copyright (c) 2024-2025 [范叶亮 | Leo Van](https://leovan.me)
