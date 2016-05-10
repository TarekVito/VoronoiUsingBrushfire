function [ distMap ] = getDistanceMap( img)
Xsize = size(img,1);
Ysize = size(img,2);
Nx = [1 0 -1 0];
Ny = [0 1 0  -1];
Lx = zeros(1,Xsize*Ysize);
Ly = zeros(1,Xsize*Ysize);
[x, y] = ind2sub(Xsize,find(img==1));
Lx(1:size(x)) = x;
Ly(1:size(y)) = y;
curSize = size(x,1);
curSize1= size(x,1);
curIdx = 1;
while curIdx < curSize1
    curX = Lx(curIdx);
    curY = Ly(curIdx);
    curIdx = curIdx+1;
    for i=1:4
        NCurX = curX+Nx(i);
        NCurY = curY+Ny(i);
        if(NCurX<=Xsize && NCurX>0 && NCurY<=Ysize && NCurY>0) 
            curSize = curSize+1;
            Lx(curSize) = NCurX;
            Ly(curSize) = NCurY;
            
        end
    end
end

while curIdx < curSize
    curX = Lx(curIdx);
    curY = Ly(curIdx);
    curIdx = curIdx+1;
    if (img(curX,curY)==0)
        minVal= 1e7;
        for i=1:4
            NCurX = curX+Nx(i);
            NCurY = curY+Ny(i);
            if(NCurX<=Xsize && NCurX>0 && NCurY<=Ysize && NCurY>0)
                if(img(NCurX,NCurY)>0 && img(NCurX,NCurY)<minVal)
                    minVal = img(NCurX,NCurY);
                else
                    curSize = curSize+1;
                    Lx(curSize) = NCurX;
                    Ly(curSize) = NCurY;
                    
                end
            end
        end
        if(minVal ==1e7)
            minVal =0;
        end
        img(curX,curY) = minVal+1;
        
    end
end
distMap = img./max(img(:));
end

