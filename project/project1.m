inputimage=imread('rahul','jpg');
inputimage=rgb2gray(inputimage);
figure,imshow(inputimage);
fftofimage=fft2(inputimage);
a=abs(fftofimage(2));
amplitude=abs(fftofimage);
e=amplitude(2);
amplitude(2)=amplitude(2)*(.2);
c=size(amplitude);
d=amplitude(2);
ffti=abs(fftofimage).*exp(i*angle(fftofimage));
newimage=ifft2(ffti);
cmin = min(min(abs(newimage)));
cmax = max(max(abs(newimage)));
figure, imshow(abs(newimage), [cmin cmax]), colormap gray
secondinputimage=imread('photo','jpg');
secondinputimage=rgb2gray(secondinputimage);
fftofsecondimage=fft2(secondinputimage);
