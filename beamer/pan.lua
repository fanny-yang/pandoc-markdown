--[[
--I don't know lua, but this exists:
--https://learnxinyminutes.com/docs/lua/
--also just running 'lua' gives an interactive interpreter
--also https://pandoc.org/lua-filters.html
--
-- todo:
--  - more options on tcbitemize ? borders? backgrounds?
--  - tcb boxes?
--  - more visibility options?
--  - deal gracefully with beamer and latex potentially
--      including xcolor with some other options.
--      i don't want to mess with their templates, i feel
--      that's asking for it.  could instead minimal
--      sty for handout and slides and then \usepackage it
--      in the metadata?
--  - make code more succinct; i still don't know lua lol
--  - maybe allow individual tcbitemize grid elements
--      to have some distinct properties/attributes?
--      hmm, indeed, key ones are not ust only/hide, and
--      cosmetic stuff like color, but vertical/horizontal
--      alignment.  hmm. (further notes below.)
--
--]]

-- Transform a raw HTML element which contains only a `<br>`
-- into a format-indepentent line break.

function RawInline (el)
  if el.format:match '^html' and el.text:match '%<br ?/?%>' then
    return pandoc.LineBreak()
  end
end

function Span(s)
  local pfx = ''
  local sfx = ''
  local color = ''

  if FORMAT:match 'latex' or FORMAT == 'beamer' then
    for i, c in pairs(s.classes) do
      if c == 'B' then
        color = 'blue'
      elseif c == 'R' then
        color = 'Red'
      elseif c == 'CR' then
        color = 'Red!70!Black' --'Crimson'
      elseif c == 'P' then
        color = 'BlueViolet'
      elseif c == 'G' then
        color = 'ForestGreen'
      end
    end

    if color ~= '' then
      pfx = pfx .. '{\\textcolor{' .. color .. '}{'
      sfx = '}}' .. sfx
    end
  end

  for k, v in pairs(s.attributes) do
    if FORMAT == 'beamer' then
      if k == 'v' then
        pfx = '\\visible<' .. v .. '>{' .. pfx
        sfx = sfx .. '}'
      elseif k == 'o' then
        pfx = '\\only<' .. v .. '>{' .. pfx
        sfx = sfx .. '}'
      elseif k == 'a' then
        pfx = '{\\color<' .. v .. '>{blue}' .. pfx
        sfx = sfx .. '}'
      elseif k == 'f' then
        pfx = '{\\color<' .. v .. '>{black!15}' .. pfx
        sfx = sfx .. '}'
      end
    end
  end

  if pfx == '' then
    return s
  else
    return {
      pandoc.RawInline('latex', pfx),
      s,
      pandoc.RawInline('latex', sfx)
    }
  end
end

function CodeBlock(b)
  local latex = false

  for i, c in ipairs(b.classes) do
    if c == 'latex' then
      latex = true
    end
  end

  if latex then
    return pandoc.RawBlock('latex', b.text)
  else
    return b
  end
end

function Div(d)
  local tc = false
  local ctr = false

  for i, c in ipairs(d.classes) do
    if c == 'tc' then
       tc = true
       mode = 'tc'
    elseif c == 'center' then
       ctr = true
       mode = 'ctr'
    end
  end

  if mode == 'ctr' then
     local blocks = {}
     blocks[1] = pandoc.RawBlock('latex', '\\begin{center}')
     for i, c in ipairs(d.content) do
     	 blocks[#blocks + 1] = c
     end
     blocks[#blocks + 1] = pandoc.RawBlock('latex', '\\end{center}')
     return pandoc.Div(blocks)

  elseif mode == 'tc' then
    -- there's also the "empty" style i considered using?
    local props = [[ raster equal skip=0pt,raster column skip=0pt,
    raster equal height,
    boxsep=8pt,left=0pt,right=0pt,top=0pt,bottom=0pt,
    beamer hidden/.style={invisible,interior hidden,colframe=blue!20!gray!15},
    beamer alerted/.style={colframe=blue},
    sharp corners
    ]]

    local boxrule = '1pt'
    local colframe = 'white'
    local colback = 'white'
    for k, v in pairs(d.attributes) do
      if k == 'rows' then
        props = props .. ", raster rows = " .. v
      elseif k == 'cols' then
        props = props .. ", raster columns = " .. v
      elseif k == 'boxrule' then
        boxrule = v
      elseif k == 'colframe' then
        colframe =v
      elseif k == 'colback' then
        colback = v
      end
    end

    props = props .. string.format(", %s=%s, %s=%s, %s=%s",
                      'boxrule', boxrule,
                      'colframe', colframe,
                      'colback', colback
                      )

    local blocks = {}
    blocks[1] = pandoc.RawBlock('latex', '\\begin{tcbitemize}[' .. props .. ']')

    for i, c in ipairs(d.content) do
      --[[
      --\\tcbitem takes various parameters, in particular things like
      --only=<N>, alert=<N>, hide=<N>, and can thus be used to incrementally
      --introduce grids.
      --]]
      --still haven't incorporated wink out ...

      local tcb_str = '\\tcbitem'
      local cont = {}
      local el = {}

      for j, l in pairs(c.content) do
      	  --Span contains the option in attributes
      	  if l.t == 'Span' then
	             for b, sl in pairs(l.attributes) do
	     	          --v=x visible starting from slide x
	     	           if b == 'v' then
          		    --extracting first number
          		        sn = tonumber(string.match(sl, "%d+"))
          		        pn = tostring(math.floor(sn-1))
          		        tcb_str = '\\tcbitem[hide=<-' .. pn .. '>]'
          		       --a=x visible from slide x, alert on slide x
          		     elseif b == 'a' then
          		        sn = tonumber(string.match(sl, "%d+"))
          		        pn = tostring(math.floor(sn-1))
          		        tcb_str = '\\tcbitem[hide=<-' .. pn .. '>,alert=<' .. sn .. '>]'
          		     end
          	  end
         end
      end
      --print(tcb_str)
      blocks[#blocks + 1] = pandoc.RawBlock('latex', tcb_str)
      blocks[#blocks + 1] = c
    end
    blocks[#blocks + 1] = pandoc.RawBlock('latex', "\\end{tcbitemize}")
    return pandoc.Div(blocks) -- XXX can this cause an infinite loop ?? .. sadly no
  else
    return d
  end
end
