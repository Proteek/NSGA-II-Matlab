function y = UF9(x)
    E           = 0.1;
    [dim, num]  = size(x);
    Y           = zeros(dim,num);
    Y(3:dim,:)  = (x(3:dim,:) - 2.0*repmat(x(2,:),[dim-2,1]).*sin(2.0*pi*repmat(x(1,:),[dim-2,1]) + pi/dim*repmat((3:dim)',[1,num]))).^2;
    tmp1        = sum(Y(4:3:dim,:));  % j-1 = 3*k
    tmp2        = sum(Y(5:3:dim,:));  % j-2 = 3*k
    tmp3        = sum(Y(3:3:dim,:));  % j-0 = 3*k
    tmp         = max(0,(1.0+E)*(1-4.0*(2.0*x(1,:)-1).^2));
    y(1,:)      = 0.5*(tmp+2*x(1,:)).*x(2,:)     + 2.0*tmp1/size(4:3:dim,2);
    y(2,:)      = 0.5*(tmp-2*x(1,:)+2.0).*x(2,:) + 2.0*tmp2/size(5:3:dim,2);
    y(3,:)      = 1-x(2,:)                       + 2.0*tmp3/size(3:3:dim,2);
    clear Y;
end