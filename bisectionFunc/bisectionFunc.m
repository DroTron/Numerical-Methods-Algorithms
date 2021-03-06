function [root,err] = bisectionFunc(func,xi,xu,derror)
%Created by Trevor Long on 3/10/2019
%Last Modified 5/10/2019
%-------------------------------------------------------------------------
%Usage:
%[root,err] = bisection(func,xi,xu,derror]
%-------------------------------------------------------------------------
%Inputs:
%func - function with handle to find root example: @(x)(x^2+2x)
%xi - guess lower then root
%xu - guess higher then root
%Optional Input:
%derror - desired error (if blank .01 is used)
%-------------------------------------------------------------------------
%Outputs:
%root - estimated root location
%err - calculated relative error
%-------------------------------------------------------------------------
%Hints:
%xi and xu are both required and must have opposite signs when evaluated
%at the function
if nargin < 3
    error('Not enough input arguements');
end
if nargin < 4
    derror = .01;
end
xm = ((xi+xu)/2);
xiv = func(xi);
xmv = func(xm);
xuv = func(xu);
errorabs = 1000;
if or(xiv < 0 && xuv > 0,xiv > 0 && xuv < 0)
    while errorabs > derror
        
        xm = ((xi+xu)/2);
        xiv = func(xi);
        xmv = func(xm);
        xuv = func(xu);
        
        
        if xiv > 0
            if xmv < 0
                xu = xm;
                xi = xi;
                errorabs = abs((xu-xi)/xu);
            else
                xi = xm;
                xu = xu;
                errorabs = abs((xi-xu)/xi);
            end
        else
            if xmv < 0
                xi = xm;
                xu = xu;
                errorabs = abs((xu-xi)/xu);
            else
                xu = xm;
                xi = xi;
                errorabs = abs((xi-xu)/xi);
            end
            
        end
        root = xm;
        err = errorabs;
    end
else
    error('The endpoints do not have opposite signs when evaluated at the function');
end
end

