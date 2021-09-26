function result = NakaRushton(image)

image=im2double(image);

n=0.74;
semisat=0.18;

image=image.^n;
result=image./(image+semisat^n);
result=real(result);
