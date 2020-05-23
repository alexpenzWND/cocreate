###
The `icons` content below is edited SVG from Font Awesome Free which is
licensed under CC BY 4.0.  See https://fontawesome.com/ and
https://creativecommons.org/licenses/by/4.0/, respectively.
###

icons =
  'pencil-alt-solid':
    '<path d="M497.9 142.1l-46.1 46.1c-4.7 4.7-12.3 4.7-17 0l-111-111c-4.7-4.7-4.7-12.3 0-17l46.1-46.1c18.7-18.7 49.1-18.7 67.9 0l60.1 60.1c18.8 18.7 18.8 49.1 0 67.9zM284.2 99.8L21.6 362.4.4 483.9c-2.9 16.4 11.4 30.6 27.8 27.8l121.5-21.3 262.6-262.6c4.7-4.7 4.7-12.3 0-17l-111-111c-4.8-4.7-12.4-4.7-17.1 0zM124.1 339.9c-5.5-5.5-5.5-14.3 0-19.8l154-154c5.5-5.5 14.3-5.5 19.8 0s5.5 14.3 0 19.8l-154 154c-5.5 5.5-14.3 5.5-19.8 0zM88 424h48v36.3l-64.5 11.3-31.1-31.1L51.7 376H88v48z"/>'

viewBox = ' viewBox="0 0 512 512"'

formatAttrs = (attrs) ->
  parts = []
  for key, value of attrs
    parts.push "#{key}=\"#{value}\""
  if parts.length
    ' ' + parts.join ' '
  else
    ''

## Add fill/stroke/etc. attributes to all <path> elements in icon
export modIcon = (icon, attrs) ->
  icon = icons[icon] if icon of icons
  icon.replace /<path\b/g, "$&#{formatAttrs attrs}"

## Wrap icon in <svg>...</svg> tag
export svgIcon = (icon, attrs) ->
  icon = icons[icon] if icon of icons
  """<svg xmlns="http://www.w3.org/2000/svg"#{viewBox}#{formatAttrs attrs}>#{icon}</svg>"""

## Icons as mouse cursors

cursorSize = 32

round = (frac) ->
  Math.round frac * (cursorSize-1)

export iconCursor = (dom, icon, xFrac, yFrac) ->
  svg = svgIcon icon,
    width: cursorSize
    height: cursorSize
  dom.style.cursor = "url(\"data:image/svg+xml,#{encodeURIComponent svg}\")
    #{round xFrac} #{round yFrac}, crosshair"