function [SNR]=calc_SNR(B1,ne,R)
for ll=1:1:size(B1,1)
    for cc=1:1:size(B1,3)
        for ii=1:1:ne
            B(ii,1)=B1(ll,1,cc,ii);            
        end
        SNR(ll,cc)=sqrt((inv(R)*B)'*conj(B));
    end
end
end