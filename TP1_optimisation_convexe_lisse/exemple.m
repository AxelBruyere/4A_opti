%     Ex 3 (2D):
    clear all;
    close all;
    
      im = im2double(imread('cameraman.tif'));
      H  = matH(size(im),'gaussian',5);

      im_blur = reshape(H*im(:),size(im));

      figure(3); clf;
      subplot(121); imshow(im,[]);      title('image originale');
      subplot(122); imshow(im_blur,[]); title('image floutée');