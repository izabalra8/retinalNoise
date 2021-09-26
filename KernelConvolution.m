function [result, result2]=KernelConvolution(image)

[r,c,chan]=size(image);

gamma=0.2;
beta=1;
alpha=abs(gamma);
sigma=max(r,c)/400;
c1=alpha+beta-gamma;
c2=gamma;

%%----Gaussian kernel w(x,y)----
kernel=fspecial('gaussian', [r,c], sigma);

%%----Convolve kernel with image
fft_kernel=real(fftshift(fft2(ifftshift(kernel))));
kernel_patent=fftshift(ifft2(ifftshift(1./(c1+c2.*(fft_kernel)))));
result=real(ifft2(fft2(ifftshift(kernel_patent)).*fft2(image)));

%%
kernel_inv=fftshift(ifft2(ifftshift(c1+c2.*(fft_kernel))));
result2=real(ifft2(fft2(ifftshift(kernel_inv)).*fft2(image)));


