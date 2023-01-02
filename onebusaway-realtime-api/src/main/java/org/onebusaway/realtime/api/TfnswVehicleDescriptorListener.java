package org.onebusaway.realtime.api;

import org.onebusaway.gtfs.model.AgencyAndId;

public interface TfnswVehicleDescriptorListener {
    void handleTfnswVehicleDescriptor(TfnswVehicleDescriptorRecord record);
    void resetTfnswVehicleDescriptor(AgencyAndId vehicleId);
}
