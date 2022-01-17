function result = retinalNoise(image, sigmaC, sigmaS, a)

%retinal noise to be applied to each R,G and B channel separately

[r,c,chan]=size(image);

%linearize 
lum_1=image.^(2.2);
lum_2=NakaRushton(lum_1);

[lum_3,~]=KernelConvolution(lum_2);

%noise in retina
gaussianNoise=randn(r,c);
gaussianC=fspecial('Gaussian',250,sigmaC);
gaussianS=fspecial('Gaussian',250,sigmaS);
gaussian=gaussianC-gaussianS;
filteredGaussianNoise=imfilter(gaussianNoise,gaussian,'replicate');

%addition of noise in retina
lum_4=lum_3+a*filteredGaussianNoise;

[~,lum3]=KernelConvolution(lum_4);

lum2=NakaRushtonINV(lum3);

lum1=lum2.^(1/2.2);

result=lum1;
