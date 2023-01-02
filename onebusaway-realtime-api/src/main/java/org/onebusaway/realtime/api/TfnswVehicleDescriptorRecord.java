package org.onebusaway.realtime.api;

import org.onebusaway.gtfs.model.AgencyAndId;

import java.io.Serializable;

public class TfnswVehicleDescriptorRecord implements Serializable {
    private static final long serialVersionUID = 1L;

    private AgencyAndId vehicleId;

    private boolean airConditioned = Boolean.FALSE;

    private boolean wheelchairAccessible = Boolean.FALSE;

    public TfnswVehicleDescriptorRecord() {

    }

    public AgencyAndId getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(AgencyAndId vehicleId) {
        this.vehicleId = vehicleId;
    }

    public TfnswVehicleDescriptorRecord(TfnswVehicleDescriptorRecord r) {
        this.vehicleId = r.vehicleId;
        this.airConditioned = r.airConditioned;
        this.wheelchairAccessible = r.wheelchairAccessible;
    }

    public boolean isAirConditioned() {
        return airConditioned;
    }

    public void setAirConditioned(boolean airConditioned) {
        this.airConditioned = airConditioned;
    }

    public boolean isWheelchairAccessible() {
        return wheelchairAccessible;
    }

    public void setWheelchairAccessible(boolean wheelchairAccessible) {
        this.wheelchairAccessible = wheelchairAccessible;
    }
}
