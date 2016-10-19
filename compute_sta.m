function [ sta ] = compute_sta( stim, rho, num_timesteps )
%COMPUTE_STA Calculates the spike-triggered average for a neuron that
%            is driven by a stimulus defined in stim. The spike-
%            triggered average is computed over num_timesteps timesteps.


    % spike triggered average
    sta = zeros(num_timesteps, 1);
    
    % This command finds the indices of all of the spikes that occur
    % after 300 ms into the recording.
    spike_times = find(rho(num_timesteps+1:end)) + num_timesteps;

    num_spikes = length(spike_times) ;
    

    
    % Computes the spike-triggered average of the spikes found using the
    % find command. To do this, computes the average of all of the vectors
    % starting 300 ms (exclusive) before a spike and ending at the time of
    % the event (inclusive). Each of these vectors defines a list of
    % samples that is contained within a window of 300 ms before the each
    % spike. The average of these vectors should be completed in an
    % element-wise manner.
    
    
    stim_window = zeros(num_timesteps,num_spikes);
   
    for index = 1:num_spikes
     start = spike_times(index)-num_timesteps; 
     stim_window(:,index) = stim(start+1:start+num_timesteps);
    end
    
    sta = mean(stim_window,2)';
    
end

