function main()
%   main() generates a image with added texture, according to the selected parameters
%
%   References:
%   I. Zabaleta and M. Bertalmio, "Photorealistic Style Transfer for 
%   Video" % In Signal Processing: Image Communication, 2021.
% 
%   This code is property of Universitat Pompeu Fabra. 

img=imread('img\img.jpg');

% Default parameters

result = retinalNoise(img, );

imwrite(result, 'img/results/result.jpg', 'Quality', 100);
