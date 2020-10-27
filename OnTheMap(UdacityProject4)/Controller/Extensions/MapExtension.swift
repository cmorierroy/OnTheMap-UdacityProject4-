//
//  MapExtension.swift
//  OnTheMap(UdacityProject4)
//
//  Created by Cédric Morier-Roy on 2020-10-27.
//

import Foundation
import MapKit

extension OTMViewController : MKMapViewDelegate
{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "annotation")

        if annotationView == nil
        {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "annotation")
        }

        annotationView?.image = UIImage(named:"icon_pin")
        annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        annotationView?.canShowCallout = true

        return annotationView
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl)
    {
        let url:URL?

        if let subtitle = view.annotation?.subtitle!
        {
            url = URL(string: subtitle)
            openURL(url:url)
        }
    }
}
