function pyr = gauss_pyramid1(I,nlev)
pyr = cell(nlev,1);
pyr{1} = I;
G_LOWER = I;
f = [.05, .25, .4, .25, .05];  
f = f'*f;

    for l = 2:nlev   
        G_LOWER=G_LOWER(1:2:size(G_LOWER,1)-1,1:2:size(G_LOWER,2)-1); %½µ²ÉÑù  
        pyr{l}=imfilter(G_LOWER,f,'replicate');
    end
end


