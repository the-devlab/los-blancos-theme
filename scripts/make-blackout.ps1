# Regenerates themes/los-blancos-blackout-color-theme.json from the Navy theme.
# Run from anywhere:  powershell -File scripts/make-blackout.ps1
# Blackout = same code colours as Navy, with a near-black interface.

$dir  = Join-Path $PSScriptRoot '..\themes'
$text = [IO.File]::ReadAllText((Join-Path $dir 'los-blancos-navy-color-theme.json'))

# Navy surfaces -> near-black, bluish greys -> neutral greys (exact 6-digit values)
$swap = [ordered]@{
  '"#0B1B33"' = '"#0A0A0A"'
  '"#081428"' = '"#000000"'
  '"#0F2240"' = '"#121212"'
  '"#11264A"' = '"#161616"'
  '"#13284B"' = '"#1C1C1C"'
  '"#1C3358"' = '"#1F1F1F"'
  '"#1A2F52"' = '"#1A1A1A"'
  '"#34507D"' = '"#3A3A3A"'
  '"#24395E"' = '"#2A2A2A"'
  '"#0D1F3A"' = '"#0E0E0E"'
  '"#09172D"' = '"#080808"'
  '"#24406B"' = '"#2A2A2A"'
  '"#2A4470"' = '"#333333"'
  '"#E8EDF5"' = '"#E8E8E8"'
  '"#C9D4E5"' = '"#C8C8C8"'
  '"#8A9BB5"' = '"#9A9A9A"'
  '"#7388A6"' = '"#7A7A7A"'
  '"#4A5F80"' = '"#5A5A5A"'
  '"#5C7091"' = '"#6A6A6A"'
  '"#6B7F9E"' = '"#7A7A7A"'
}
foreach ($k in $swap.Keys) { $text = $text.Replace($k, $swap[$k]) }

# Blue used sparingly: dark club-blue status bar and tints, neutral selections
$set = [ordered]@{
  'name'                                   = 'Los Blancos Blackout'
  'statusBar.background'                   = '#002A57'
  'statusBar.foreground'                   = '#E8E8E8'
  'statusBar.border'                       = '#002A57'
  'statusBar.noFolderBackground'           = '#001C3A'
  'statusBarItem.hoverBackground'          = '#FFFFFF1A'
  'tab.activeBackground'                   = '#0B1626'
  'tab.activeBorder'                       = '#0B1626'
  'activityBar.activeBackground'           = '#0B1626'
  'selection.background'                   = '#FFFFFF33'
  'editor.selectionBackground'             = '#FFFFFF26'
  'editor.inactiveSelectionBackground'     = '#FFFFFF14'
  'list.activeSelectionBackground'         = '#FFFFFF1A'
  'list.focusOutline'                      = '#FFFFFF33'
  'editorSuggestWidget.selectedBackground' = '#FFFFFF1A'
  'quickInputList.focusBackground'         = '#FFFFFF1A'
  'menu.selectionBackground'               = '#FFFFFF1A'
  'scrollbarSlider.activeBackground'       = '#FFFFFF40'
  'minimap.selectionHighlight'             = '#FFFFFF40'
}
foreach ($k in $set.Keys) {
  $pattern = '("' + [regex]::Escape($k) + '":\s*)"[^"]*"'
  if ($text -notmatch $pattern) { throw "Key not found: $k" }
  $text = ([regex]$pattern).Replace($text, ('$1"' + $set[$k] + '"'), 1)
}

$out = Join-Path $dir 'los-blancos-blackout-color-theme.json'
[IO.File]::WriteAllText($out, $text, (New-Object Text.UTF8Encoding $false))
$null = $text | ConvertFrom-Json
"Wrote $out"
