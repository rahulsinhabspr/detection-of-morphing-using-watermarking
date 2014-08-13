clear all
clc
close all
im=rgb2gray(imread('Lena.png'));
fig=rgb2gray(imread('gorila.jpg'));
im=imresize(im,[256 256]);
fig=imresize(fig,[256 256]);
imshow(im)
figure
imshow(fig)
s=size(im);
im1=zeros(s(1),s(2));
fig1=zeros(s(1),s(2));
for i=1:s(1)
    im1(i,:)=fft( im(i,:) );
    fig1(i,:)=fft( fig(i,:) );
end
im2=zeros(s(1),s(2));
for i=1:s(2)
    im2(:,i)=fft( im1(:,i) );
    fig2(:,i)=fft( fig1(:,i) );
end

[phase_im,mag_im]=cart2pol(real(im2),imag(im2));
[phase_fig,mag_fig]=cart2pol(real(fig2),imag(fig2));

[a,b]=pol2cart(phase_im, mag_fig);
im_phase=complex(a,b);

[a,b]=pol2cart(phase_fig, mag_im);
fig_phase=complex(a,b);

for i=1:s(2)
    im_f(:,i)=ifft( im_phase(:,i) );
    fig_f(:,i)=ifft( fig_phase(:,i) );
end

for i=1:s(1)
    im_final(i,:)=real(ifft( im_f(i,:) ));
    fig_final(i,:)=real(ifft( fig_f(i,:)));
end

im_final=im_final+abs(min(min(im_final)));
fig_final=fig_final+abs(min(min(fig_final)));

im_final=im_final-abs(min(min(im_final)));
fig_final=fig_final-abs(min(min(fig_final)));

im_final=im_final*255/max(max(im_final));
fig_final=fig_final*255/max(max(fig_final));
figure
imshow(int8(im_final))
figure
imshow(int8(fig_final))