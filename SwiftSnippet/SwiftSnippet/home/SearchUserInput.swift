import SwiftUI

struct PeopleUserInputState {
    @State public private(set) var people = 1
}

struct PeopleUserInput: View {
    
    let titleSuffix: String
    let onPeopleChanged: (Int) -> ()
    @State var peopleState: PeopleUserInputState
    
    init(
        titleSuffix: String = "",
        onPeopleChanged: @escaping (Int) -> Void,
        peopleState: PeopleUserInputState = PeopleUserInputState()
    ) {
        self.titleSuffix = titleSuffix
        self.onPeopleChanged = onPeopleChanged
        self.peopleState = peopleState
    }
    
    var body: some View {
        VStack {
            let people = peopleState.people
            CraneUserInput(
                text: people == 1
                    ? "\(people) Adult\(titleSuffix)"
                    : "\(people) Adults\(titleSuffix)",
                onClick: {}
            )
        }
    }
}
