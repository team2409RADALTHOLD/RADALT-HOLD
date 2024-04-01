function xyzNED = GPS2NED(lla0, lla, GPS_init)
    %   Transform geodetic coordinates to local north-east-down coordinates 
    %   lla0    = [0 0 0] -> [lat0 lon0 alt0]
    %   lla     = [lat lon alt]
    %   xyzNED  = lla2ned(lla,lla0,method) transforms the geodetic coordinates 
    %   lla to local north-east-down (NED) Cartesian coordinates xyzNED. 
    %   Specify the origin of the local NED system as the geodetic coordinates lla0.
    
    if (GPS_init == true)
        lla_update = lla;
        xyzNED = lla2ned(lla, lla0, 'ellipsoid');
        GPS_init = false;
        lla0 = lla_update;
    else
        lla_update = lla;
        xyzNED = lla2ned(lla, lla0, 'ellipsoid');
        lla0 = lla_update;
end