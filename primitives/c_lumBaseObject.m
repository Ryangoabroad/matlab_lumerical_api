classdef (Abstract) c_lumBaseObject
% Lumerical base object class
% 
% author: bohan
%
% some things that this class will handle
% storing properties of the object
% saving the name of the object
% setting and getting values
    
    properties
        
        props;          % struct that will store all properties
        valid_props;    % cell array that stores valid property names
                        % for example { 'x min', 'x max', 'rotation' };

    end     % end properties
    
    properties (Abstract)
        
        
        object_type;    % verbose name for object, such as rect, FDTD, etc.
        
    end
    
    
    methods
        
        function obj = c_lumBaseObject( valid_props, varargin )
            % constructor
            %
            % inputs:
            %   varargin = name value pairs
            %           where name must be one of the valid props

            obj.valid_props = valid_props;
            
            % set inputs
            for ii = 1:2:length(varargin)
                if ~any( strcmp( obj.valid_props, varargin{ii} ) )
                    % property is valid, set the value
                    obj.props.(varargin{ii}) = varargin{ii+1};
                else
                    % spit a warning
                    warning('Property %s is not a valid property of the rectangle object', varargin{ii});
                end
            end
            
        end     % end constructor()
        

    end     % end methods
    
end




































