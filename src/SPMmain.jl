# 2021.08.21
# NKU

# test function
# give f(a) to f(b),n points
function makepoint(f,a,b,n)
    local x, w
    x=[a+i*(b-a)/(n+1) for i=1:n]
    w=f.(x)
    return x, w
end

# 给定点x,y的集合，给出系数a_i
function coefficient(x,y)
    a=Array{Float64}(undef,length(x)-1,1)
    a[1]=((y[1]/y[2])-1)/(x[2]-x[1])
    for i=2:length(x)-1
        for j=1:i-1
            if j==1
                a[i]=1+a[1]*(x[i+1]-x[1])/(1-(y[1]/y[i+1]))
            else
                a[i]=a[j]*(x[i+1]-x[j])/a[i]+1
            end
        end
        a[i]*=1/(x[i]-x[i+1])
    end
    return a
end

# 给出SPM最终函数形式
# final_SPM_form
# t are Variable
# (x,y)is the point 
# a are coefficient
# i is deep
function func(t, x, y, a,i= 1)
    n=length(a)
    # N是点的个数减1
    if i==1
        return y[i]/(1+a[i]*(t-x[i])/(1+func(t, x, y, a, i+1)))
    elseif i==n
        return a[i]*(t-x[i])
    elseif i<=n-1
        return a[i]*(t-x[i])/(1+func(t, x, y, a, i+1))
    end
end

function SPMinter(x, y)
    a=coefficient(x,y)
    f(t)=func(t, x, y, a, 1)
    return f
end

# function SPM()
    
# end
