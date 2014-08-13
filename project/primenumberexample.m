 disp('input apair of natural numbers, N and M with M>N');
 N=input('N=');
 M=input('M=');
  for j=0:(M-N) 
      Prime=1;
      for i=2:((N+j)/2)
          if mod((N+j),i)==0
              Prime=0; 
              break 
          end
      end
      if Prime==1
          disp('This is a Prime Number'); 
      else disp('Not Prime');
      end
  end
  
%   n = 101;
% numbers = 2: n;
% primes = [];
% for i = 1: length(numbers)
% if ~ numbers(i) == 0
% for j = i+1: length(numbers)
% if rem(numbers(j), numbers(i)) == 0
% numbers(j) = 0
% end
% end
% end
% if ~ numbers(i) == 0
% primes(length(primes) + 1) = numbers(i)
% end
% end
% primes 