clear all; clc;
% add path for requesting functions
addpath(genpath('\3d_matlab_interpolation'));
      disp( sprintf( 'Start image reading') )
%       image reading
img = sar_readpds('adiri.cub');
      img(img<=0)=0;
      % % % % % % % % %     set name for exported figures   % % % % % % % % % 

      name='belet'
      
    type='.png' 
   % % %           % % %           % % %           % % %           % % % 
   % % % % % % % %       image rotation 	% % % % % % % % 
    B = flipdim(img ,1);           %# vertical flip
    I = imrotate(B,-90);
   % % % % % % % % %  smoothing factor    % % % % % % % % % % %  
                      smoothing_factor= 50
   % % % % % % % % %  cv matrix dimensions    % % % % % % % % % % %  
                      grid_size= 10;
                 
   % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % % % % % % %    IMAGE FALSECOLORING   % % % % % % % % % % % % % % %

 disp( sprintf( 'START IMAGE FALSECOLORING') )
    disp( sprintf( 'compute stats') )
     S1 = std(I(:)) ;
    M1 = mean(I(:));
    minI1=min(I(:));
    maxI1=max(I(:));
    k1=M1+4*S1;
    fig1=figure(1);
    imshow(I)
  disp( sprintf( 'print image') )
   fig2=figure(2); 
   set (fig2, 'Units', 'normalized', 'outerposition', [0,0,1,1]);
 imshow(I)
   colormap jet;                    %  color map.
% p=get(gca,'position'); % save position
c = colorbar('EastOutside'); 
  omega=get(c,'Position');
    omega(1)=(omega(1))*1.05;
      omega(2)=(omega(2))*2;
        omega(3)=(omega(3))*0.5;
            omega(4)=(omega(4))*0.5;
  set(c,'Position',omega)
% set(gca,'position',p); % restore position
caxis([0 k1])
disp( sprintf( 'save image') )
export_fig false_color -native
file1='false_color.png';
  file=['false_color_',name,type];
movefile(file1,file);
  
     pause(1);
     delete(c);
     disp( sprintf( 'save image') )
export_fig false_color -native


   % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % % % % % % %    ROUGHNESS EXPORTATION   % % % % % % % % % % % % % % %
 disp( sprintf( 'START ROUGHNESS EXPORTATION') )

% export general statistics
size_s=size(I,1);
size_l=size(I,2);
mean_img=mean2(I);
std_img=std2(I);
std_img=nanstd(I(:));
cv_img=std_img/mean_img;
d_s=size_s/grid_size ;  %when used fix daspect([d_s d_l 1])
 d_l=size_l/grid_size ;  %when used fix daspect([d_s d_l 1])
k=0;
n=0;
warning off;
for i=1:d_s:(size_s)
    k=k+1;
      if i>1;
            i=i-1;
      end
        
    for j=1:d_l:(size_l)
        n=n+1;
        if j>1;
            j=j-1;
        end
            m1=nanmean(I((i:(i+d_s-1)),(j:(j+d_l-1))));
            m(k,n)=nanmean(m1(:));
            s1=nanstd(I((i:(i+d_s-1)),(j:(j+d_l-1))));
            s(k,n)=nanstd(s1(:));
            cv(k,n)=s(k,n)/m(k,n); 
    end
      n=0;
end
% image resize
CV = imresize(cv,d_s);
 fig3=figure(3); 
   set (fig3, 'Units', 'normalized', 'outerposition', [0,0,1,1]);
 imshow(CV)
 daspect([d_s d_l 1])
    colormap parula;                   
     caxis auto
      c = colorbar('EastOutside'); 
  omega=get(c,'Position');
    omega(1)=(omega(1))*1.05;
      omega(2)=(omega(2))*2;
        omega(3)=(omega(3))*0.5;
            omega(4)=(omega(4))*0.5;
  set(c,'Position',omega)
  export_fig roughness_map -native  -transparent
    file1='roughness_map.png';
  file=['roughness_map_',name,type];
movefile(file1,file);

     pause(1);
     delete(c);
      disp( sprintf( 'save image') )
       export_fig roughness_map -native  -transparent
       

   % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% % % % % % % %    3D EXPORTATION   % % % % % % % % % % % % % % %
img1=fliplr(I);
img = imrotate(img1,-180);
 disp( sprintf( 'START 3D EXPORTATION') )
  
     [km,lm]=size(img);
  zm_axis=(km+lm)/10;
    disp( sprintf( 'start mesh') )
       Sa = std2(I) ;
     Ma = mean2(I);
    k=Ma+4*Sa;
    figure(4);
       fig4 = figure(4);
 set (fig4, 'Units', 'normalized', 'Position', [0,0,1,1]);
    img(img==0)=NaN;
    mesh(img)
    pbaspect([lm km zm_axis]);
    colormap gray;
 %    colorbar
    axis off
 shading interp
      caxis([0 k])
 disp( sprintf( 'save image 1.1') )
  export_fig mesh_3D.1 -native  -transparent
    file1='mesh_3D.1.png';
  file=['mesh_3D.1_',name,type];
  movefile(file1,file);
 colormap jet;
 c = colorbar('EastOutside'); 
   omega=get(c,'Position');
     omega(1)=(omega(1))*1.0;
       omega(2)=(omega(2))*2;
         omega(3)=(omega(3))*0.5;
             omega(4)=(omega(4))*0.5;
   set(c,'Position',omega)
 axis off
 shading interp
 disp( sprintf( 'save image 1.2') )
  export_fig mesh_3D.2 -native  -transparent
    file1='mesh_3D.2.png';
  file=['mesh_3D.2_',name,type];
movefile(file1,file);

