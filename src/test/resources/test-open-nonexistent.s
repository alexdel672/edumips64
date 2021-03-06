; test-open-nonexistent.s - test file for EduMIPS64.
;
; Opens a non-existing file.
;
; (c) 2018 Andrea Spadaccini and the EduMIPS64 team
;
; This file is part of the EduMIPS64 project, and is released under the GNU
; General Public License.
; 
; This program is free software; you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation; either version 2 of the License, or
; (at your option) any later version.
; 
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
; 
; You should have received a copy of the GNU General Public License
; along with this program; if not, write to the Free Software
; Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
                  .data
  params_sys1:    .asciiz     "non-existent-file.txt"
                  .word64     0x1     ; O_RDONLY

                  .text
  open:           daddi       r14, r0, params_sys1
                  daddi       r2, r0, -1
                  syscall     1
                  bne         r1, r2, end

  error:          break
  end:            syscall 0
