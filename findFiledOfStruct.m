function [elem_name,val] = findFiledOfStruct(str,Name) 
    if isstruct(str)
        f_name = fieldnames(str, '-full');
        for e_num = 1:length(f_name)
            tmp_name = [Name,'.',f_name{e_num}];
            try
                tmp_eval = evalin('base', tmp_name);
                [elem_name{e_num}] = findFiledOfStruct (tmp_eval,tmp_name);
            catch
                [elem_name{e_num}] = tmp_name;
            end
        end
    end
[elem_name] = decopose_cell2mat(elem_name,0);
end


function [result] = decopose_cell2mat(elem_name,count)
% function name : decopose_cell2mat
% input : 
% elem_name : struct value
% count : counter init

decomposedval = vertcat(elem_name);

for k = 1:length(decomposedval)

    if iscell(decomposedval{k})

        for m = 1:length(decomposedval{k})
            if iscell(decomposedval{k}{m})
                tempresult = decopose_cell2mat(decomposedval{k}{m},count);
                x = find(cellfun('isempty',tempresult));
                tempresult(x) = [];
                for t = 1:length(tempresult)
                    count = count + 1;
                    result{count} = tempresult{t};
                end
            else
                    count = count + 1;
                    result{count} = decomposedval{k}{m};
            end
        end
    else
        count = count + 1;
        result{count} = decomposedval{k};
    end
end

end