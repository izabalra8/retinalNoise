function result = retinalNoise2(image, sigmaC, sigmaS, a)

%retinal noise to be applied to each R,G and B channel separately

[r,c,chan]=size(image);

%%----amount of noise----

lum_1=image.^(2.2);
lum_2=NakaRushton(lum_1);

[lum_3,~]=KernelConvolution(lum_2);

gaussianNoise=randn(r,c);

gaussianC=fspecial('Gaussian',250,sigmaC);
gaussianS=fspecial('Gaussian',250,sigmaS);

gaussian=gaussianC-gaussianS;
% gaussian=gaussianC;

filteredGaussianNoise=imfilter(gaussianNoise,gaussian,'replicate');

lum_4=lum_3+a*filteredGaussianNoise;


[~,lum3]=KernelConvolution(lum_4);

lum2=NakaRushtonINV(lum3);

lum1=lum2.^(1/2.2);

result=lum1;
