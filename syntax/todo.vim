" File:        todo.txt.vim
" Description: Todo.txt syntax settings
" Author:      Leandro Freitas <freitass@gmail.com>
" License:     Vim license
" Website:     http://github.com/freitass/todo.txt-vim
" Version:     0.3

if exists("b:current_syntax")
    finish
endif

syntax  match  TodoDone       '^[xX]\s.\+$'               contains=TodoDate,TodoProject,TodoContext
syntax  match  TodoPriorityA  '^([aA])\s.\+$'             contains=TodoDate,TodoProject,TodoContext
syntax  match  TodoPriorityB  '^([bB])\s.\+$'             contains=TodoDate,TodoProject,TodoContext
syntax  match  TodoPriorityC  '^([cC])\s.\+$'             contains=TodoDate,TodoProject,TodoContext
syntax  match  TodoPriorityD  '^([dD])\s.\+$'             contains=TodoDate,TodoProject,TodoContext
syntax  match  TodoPriorityE  '^([eE])\s.\+$'             contains=TodoDate,TodoProject,TodoContext
syntax  match  TodoPriorityF  '^([fF])\s.\+$'             contains=TodoDate,TodoProject,TodoContext
syntax  match  TodoPriorityG  '^([gG])\s.\+$'             contains=TodoDate,TodoProject,TodoContext
syntax  match  TodoPriorityH  '^([hH])\s.\+$'             contains=TodoDate,TodoProject,TodoContext
syntax  match  TodoPriorityI  '^([iI])\s.\+$'             contains=TodoDate,TodoProject,TodoContext
syntax  match  TodoPriorityJ  '^([jJ])\s.\+$'             contains=TodoDate,TodoProject,TodoContext
syntax  match  TodoPriorityK  '^([kK])\s.\+$'             contains=TodoDate,TodoProject,TodoContext
syntax  match  TodoPriorityL  '^([lL])\s.\+$'             contains=TodoDate,TodoProject,TodoContext
syntax  match  TodoPriorityM  '^([mM])\s.\+$'             contains=TodoDate,TodoProject,TodoContext
syntax  match  TodoPriorityN  '^([nN])\s.\+$'             contains=TodoDate,TodoProject,TodoContext
syntax  match  TodoPriorityO  '^([oO])\s.\+$'             contains=TodoDate,TodoProject,TodoContext
syntax  match  TodoPriorityP  '^([pP])\s.\+$'             contains=TodoDate,TodoProject,TodoContext
syntax  match  TodoPriorityQ  '^([qQ])\s.\+$'             contains=TodoDate,TodoProject,TodoContext
syntax  match  TodoPriorityR  '^([rR])\s.\+$'             contains=TodoDate,TodoProject,TodoContext
syntax  match  TodoPriorityS  '^([sS])\s.\+$'             contains=TodoDate,TodoProject,TodoContext
syntax  match  TodoPriorityT  '^([tT])\s.\+$'             contains=TodoDate,TodoProject,TodoContext
syntax  match  TodoPriorityU  '^([uU])\s.\+$'             contains=TodoDate,TodoProject,TodoContext
syntax  match  TodoPriorityV  '^([vV])\s.\+$'             contains=TodoDate,TodoProject,TodoContext
syntax  match  TodoPriorityW  '^([wW])\s.\+$'             contains=TodoDate,TodoProject,TodoContext
syntax  match  TodoPriorityX  '^([xX])\s.\+$'             contains=TodoDate,TodoProject,TodoContext
syntax  match  TodoPriorityY  '^([yY])\s.\+$'             contains=TodoDate,TodoProject,TodoContext
syntax  match  TodoPriorityZ  '^([zZ])\s.\+$'             contains=TodoDate,TodoProject,TodoContext
syntax  match  TodoDate       '\d\{2,4\}-\d\{2\}-\d\{2\}' contains=NONE
syntax  match  TodoProject    '\(^\|\W\)+[^[:blank:]]\+'  contains=NONE
syntax  match  TodoContext    '\(^\|\W\)@[^[:blank:]]\+'  contains=NONE

" Future Threshold Begin
" Will vim be around in 8,000 years?
let s:future_threshold_begin = 'syntax match TodoFutureThreshold  ''^.*[tT]:'
let s:future_threshold_end = '.*$'' contains=NONE'

let s:year = strftime('%Y')
let s:month = strftime('%m')
let s:year0 = str2nr(strpart(strftime('%Y'), 0, 1))
let s:year1 = str2nr(strpart(strftime('%Y'), 1, 1))
let s:year2 = str2nr(strpart(strftime('%Y'), 2, 1))
let s:year3 = str2nr(strpart(strftime('%Y'), 3, 1))
let s:month0 = str2nr(strpart(strftime('%m'), 0, 1))
let s:month1 = str2nr(strpart(strftime('%m'), 1, 1))
let s:day0 = str2nr(strpart(strftime('%d'), 0, 1))
let s:day1 = str2nr(strpart(strftime('%d'), 1, 1))

function s:HigherNumberRegex(n)
if a:n == 8
  return '9'
elseif a:n < 8
  return '[' . string(a:n + 1) . '-9]'
else
  echoerr 'No numbers higher than 9'
endif
endfunction

if s:day1 < 9
  let s:m_day1 = s:HigherNumberRegex(s:day1)
  execute s:future_threshold_begin
      \ .s:year . '-' .s:month . '-' . string(s:day0) . s:m_day1
      \ . s:future_threshold_end
endif

if s:day0 < 9
  let s:m_day0 = s:HigherNumberRegex(s:day0)
  execute s:future_threshold_begin
        \ .s:year . '-' .s:month . '-' . s:m_day0 . '\d'
        \ . s:future_threshold_end
endif

if s:month1 < 9
  let s:m_month1 = s:HigherNumberRegex(s:month1)
  execute s:future_threshold_begin
        \ .s:year . '-' .string(s:month0) . s:m_month1 . '-\d\d'
        \ . s:future_threshold_end
endif

if s:month0 < 9
  let s:m_month0 = s:HigherNumberRegex(s:month0)
  execute s:future_threshold_begin
        \ .s:year . '-' . s:m_month0 . '\d-\d\d'
        \ . s:future_threshold_end
endif

if s:year3 < 9
  let s:m_year3 = s:HigherNumberRegex(s:year3)
  execute s:future_threshold_begin
        \ .string(s:year0) . string(s:year1) . string(s:year2) . s:m_year3 . '-\d\d-\d\d'
        \ . s:future_threshold_end
endif

if s:year2 < 9
  let s:m_year2 = s:HigherNumberRegex(s:year2)
  execute s:future_threshold_begin
        \ .string(s:year0) . string(s:year1) . s:m_year2 . '\d-\d\d-\d\d'
        \ . s:future_threshold_end
endif

if s:year1 < 9
  let s:m_year1 = s:HigherNumberRegex(s:year1)
  execute s:future_threshold_begin
        \ .string(s:year0) . s:m_year1 . '\d\d-\d\d-\d\d'
        \ . s:future_threshold_end
endif

if s:year0 < 9
  let s:m_year0 = s:HigherNumberRegex(s:year0)
  execute s:future_threshold_begin
        \ . s:m_year0 . '\d\d\d-\d\d-\d\d'
        \ . s:future_threshold_end
endif

unlet s:future_threshold_begin s:future_threshold_end s:year s:year3 s:year2 s:year1 s:year0 s:month s:month1 s:month0 s:day1 s:day0
delfunction s:HigherNumberRegex
if exists('s:m_day1') | unlet s:m_day1 | endif
if exists('s:m_day0') | unlet s:m_day0 | endif
if exists('s:m_month1') | unlet s:m_month1 | endif
if exists('s:m_month0') | unlet s:m_month0 | endif
if exists('s:m_year3') | unlet s:m_year3 | endif
if exists('s:m_year2') | unlet s:m_year2 | endif
if exists('s:m_year1') | unlet s:m_year1 | endif
if exists('s:m_year0') | unlet s:m_year0 | endif
" Future Threshold End

" Other priority colours might be defined by the user
highlight  default  link  TodoDone       Comment
highlight  default  link  TodoPriorityA  Constant
highlight  default  link  TodoPriorityB  Statement
highlight  default  link  TodoPriorityC  Identifier
highlight  default  link  TodoDate       PreProc
highlight  default  link  TodoProject    Special
highlight  default  link  TodoContext    Special
highlight  default  link  TodoFutureThreshold Todo

let b:current_syntax = "todo"
