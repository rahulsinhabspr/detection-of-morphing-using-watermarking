function a = decimal_to_binary(d)

i=1;

a=zeros(1,65);

while d >= 2

    r=rem(d,2);

    if r==1

        a(i)=1;

    else

        a(i)=0;

    end

    i=i+1;

    d=floor(d/2);

end

if d == 2

    a(i) = 0;

else

    a(i) = 1;

end
x=[a(16) a(15) a(14) a(13) a(12) a(11) a(10) a(9) a(8) a(7) a(6) a(5)]