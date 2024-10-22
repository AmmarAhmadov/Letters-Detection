clear all;
clc;
N = 27;
AN = 10;
AM = 5;
correct_Output = eye(N);
% Read Capital Letters
Capital(:,:,1)=imread('Capital Calibri/A.bmp');Capital(:,:,2)=imread('Capital Calibri/B.bmp');Capital(:,:,3)=imread('Capital Calibri/C.bmp');
Capital(:,:,4)=imread('Capital Calibri/D.bmp');Capital(:,:,5)=imread('Capital Calibri/E.bmp');Capital(:,:,6)=imread('Capital Calibri/F.bmp');
Capital(:,:,7)=imread('Capital Calibri/G.bmp');Capital(:,:,8)=imread('Capital Calibri/H.bmp');Capital(:,:,9)=imread('Capital Calibri/I.bmp');
Capital(:,:,10)=imread('Capital Calibri/J.bmp');Capital(:,:,11)=imread('Capital Calibri/K.bmp');Capital(:,:,12)=imread('Capital Calibri/L.bmp');
Capital(:,:,13)=imread('Capital Calibri/M.bmp');Capital(:,:,14)=imread('Capital Calibri/N.bmp');Capital(:,:,15)=imread('Capital Calibri/O.bmp');
Capital(:,:,16)=imread('Capital Calibri/P.bmp');Capital(:,:,17)=imread('Capital Calibri/Q.bmp');Capital(:,:,18)=imread('Capital Calibri/R.bmp');
Capital(:,:,19)=imread('Capital Calibri/S.bmp');Capital(:,:,20)=imread('Capital Calibri/T.bmp');Capital(:,:,21)=imread('Capital Calibri/U.bmp');
Capital(:,:,22)=imread('Capital Calibri/V.bmp');Capital(:,:,23)=imread('Capital Calibri/W.bmp');Capital(:,:,24)=imread('Capital Calibri/X.bmp');
Capital(:,:,25)=imread('Capital Calibri/Y.bmp');Capital(:,:,26)=imread('Capital Calibri/Z.bmp');Capital(:,:,27)=imread('Slash/Slash.bmp');
% Small letters
Small(:,:,1)=imread('Small Calibri/A.bmp');Small(:,:,2)=imread('Small Calibri/B.bmp');Small(:,:,3)=imread('Small Calibri/C.bmp');
Small(:,:,4)=imread('Small Calibri/D.bmp');Small(:,:,5)=imread('Small Calibri/E.bmp');Small(:,:,6)=imread('Small Calibri/F.bmp');
Small(:,:,7)=imread('Small Calibri/G.bmp');Small(:,:,8)=imread('Small Calibri/H.bmp');Small(:,:,9)=imread('Small Calibri/I.bmp');
Small(:,:,10)=imread('Small Calibri/J.bmp');Small(:,:,11)=imread('Small Calibri/K.bmp');Small(:,:,12)=imread('Small Calibri/L.bmp');
Small(:,:,13)=imread('Small Calibri/M.bmp');Small(:,:,14)=imread('Small Calibri/N.bmp');Small(:,:,15)=imread('Small Calibri/O.bmp');
Small(:,:,16)=imread('Small Calibri/P.bmp');Small(:,:,17)=imread('Small Calibri/Q.bmp');Small(:,:,18)=imread('Small Calibri/R.bmp');
Small(:,:,19)=imread('Small Calibri/S.bmp');Small(:,:,20)=imread('Small Calibri/T.bmp');Small(:,:,21)=imread('Small Calibri/U.bmp');
Small(:,:,22)=imread('Small Calibri/V.bmp');Small(:,:,23)=imread('Small Calibri/W.bmp');Small(:,:,24)=imread('Small Calibri/X.bmp');
Small(:,:,25)=imread('Small Calibri/Y.bmp');Small(:,:,26)=imread('Small Calibri/Z.bmp'); Small(:,:,27)=imread('Slash/Slash.bmp');
% Standard
Standard(:,:,1)=imread('Standard/A.bmp');Standard(:,:,2)=imread('Standard/B.bmp');Standard(:,:,3)=imread('Standard/C.bmp');
Standard(:,:,4)=imread('Standard/D.bmp');Standard(:,:,5)=imread('Standard/E.bmp');Standard(:,:,6)=imread('Standard/F.bmp');
Standard(:,:,7)=imread('Standard/G.bmp');Standard(:,:,8)=imread('Standard/H.bmp');Standard(:,:,9)=imread('Standard/I.bmp');
Standard(:,:,10)=imread('Standard/J.bmp');Standard(:,:,11)=imread('Standard/K.bmp');Standard(:,:,12)=imread('Standard/L.bmp');
Standard(:,:,13)=imread('Standard/M.bmp');Standard(:,:,14)=imread('Standard/N.bmp');Standard(:,:,15)=imread('Standard/O.bmp');
Standard(:,:,16)=imread('Standard/P.bmp');Standard(:,:,17)=imread('Standard/Q.bmp');Standard(:,:,18)=imread('Standard/R.bmp');
Standard(:,:,19)=imread('Standard/S.bmp');Standard(:,:,20)=imread('Standard/T.bmp');Standard(:,:,21)=imread('Standard/U.bmp');
Standard(:,:,22)=imread('Standard/V.bmp');Standard(:,:,23)=imread('Standard/W.bmp');Standard(:,:,24)=imread('Standard/X.bmp');
Standard(:,:,25)=imread('Standard/Y.bmp');Standard(:,:,26)=imread('Standard/Z.bmp'); Standard(:,:,27)=imread('Standard/Slash.bmp');
% Read Slash

Capital = logical(Capital);
Small = logical(Small);
Standard = logical(Standard);
% Capital Resized Reshaped
for i = 1: N
    Capital_Resized (:,:,i) = imresize(Capital(:,:,i), [AN AM]);  
end
for i = 1: N
    Capital_Resized_Reshaped(:,i) = reshape(Capital_Resized(:,:,i), [AN*AM 1]); 
end
% Small Resized Reshaped
for i = 1: N
    Small_Resized (:,:,i) = imresize(Small(:,:,i), [AN AM]);  
end
for i = 1: N
    Small_Resized_Reshaped(:,i) = reshape(Small_Resized(:,:,i), [AN*AM 1]); 
end
% Standard
for i = 1: N
    Standard_Resized (:,:,i) = imresize(Standard(:,:,i), [AN AM]);  
end
for i = 1: N
    Standard_Resized_Reshaped(:,i) = reshape(Standard_Resized(:,:,i), [AN*AM 1]); 
end
Letters = [Capital_Resized_Reshaped Small_Resized_Reshaped Standard_Resized_Reshaped];
save('Letters','Letters');
clear all;
clc;