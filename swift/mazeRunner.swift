/*

This is my general solution to most of the mazes in the Learn to Code 1 Swift Playgrounds Book for iPad

Early on, the isBlockedLeft and Right values are not available, so switch the commented out searchMove() and comment out the peakMove() line.

On each puzzle, there is a gaurunteed number of gems and total switches that will appear on the map. This needs to be entered at the bottom, where the solver object is initialized. This solver will continue searching the game field until all switches are found (open and closed) since the state and locations may be randomized at run.

On at least one puzzle, there is a sitiation where a series of objectives are placed away from the walls. For this situation, I advise zig-zagging, and then using the trackToWall() method before resuming searchAB(.left).

In a few puzzles, searchAB(.left) is more efficient than searchAB(.right), so just look ahead and consider if you'd rather prefer turning left or right. If it's a narrow passage, then it often doesn't matter much.

*/


enum Direction {
    case left
    case right
    func other ()->Direction{
        switch self{
        case .left:
            return .right
        case .right:
            return .left
        }
    }
}

enum CompassDirection {
    case north
    case east
    case south
    case west
    mutating func left(){
        switch self{
        case .north:
            self = .east
        case .east:
            self = .south
        case .south:
            self = .west
        case .west:
            self = .north
        }
    }
    mutating func right(){
        switch self{
        case .north:
            self = .west
        case .east:
            self = .north
        case .south:
            self = .east
        case .west:
            self = .south
        }
    }
}

struct Point : Equatable{
    var x: Int
    var y: Int
    
    static func ==(lhs: Point, rhs: Point) -> Bool {
        return (lhs.x, lhs.y) == (rhs.x, rhs.y)
    }
}

struct PointList {
    var value : [Point]
    func contains(input: Point)->Bool{
        for i in value {
            if i == input{
                return true
            }
        }
        return false
    }
    mutating func append(input:Point){
        value.append(input)
    }
}

typealias PointDirection = (Point, CompassDirection)

struct WalkHistory {
    var value : [PointDirection]
    init(_ input: [PointDirection] ){
        value = input
    }
    func contains(input: PointDirection)->Bool{
        for i in value {
            if i == input {return true}
        }
        return false
    }
}

struct BodyTracker{
    var position = Point(x: 0, y: 0)
    
    var compassDirection : CompassDirection = .north
    var history = WalkHistory([])
    
    var switchCount : Int
    var gemCount : Int
    var switchList = PointList(value: [])
    
    var hasLooped = false
    
    init(switches: Int, gems: Int){
        switchCount = switches
        gemCount = gems
    }
    
    mutating func moveTrack(){
        goalCheck()
        moveForward()
        switch (compassDirection) {
        case .north:
            position.x += 1
        case .east:
            position.y += 1
        case .south:
            position.x -= 1
        case .west:
            position.y -= 1
        }
        if history.contains(input: (position, compassDirection)){hasLooped = true}
        history.value.append((position, compassDirection))
    }
    mutating func trackTurn(_ direction: Direction){
        switch direction{
        case .right:
            trackRight()
        case .left:
            trackLeft()
        }
    }
    
    mutating func trackRight(){
        turnRight()
        compassDirection.right()
    }
    mutating func trackLeft(){
        turnLeft()
        compassDirection.left()
    }
    
    func isBlockedPeak(_ direction: Direction)->Bool{
        switch direction{
        case .left:
            return isBlockedLeft
        case .right:
            return isBlockedRight
        }
    }
    
    mutating func peakMove(_ direction: Direction){
        if !isBlockedPeak(direction) {
            trackTurn(direction)
            moveTrack()
            return
        } else if !isBlocked {
            moveTrack()
            return
        }else if !isBlockedPeak(direction.other()) {
            trackTurn(direction.other())
            moveTrack()
            return
        } else {
            trackTurn(.left)
            trackTurn(.left)
        }
    }
    
    mutating func searchMove(_ direction: Direction){
        trackTurn(direction)
        if !isBlocked{moveTrack(); return}
        for i in 1 ... 3 {
            trackTurn(direction.other())
            if !isBlocked{moveTrack(); return}
        }
    }
    
    
    mutating func trackToWall(){
        while !isBlocked{
            moveTrack()
        }
    }
    
    mutating func goalCheck(){
        if switchCount > 0 && isOnClosedSwitch && !switchList.contains(input: position){
            toggleSwitch()
            switchList.append(input: position)
            switchCount -= 1
        }
        if switchCount > 0 && isOnOpenSwitch && !switchList.contains(input: position){
            switchList.append(input: position)
            switchCount -= 1
        }
        if gemCount > 0 && isOnGem {
            collectGem()
            gemCount -= 1
        }
    }
    
    mutating func goalSearch(direction: Direction){
        
        while !hasLooped && (gemCount > 0 || switchCount > 0 ) {
            //searchMove(direction)
            peakMove(direction)
        }
    }
    
    mutating func searchAB(_ direction: Direction){
        history = WalkHistory([])
        hasLooped = false
        goalSearch(direction: direction)
        history = WalkHistory([])
        hasLooped = false
        goalSearch(direction: direction.other())
        
    }
}

var avatar = BodyTracker(
    switches: 7,
    gems: 8
)
avatar.searchAB(.right)

