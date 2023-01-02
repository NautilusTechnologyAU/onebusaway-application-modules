package org.onebusaway.transit_data.model;

import java.io.Serializable;

public class TfnswVehicleDescriptorBean implements Serializable {
    private static final long serialVersionUID = 1L;

    private boolean airConditioned = Boolean.FALSE;

    private boolean wheelchairAccessible = Boolean.FALSE;

    public TfnswVehicleDescriptorBean() {
    }

    public TfnswVehicleDescriptorBean(TfnswVehicleDescriptorBean r) {
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
