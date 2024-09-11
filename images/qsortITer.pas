program sort(input, output);

type index = 0..10;

var a : array [1..10] of integer;
    i : integer;

procedure NonRecursiveQuicksort;
   const m = 5;
   var i,j,l,r : index;
           x,w : integer;
             s : 0..m;
         stack : array [1..m] of record 
                                   l,r : index;
                                 end; { index stack }
   begin
      s := 1;
      stack[1].l := 1;
      stack[1].r := 10;
      repeat { take top request from stack }
         l := stack[s].l; r := stack[s].r; s := s - 1;
         repeat { partition a[l] to a[r] }
            i := l; j := r; x := a[(l+r) div 2];
            repeat
               while a[i] < x do i := i + 1;
               while x < a[j] do j := j - 1;
               if i <= j then
               begin
                  w := a[i]; a[i] := a[j]; a[j] := w;
                  i := i+1; j := j-1;
               end
            until i > j;
            if j-l < r-i then
            begin
               if i < r then { stack request to sort right partition }
               begin
                  s := s + 1; stack[s].l := i; stack[s].r := r 
               end;
               r := j; { now l and r delimit the left partition }
            end
            else
            begin
               if l < j then
               begin
                  s := s + 1; stack[s].l := l; stack[s].r := j 
               end;
               l := i;
            end;
         until l >= r;
      until s = 0;
   end;

begin
    for i := 1 to 10 do
        read(a[i]);

    NonRecursiveQuicksort;

    for i := 1 to 10 do
        writeln(a[i], ' ')
end.

              
