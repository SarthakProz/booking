//
//  PlanTripView.swift
//  ExploreHere
//
//  Created by William Souef on 15/09/2022.
//

import SwiftUI

struct PlanTripView: View {

@Binding var PlanTripViewIsShowing : Bool
@StateObject var tripType = TripType()
    
    var body: some View {
        
        
        NavigationView{
          
            
            VStack(alignment: .center){
                List(activities) { activity in
                   
                NavigationLink(destination: DetailExperienceView(activity: activity)){
                    ExperiencesButton(name: activity.name, image: activity.image)
                        .padding(55)
                    
                    }
                }
                .navigationBarTitle(" Trips")
                .toolbar{
                    NavigationLink{
                        CartView()
                            .environmentObject(tripType)
                    }label: {
                        CartButton(numberOfItems: tripType.activities.count)
                            .environmentObject(tripType)
                    }
                   
                        
                }
                
            }
            
        }.accentColor(.black)
        
        
       
        
        
        }
}


struct PlanTripView_Previews: PreviewProvider {
    private static var PlanTripViewIsShowing = Binding.constant(false)
    static var previews: some View {
        
        PlanTripView(PlanTripViewIsShowing: PlanTripViewIsShowing)
            .environmentObject(TripType())
    }
}
