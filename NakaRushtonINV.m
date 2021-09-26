function result = NakaRushtonINV(image)

image=im2double(image);

n=0.74;
semisat=0.18;

image=image./(1.-image);
image=image.^(1/n);
result=semisat.*image;
result=real(result);
