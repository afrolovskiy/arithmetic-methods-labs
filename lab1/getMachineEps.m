function [epsilont] = getMachineEps()
    epsilont = 1.0;
    while 1 + epsilont ~= 1
        epsilont = epsilont / 2;
    end
end

