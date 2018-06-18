import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Tested with iPad Pro (model A1584) - similar patterns on other devices (tested with MD795FD/A), but sizes have to be changed
        let size: CGSize
        // size = .init(sideLength: 19149.0) //  OK, cannot allocate
        // size = .init(sideLength: 18149.0) //  OK, cannot allocate
        // size = .init(sideLength: 18060.0) // OK, can allocate
        // size = .init(sideLength: 18000.0) // OK, can allocate
        // size = .init(sideLength: 17979.0) // CRASHES
        size = .init(sideLength: 17149.0) // CRASHES
        // size = .init(sideLength: 16120.0) // CRASHES
        // size = .init(sideLength: 14149.0) // CRASHES
        // size = .init(sideLength: 14148.0) // OK, can allocate

        print("Try to allocate ~ \(size.width * size.height * 16.0) bytes for bitmap data")
        UIGraphicsBeginImageContextWithOptions(size, true, 0.0)
        let context = UIGraphicsGetCurrentContext()

        self.view.backgroundColor = (context == nil) ? .red : .green
    }
}

// MARK: - Helper

private extension CGSize {

    init(sideLength: CGFloat) {
        self.init(width: sideLength, height: sideLength)
    }
}

