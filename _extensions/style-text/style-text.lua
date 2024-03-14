local function ensure_html_deps()
end

local function ensure_latex_deps()
  quarto.doc.use_latex_package("xcolor")
  quarto.doc.use_latex_package("tcolorbox", "most")
  quarto.doc.use_latex_package("ulem")
  quarto.doc.use_latex_package("shadowtext")
end

local function alpha_to_hex(alpha)
  return string.format("%02x", math.floor((alpha * 255 + 0.5)))
end

local function em_to_mm(em)
  return em * 0.3514598035146
end

local function html_style(attributes)
  local color = ""
  if attributes["color"] then
    color = "color: " .. attributes["color"] .. ";"
  end

  local opacity = ""
  if attributes["opacity"] then
    opacity = "opacity: " .. tonumber(attributes["opacity"]) .. ";"
  end

  local font = ""
  if attributes["font"] then
    font = "font-family: '" .. attributes["font"] .. "';"
  end

  local font_size = ""
  if attributes["font-size"] then
    font_size = "font-size: " .. tonumber(attributes["font-size"]) .. "em;"
  end

  local font_weight = ""
  if attributes["font-weight"] then
    font_weight = "font-weight: " .. attributes["font-weight"] .. ";"
  end

  local font_style = ""
  if attributes["font-style"] then
    font_style = "font-style: " .. attributes["font-style"] .. ";"
  end

  -- box bacground
  local box_background_color = ""
  local box_background_opacity_hex = "ff"
  if attributes["box-background-opacity"] then
    box_background_opacity_hex = alpha_to_hex(tonumber(attributes["box-background-opacity"]))
  end
  if attributes["box-background-color"] then
    box_background_color = "background-color: " .. attributes["box-background-color"] .. box_background_opacity_hex .. ";"
  end

  -- box border
  local box_border_color = ""
  local box_border_opacity_hex = "ff"
  if attributes["box-border-opacity"] then
    box_border_opacity_hex = alpha_to_hex(tonumber(attributes["box-border-opacity"]))
  end
  if attributes["box-border-color"] then
    box_border_color = "border-color: " .. attributes["box-border-color"] .. box_border_opacity_hex .. ";"
  end

  local box_border_style = ""
  if attributes["box-border-style"] then
    box_border_style = "border-style: " .. attributes["box-border-style"] .. ";"
  end

  local box_border_width = ""
  if attributes["box-border-width"] then
    box_border_width = "border-width: " .. tonumber(attributes["box-border-width"]) .. "em;"
  end

  -- box padding
  local box_padding = ""
  if attributes["box-padding"] then
    box_padding = "padding: " .. tonumber(attributes["box-padding"]) .. "em;"
  end

  local box_padding_top = ""
  local box_padding_right = ""
  local box_padding_bottom = ""
  local box_padding_left = ""
  if attributes["box-padding-top"] then
    box_padding_top = "padding-top: " .. tonumber(attributes["box-padding-top"]) .. "em;"
  end
  if attributes["box-padding-right"] then
    box_padding_right = "padding-right: " .. tonumber(attributes["box-padding-right"]) .. "em;"
  end
  if attributes["box-padding-bottom"] then
    box_padding_bottom = "padding-bottom: " .. tonumber(attributes["box-padding-bottom"]) .. "em;"
  end
  if attributes["box-padding-left"] then
    box_padding_left = "padding-left: " .. tonumber(attributes["box-padding-left"]) .. "em;"
  end

  -- box radius
  local box_radius = ""
  if attributes["box-radius"] then
    box_radius = "border-radius: " .. tonumber(attributes["box-radius"]) .. "em;"
  end

  local box_radius_top_left = ""
  local box_radius_top_right = ""
  local box_radius_bottom_right = ""
  local box_radius_bottom_left = ""
  if attributes["box-radius-top-left"] then
    box_radius_top_left = "border-top-left-radius: " .. tonumber(attributes["box-radius-top-left"]) .. "em " .. tonumber(attributes["box-radius-top-left"]) .. "em;"
  end
  if attributes["box-radius-top-right"] then
    box_radius_top_right = "border-top-right-radius: " .. tonumber(attributes["box-radius-top-right"]) .. "em " .. tonumber(attributes["box-radius-top-right"]) .. "em;"
  end
  if attributes["box-radius-bottom-right"] then
    box_radius_bottom_right = "border-bottom-right-radius: " .. tonumber(attributes["box-radius-bottom-right"]) .. "em " .. tonumber(attributes["box-radius-bottom-right"]) .. "em;"
  end
  if attributes["box-radius-bottom-left"] then
    box_radius_bottom_left = "border-bottom-left-radius: " .. tonumber(attributes["box-radius-bottom-left"]) .. "em " .. tonumber(attributes["box-radius-bottom-left"]) .. "em;"
  end

  -- box shadow
  local box_shadow_color = ""
  local box_shadow_opacity_hex = "ff"
  if attributes["box-shadow-opacity"] then
    box_shadow_opacity_hex = alpha_to_hex(tonumber(attributes["box-shadow-opacity"]))
  end
  if attributes["box-shadow-color"] then
    box_shadow_color = attributes["box-shadow-color"] .. box_shadow_opacity_hex
  end

  local box_shadow_x_offset = "0em"
  local box_shadow_y_offset = "0em"
  if attributes["box-shadow-x-offset"] then
    box_shadow_x_offset = tonumber(attributes["box-shadow-x-offset"]) .. "em"
  end
  if attributes["box-shadow-y-offset"] then
    box_shadow_y_offset = tonumber(attributes["box-shadow-y-offset"]) .. "em"
  end

  local box_shadow_blur_radius = "0em"
  local box_shadow_spread_radius = "0em"
  if attributes["box-shadow-blur-radius"] then
    box_shadow_blur_radius = tonumber(attributes["box-shadow-blur-radius"]) .. "em"
  end
  if attributes["box-shadow-spread-radius"] then
    box_shadow_spread_radius = tonumber(attributes["box-shadow-spread-radius"]) .. "em"
  end
  local box_shadow = ""
  if attributes["box-shadow-color"] then
    box_shadow = (
      "box-shadow: "
      .. box_shadow_x_offset
      .. " "
      .. box_shadow_y_offset
      .. " "
      .. box_shadow_blur_radius
      .. " "
      .. box_shadow_spread_radius
      .. " "
      .. box_shadow_color
      .. ";"
    )
  end

  -- text decoration
  local text_decoration_line = ""
  if attributes["text-decoration-line"] then
    text_decoration_line = "text-decoration-line: " .. attributes["text-decoration-line"] .. ";"
  end

  local text_decoration_style = ""
  if attributes["text-decoration-style"] then
    text_decoration_style = "text-decoration-style: " .. attributes["text-decoration-style"] .. ";"
  end

  local text_decoration_color = ""
  if attributes["text-decoration-color"] then
    text_decoration_color = "text-decoration-color: " .. attributes["text-decoration-color"] .. ";"
  end

  local text_decoration_thickness = ""
  if attributes["text-decoration-thickness"] then
    text_decoration_thickness = "text-decoration-thickness: " .. tonumber(attributes["text-decoration-thickness"]) .. "em;"
  end

  -- text shadow
  local text_shadow_color = ""
  local text_shadow_opacity_hex = "ff"
  if attributes["text-shadow-opacity"] then
    text_shadow_opacity_hex = alpha_to_hex(tonumber(attributes["text-shadow-opacity"]))
  end
  if attributes["text-shadow-color"] then
    text_shadow_color = attributes["text-shadow-color"] .. text_shadow_opacity_hex
  end

  local text_shadow_x_offset = "0em"
  local text_shadow_y_offset = "0em"
  if attributes["text-shadow-x-offset"] then
    text_shadow_x_offset = tonumber(attributes["text-shadow-x-offset"]) .. "em"
  end
  if attributes["text-shadow-y-offset"] then
    text_shadow_y_offset = tonumber(attributes["text-shadow-y-offset"]) .. "em"
  end

  local text_shadow_blur_radius = "0em"
  if attributes["text-shadow-blur-radius"] then
    text_shadow_blur_radius = tonumber(attributes["text-shadow-blur-radius"]) .. "em"
  end
  local text_shadow = ""
  if attributes["text-shadow-color"] then
    text_shadow = (
      "text-shadow: "
      .. text_shadow_x_offset
      .. " "
      .. text_shadow_y_offset
      .. " "
      .. text_shadow_blur_radius
      .. " "
      .. text_shadow_color
      .. ";"
    )
  end

  local style = (
    color
    .. opacity
    .. font
    .. font_size
    .. font_weight
    .. font_style
    .. box_background_color
    .. box_border_color
    .. box_border_style
    .. box_border_width
    .. box_padding
    .. box_padding_top
    .. box_padding_right
    .. box_padding_bottom
    .. box_padding_left
    .. box_radius
    .. box_radius_top_left
    .. box_radius_top_right
    .. box_radius_bottom_right
    .. box_radius_bottom_left
    .. box_shadow
    .. text_decoration_style
    .. text_decoration_line
    .. text_decoration_color
    .. text_decoration_thickness
    .. text_shadow
  )

  return style
end

local function render_style_text_html(global_options)
  local function filter_html(el, style_text_el_type, global_options)
    local style_text_el = pandoc.Div(el.content)
    if style_text_el_type == "span" then
      style_text_el = pandoc.Span(el.content)
    end

    style_text_el.attr.classes = el.attr.classes
    style_text_el.attr.attributes.style = html_style(el.attr.attributes)

    return style_text_el
  end

  local filter = {
    Div = function(el)
      if el.attr.classes:includes("style-text") then
        global_options.style_text_current_index = global_options.style_text_current_index + 1
        return filter_html(el, "div", global_options)
      else
        return el
      end
    end,
    Span = function(el)
      if el.attr.classes:includes("style-text") then
        global_options.style_text_current_index = global_options.style_text_current_index + 1
        return filter_html(el, "span", global_options)
      else
        return el
      end
    end
  }

  return filter
end

function include_in_header_latex()
  quarto.doc.include_text("in-header", [[
    \makeatletter
    \newcommand*\styletextbasesize{\dimexpr\f@size pt \relax}
    \makeatother

    \AtBeginDocument{\colorlet{style-text-color}{.}}
    \AtBeginDocument{\colorlet{style-text-box-border-color}{.}}
    \AtBeginDocument{\colorlet{style-text-box-background-color}{white}}
    \AtBeginDocument{\colorlet{style-text-box-shadow-color}{.}}
    \AtBeginDocument{\colorlet{style-text-text-shadow-color}{.}}
  ]])
end

function latex_style(el, style_text_el_type, global_options)
  local style_prefix = ""
  local style_suffix = ""
  local attributes = el.attr.attributes

  -- box
  if attributes["box-border-color"] or attributes["box-background-color"] then
    -- box background
    local box_background_color_define = ""
    if attributes["box-background-color"] then
      box_background_color_define = string.format("\\definecolor{style-text-box-background-color}{HTML}{%s}", string.gsub(attributes["box-background-color"], "#", ""))
      style_prefix = style_prefix .. box_background_color_define
    end
    local box_background_color = ",colframe=style-text-box-background-color"

    local box_background_opacity = ""
    if attributes["box-background-opacity"] then
      box_background_opacity = string.format(",opacityback=%f", tonumber(attributes["box-background-opacity"]))
    end

    -- box border
    local box_border_color_define = ""
    if attributes["box-border-color"] then
      box_border_color_define = string.format("\\definecolor{style-text-box-border-color}{HTML}{%s}", string.gsub(attributes["box-border-color"], "#", ""))
      style_prefix = style_prefix .. box_border_color_define
    end

    local box_border_opacity = 100
    if attributes["box-border-opacity"] then
      box_border_opacity = tonumber(attributes["box-border-opacity"]) * 100
    end

    local box_border_width = "0.1em"
    if attributes["box-border-width"] then
      box_border_width = tonumber(attributes["box-border-width"]) .. "em"
    end

    local box_border_style = "solid"
    if attributes["box-border-style"] then
      box_border_style = attributes["box-border-style"];
    end

    local box_border = string.format(",borderline={%s}{0em}{style-text-box-border-color!%d,%s}", box_border_width, box_border_opacity, box_border_style)

    -- box padding
    local box_padding = "0em"
    if attributes["box-padding"] then
      box_padding = tonumber(attributes["box-padding"]) .. "em"
    end
    local box_padding_top = box_padding
    local box_padding_right = box_padding
    local box_padding_bottom = box_padding
    local box_padding_left = box_padding
    if attributes["box-padding-top"] then
      box_padding_top = tonumber(attributes["box-padding-top"]) .. "em"
    end
    if attributes["box-padding-right"] then
      box_padding_right = tonumber(attributes["box-padding-right"]) .. "em"
    end
    if attributes["box-padding-bottom"] then
      box_padding_bottom = tonumber(attributes["box-padding-bottom"]) .. "em"
    end
    if attributes["box-padding-left"] then
      box_padding_left = tonumber(attributes["box-padding-left"]) .. "em"
    end
    box_padding_top = ",top=" .. box_padding_top
    box_padding_right = ",right=" .. box_padding_right
    box_padding_bottom = ",bottom=" .. box_padding_bottom
    box_padding_left = ",left=" .. box_padding_left

    -- box radius
    local box_radius = "0em"
    if attributes["box-radius"] then
      box_radius = tonumber(attributes["box-radius"]) .. "em"
    end
    box_radius = ",arc=" .. box_radius

    -- box shadow
    local box_shadow_color_define = ""
    if attributes["box-shadow-color"] then
      box_shadow_color_define = string.format("\\definecolor{style-text-box-shadow-color}{HTML}{%s}", string.gsub(attributes["box-shadow-color"], "#", ""))
      style_prefix = style_prefix .. box_shadow_color_define
    end

    local box_shadow_opacity = 100
    if attributes["box-shadow-opacity"] then
      box_shadow_opacity = tonumber(attributes["box-shadow-opacity"]) * 100
    end

    local box_shadow_x_offset = "0em"
    local box_shadow_y_offset = "0em"
    if attributes["box-shadow-x-offset"] then
      box_shadow_x_offset = tonumber(attributes["box-shadow-x-offset"]) .. "em"
    end
    if attributes["box-shadow-y-offset"] then
      box_shadow_y_offset = tonumber(attributes["box-shadow-y-offset"]) * -1 .. "em"
    end

    local box_shadow_blur_radius = "0mm"
    if attributes["box-shadow-blur-radius"] then
      box_shadow_blur_radius = em_to_mm(tonumber(attributes["box-shadow-blur-radius"])) .. "mm"
    end

    local box_shadow = string.format(",fuzzy shadow={%s}{%s}{0em}{%s}{style-text-box-shadow-color!%d}", box_shadow_x_offset, box_shadow_y_offset, box_shadow_blur_radius, box_shadow_opacity)

    -- span only options
    local box_span_options = ""
    if style_text_el_type == "span" then
      box_span_options = (
        ",nobeforeafter"
        .. ",on line"
      )
    end

    local box_options = (
      "[enhanced"
      .. ",colframe=white!0"
      .. ",opacityframe=0em"
      .. ",boxrule=0em"
      .. box_background_color
      .. box_background_opacity
      .. box_border
      .. box_padding_top
      .. box_padding_right
      .. box_padding_bottom
      .. box_padding_left
      .. box_radius
      .. box_shadow
      .. box_span_options
      .. "]"
    )

    if style_text_el_type == "span" then
      style_prefix = "\\tcbox" .. box_options .. "{"
      style_suffix = "}" .. style_suffix
    else
      style_prefix = "\\begin{tcolorbox}" .. box_options .. "\n"
      style_suffix = "\n\\end{tcolorbox}" .. style_suffix
    end
  end

  local color_define = ""
  local opacity = 100
  if attributes["opacity"] then
    opacity = tonumber(attributes["opacity"]) * 100
  end
  if attributes["color"] then
    color_define = string.format("\\definecolor{style-text-color}{HTML}{%s}", string.gsub(attributes["color"], "#", ""))
  end
  local color = string.format("%s\\color{style-text-color!%d}", color_define, opacity)
  style_prefix = style_prefix .. "{" .. color
  style_suffix = "}" .. style_suffix

  if attributes["font"] then
    local font_name = "\\styletextfont"
    local font_define = string.format("\\newfontfamily{%s}{%s}", font_name, attributes["font"])
    local font = string.format("%s%s", font_define, font_name)

    style_prefix = style_prefix .. "{" .. font
    style_suffix = "}" .. style_suffix
  end

  if attributes["font-size"] then
    local font_size = string.format("\\fontsize{%fem}{\\baselineskip}\\selectfont", tonumber(attributes["font-size"]))
    style_prefix = style_prefix .. "{" .. font_size
    style_suffix = "}" .. style_suffix
  end

  if attributes["font-weight"] then
    local font_weight_command = ""
    if attributes["font-weight"] == "middle" then
      font_weight_command = "\\mdseries"
    elseif attributes["font-weight"] == "bold" then
      font_weight_command = "\\bfseries"
    end

    style_prefix = style_prefix .. "{" .. font_weight_command
    style_suffix = "}" .. style_suffix
  end

  if attributes["font-style"] then
    local font_style_command = ""
    if attributes["font-style"] == "italic" then
      font_style_command = "\\itshape"
    end

    style_prefix = style_prefix .. "{" .. font_style_command
    style_suffix = "}" .. style_suffix
  end

  -- text decoration
  if attributes["text-decoration-line"] then
    local text_decoration_line_command = "\\uline"

    if attributes["text-decoration-line"] == "underline" then
      if attributes["text-decoration-style"] then
        if attributes["text-decoration-style"] == "double" then
          text_decoration_line_command = "\\uuline"
        elseif attributes["text-decoration-style"] == "dotted" then
          text_decoration_line_command = "\\dotuline"
        elseif attributes["text-decoration-style"] == "dashed" then
          text_decoration_line_command = "\\dashuline"
        elseif attributes["text-decoration-style"] == "wavy" then
          text_decoration_line_command = "\\uwave"
        end
      end
    elseif attributes["text-decoration-line"] == "line-through" then
      text_decoration_line_command = "\\sout"
    end

    style_prefix = style_prefix .. text_decoration_line_command .. "{"
    style_suffix = "}" .. style_suffix
  end

  -- text shadow
  local text_shadow_opacity = 100
  local text_shadow_color_define = ""
  if attributes["text-shadow-color"] then
    text_shadow_color_define = string.format("\\definecolor{style-text-text-shadow-color}{HTML}{%s}", string.gsub(attributes["text-shadow-color"], "#", ""))
    style_prefix = style_prefix .. text_shadow_color_define

    if attributes["text-shadow-opacity"] then
      text_shadow_opacity = tonumber(attributes["text-shadow-opacity"]) * 100
    end
    style_prefix = style_prefix .. string.format("\\shadowcolor{style-text-text-shadow-color!%d}", text_shadow_opacity)
  end

  local text_shadow_x_offset = "0em"
  local text_shadow_y_offset = "0em"
  if attributes["text-shadow-x-offset"] then
    text_shadow_x_offset = tonumber(attributes["text-shadow-x-offset"]) .. "em"
    style_prefix = style_prefix .. string.format("\\shadowoffsetx{%s}", text_shadow_x_offset)
  end
  if attributes["text-shadow-y-offset"] then
    text_shadow_y_offset = tonumber(attributes["text-shadow-y-offset"]) .. "em"
    style_prefix = style_prefix .. string.format("\\shadowoffsety{%s}", text_shadow_y_offset)
  end

  if attributes["text-shadow-color"] then
    style_prefix = "\\shadowtext{" .. style_prefix
    style_suffix = "}" .. style_suffix
  end

  return {
    prefix = style_prefix,
    suffix = style_suffix,
  }
end

local function render_style_text_latex(global_options)
  local function filter_latex(el, style_text_el_type, global_options)
    local style = latex_style(el, style_text_el_type, global_options)

    return {
      pandoc.RawInline("latex", style.prefix),
      el,
      pandoc.RawInline("latex", style.suffix),
    }
  end

  local filter = {
    Div = function(el)
      if el.attr.classes:includes("style-text") then
        global_options.style_text_current_index = global_options.style_text_current_index + 1
        return filter_latex(el, "div", global_options)
      else
        return el
      end
    end,
    Span = function(el)
      if el.attr.classes:includes("style-text") then
        global_options.style_text_current_index = global_options.style_text_current_index + 1
        return filter_latex(el, "span", global_options)
      else
        return el
      end
    end
  }

  return filter
end

local function render_style_text(global_options)
  local filter = {}

  if quarto.doc.is_format("html") then
    ensure_html_deps()
    filter = render_style_text_html(global_options)
  elseif quarto.doc.is_format("latex") then
    ensure_latex_deps()
    include_in_header_latex()
    filter = render_style_text_latex(global_options)
  end

  return filter
end

function Pandoc(doc)
  local global_options = {
    style_text_current_index = 0
  }

  return doc:walk(render_style_text(global_options))
end
