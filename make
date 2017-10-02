*
*  Linker
*

unset exit

Newer obj/linker linker.rez
if {status} != 0
   set exit on
   echo compile -e linker.rez keep=obj/linker
   compile -e linker.rez keep=obj/linker
   unset exit
end

if {#} == 0 then

   Newer obj/linker.a linker.asm linker.macros directPage
   if {Status} != 0
      set linker linker
   end

   Newer obj/util.a util.asm util.macros directPage
   if {Status} != 0
      set util util
   end

   Newer obj/file.a file.asm file.macros directPage
   if {Status} != 0
      set file file
   end

   Newer obj/pass1.a pass1.asm pass1.macros directPage
   if {Status} != 0
      set pass1 pass1
   end

   Newer obj/pass2.a pass2.asm pass2.macros directPage
   if {Status} != 0
      set pass2 pass2
   end

   Newer obj/seg.a seg.asm seg.macros directPage
   if {Status} != 0
      set seg seg
   end

   Newer obj/symbol.a symbol.asm symbol.macros directPage
   if {Status} != 0
      set symbol symbol
   end

   Newer obj/exp.a exp.asm exp.macros directPage
   if {Status} != 0
      set exp exp
   end

   Newer obj/out.a out.asm out.2 out.macros directPage
   if {Status} != 0
      set out out
   end

   set exit on

   for i in {linker} {util} {file} {pass1} {pass2} {seg} {symbol} {exp} {out}
      echo assemble +t +e {i}.asm
      assemble +t +e {i}.asm
   end

else

   set exit on

   for i
      echo assemble +t +e {i}.asm
      assemble +t +e {i}.asm
   end

end

linkit

set echo on
copy -c obj/linker 5
