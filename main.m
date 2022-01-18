function main()
%   main() generates an image with added texture, according to the selected parameters.
%
%   References:
%   Zabaleta, I., Cámara, M., Díaz, C., Canham, T., García, N., and Bertalmío, M. "Retinal Noise Emulation: 
%   A Novel Artistic Tool for Cinema That Also Improves Compression Efficiency. In IEEE Access, 8, 67263-67276, 2020.
% 
%   This code is property of Universitat Pompeu Fabra. 

img=imread('img\img.jpeg');

% Default parameters
sigmaC = 0.7;
sigmaS = 1.5;
a = 0.015;

result = retinalNoise(img, sigmaC, sigmaS, a);

imwrite(result, 'img/results/result.jpg', 'Quality', 100);
