//
//  TaskFiles.swift
//  RechargeTeach
//
//  Created by Nicole Fong on 4/14/24.
//

/* kudos to Jared Davidson
 https://youtu.be/LQ-S43P1P1Q?si=OMyMxOA6MATcWvx1
 */

import Foundation
import SwiftUI
import Combine

struct Task : Identifiable {
    var id = String()
    var toDoItem = String()
}

class TaskStore : ObservableObject {
    @Published var tasks = [Task]()
}
