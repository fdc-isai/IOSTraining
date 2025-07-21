//
//  TeacherListViewController.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/8/25.
//

import UIKit

struct GenshinTeacher {
    let status: Int
    let name: String
    let address: String
    let age: Int
    let rating: Double
    let lessonCount: Int
    let coin: Int
    let imageName: String
}

struct Banner {
    let imageName: String
}

class TeacherListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let cellIdentifier = "TeacherListCell"
    private let bannerCellIdentifier = "BannerCell"

    private var teachers: [GenshinTeacher] = [
        GenshinTeacher(
            status: 1,
            name: "Teacher Raiden",
            address: "Philippines",
            age: 12,
            rating: 4.5,
            lessonCount: 5633,
            coin: 100,
            imageName: "user_raiden"
        ),
        GenshinTeacher(
            status: 2,
            name: "Teacher Mavuika",
            address: "Philippines",
            age: 12,
            rating: 4.9,
            lessonCount: 1245,
            coin: 200,
            imageName: "user_mavuika"
        ),
        GenshinTeacher(
            status: 1,
            name: "Teacher Venti",
            address: "Japan",
            age: 13,
            rating: 4.7,
            lessonCount: 1347,
            coin: 150,
            imageName: "user_venti"
        ),
        GenshinTeacher(
            status: 3,
            name: "Teacher Zhongli",
            address: "Philippines",
            age: 14,
            rating: 4.6,
            lessonCount: 5675,
            coin: 300,
            imageName: "user_zhongli"
        ),
        GenshinTeacher(
            status: 3,
            name: "Teacher Nahida",
            address: "Japan",
            age: 12,
            rating: 5.0,
            lessonCount: 1356,
            coin: 100,
            imageName: "user_nahida"
        ),
        GenshinTeacher(
            status: 2,
            name: "Teacher Yelan",
            address: "Philippines",
            age: 15,
            rating: 4.8,
            lessonCount: 8764,
            coin: 100,
            imageName: "user_yelan"
        ),
        GenshinTeacher(
            status: 1,
            name: "Teacher Mavuika II",
            address: "Canada",
            age: 13,
            rating: 4.4,
            lessonCount: 3537,
            coin: 100,
            imageName: "user_mavuika"
        ),
        GenshinTeacher(
            status: 3,
            name: "Teacher Raiden II",
            address: "UK",
            age: 14,
            rating: 4.3,
            lessonCount: 4572,
            coin: 100,
            imageName: "user_raiden"
        ),
        GenshinTeacher(
            status: 1,
            name: "Teacher Venti II",
            address: "Australia",
            age: 12,
            rating: 4.2,
            lessonCount: 1752,
            coin: 100,
            imageName: "user_venti"
        ),
        GenshinTeacher(
            status: 2,
            name: "Teacher Nahida II",
            address: "Singapore",
            age: 16,
            rating: 4.9,
            lessonCount: 1267,
            coin: 100,
            imageName: "user_nahida"
        ),
        GenshinTeacher(
            status: 1,
            name: "Teacher Zhongli II",
            address: "Germany",
            age: 15,
            rating: 4.6,
            lessonCount: 9638,
            coin: 100,
            imageName: "user_zhongli"
        ),
        GenshinTeacher(
            status: 3,
            name: "Teacher Yelan II",
            address: "France",
            age: 13,
            rating: 4.7,
            lessonCount: 3546,
            coin: 100,
            imageName: "user_yelan"
        ),
        GenshinTeacher(
            status: 1,
            name: "Teacher Mavuika III",
            address: "Taiwan",
            age: 14,
            rating: 4.5,
            lessonCount: 7978,
            coin: 100,
            imageName: "user_mavuika"
        ),
        GenshinTeacher(
            status: 1,
            name: "Teacher Venti II",
            address: "India",
            age: 12,
            rating: 4.8,
            lessonCount: 1256,
            coin: 100,
            imageName: "user_venti"
        ),
        GenshinTeacher(
            status: 1,
            name: "Teacher Raiden III",
            address: "South Korea",
            age: 13,
            rating: 4.4,
            lessonCount: 2355,
            coin: 100,
            imageName: "user_raiden"
        ),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)

        let nib2 = UINib(nibName: bannerCellIdentifier, bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: bannerCellIdentifier)

    }

}


extension TeacherListViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
            return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : teachers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            case 0:
                if let cell = tableView.dequeueReusableCell(withIdentifier: bannerCellIdentifier, for: indexPath) as? BannerCell {
                    return cell
                }
            case 1:
                if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TeacherListCell {
                    let teacher = teachers[indexPath.row]
                    cell.configureCell(teacher)
                    return cell
                }
            default:
                break
        }

        return UITableViewCell()

        

    }

    
}

extension TeacherListViewController:UITableViewDelegate{

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {

        let vc = TeacherDetailsViewController()
        vc.teacher = teachers[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)        
       
    }
}
