function y = FOFsum(formants, F0, N, fs)
% formants = [formant1; formant2; ...]
% F0 = fundamental frequency
% N = number of periods

f = round(fs/F0);

[~, argmaxes] = max(formants, [], 2);
[argmax, Fm] = max(argmaxes);

new_formants = [formants(Fm,:)];
for i = 1:size(formants, 1)
    
    if i == Fm
        continue
    end

    amt = argmax - argmaxes(i);
    new_formants = [new_formants; 
        zeros(1, amt) formants(i, 1:(length(formants(i,:))-amt))];
end

allFormants = sum(new_formants);
delays = allFormants;

for i = 1:N
    delays = [delays zeros(i, f)];
    delays = [delays; zeros(1, i*f) allFormants];
end

y = sum(delays);

end