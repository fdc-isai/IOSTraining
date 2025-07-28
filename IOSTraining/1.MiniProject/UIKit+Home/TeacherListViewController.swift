//
//  TeacherListViewController.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/8/25.
//

import UIKit
import SwiftUI

class TeacherListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private let menuCellIdentifier = "HomeMenuCell"
    private let sortingCellIdentifier = "SortingCell"
    private let cellIdentifier = "TeacherListCell"
    private let bannerCellIdentifier = "BannerCell"
    private let storyCellIdentifier = "StoryCell"
    private let avatarCellIdentifier = "AvatarCell"
    private let topTeacherCellIdentifier = "TopTeachersCell"
    private var teachers: [TeacherThumbnail] = []
    private var teacherChunks: [[TeacherThumbnail]] = []
    private var displaySections: [SectionType] = []
    private var banners: [String] = [
        "banner_1", "banner_2"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        NCNetworkManager.shared.getTeachersList { response in
            self.teachers = response.teachers ?? []
            self.teacherChunks = stride(from: 0, to: self.teachers.count, by: 4).map {
                Array(self.teachers[$0..<min($0 + 4, self.teachers.count)])
            }

            self.buildDisplaySections()

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

        // main teacher list
        let nibMainTeacher = UINib(nibName: cellIdentifier, bundle: nil)
        tableView.register(nibMainTeacher, forCellReuseIdentifier: cellIdentifier)

        let nibMenu = UINib(nibName: menuCellIdentifier, bundle: nil)
        tableView.register(nibMenu, forCellReuseIdentifier: menuCellIdentifier)

        let nibSort = UINib(nibName: sortingCellIdentifier, bundle: nil)
        tableView.register(nibSort, forCellReuseIdentifier: sortingCellIdentifier)

        let nibStory = UINib(nibName: storyCellIdentifier, bundle: nil)
        tableView.register(nibStory, forCellReuseIdentifier: storyCellIdentifier)

        let nibAvatar = UINib(nibName: avatarCellIdentifier, bundle: nil)
        tableView.register(nibAvatar, forCellReuseIdentifier: avatarCellIdentifier)

        let nibTopTeacher = UINib(nibName: topTeacherCellIdentifier, bundle: nil)
        tableView.register(nibTopTeacher, forCellReuseIdentifier: topTeacherCellIdentifier)

        let nibBanner = UINib(nibName: bannerCellIdentifier, bundle: nil)
        tableView.register(nibBanner, forCellReuseIdentifier: bannerCellIdentifier)
    }

    func buildDisplaySections() {
        displaySections = []
        displaySections.append(.menu)
        displaySections.append(.sort)

        for (i, _) in teacherChunks.enumerated() {
            displaySections.append(.teacherChunk(index: i))

            switch i {
                case 0:
                    displaySections.append(.avatar)
                case 1:
                    displaySections.append(.banner(index: 0))
                case 2:
                    displaySections.append(.story)
                case 3:
                    displaySections.append(.banner(index: 1))
                case 4:
                    displaySections.append(.topTeacher)
                default:
                    break
            }
        }
    }
}

extension TeacherListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return displaySections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch displaySections[section] {
            case .teacherChunk(let index):
                return teacherChunks[index].count
            default:
                return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch displaySections[indexPath.section] {
            case .menu:
                return tableView.dequeueReusableCell(withIdentifier: menuCellIdentifier, for: indexPath)

            case .sort:
                return tableView.dequeueReusableCell(withIdentifier: sortingCellIdentifier, for: indexPath)

            case .teacherChunk(let chunkIndex):
                let teacher = teacherChunks[chunkIndex][indexPath.row]
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TeacherListCell
                cell.configureCell(teacher)
                return cell

            case .story:
                return tableView.dequeueReusableCell(withIdentifier: storyCellIdentifier, for: indexPath)

            case .banner(let bannerIndex):
                let cell = tableView.dequeueReusableCell(withIdentifier: bannerCellIdentifier, for: indexPath) as! BannerCell
                if bannerIndex < banners.count {
                    cell.configureCell(banners[bannerIndex])
                }
                return cell

            case .topTeacher:
                return tableView.dequeueReusableCell(withIdentifier: topTeacherCellIdentifier, for: indexPath)

            case .avatar:
                return tableView.dequeueReusableCell(withIdentifier: avatarCellIdentifier, for: indexPath)
        }

    }
}

extension TeacherListViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let sectionType = displaySections[indexPath.section]

        switch sectionType {
            case .teacherChunk(let chunkIndex):
                let teacher = teacherChunks[chunkIndex][indexPath.row]
                let vc = UIHostingController(
                    rootView: TeacherDetailSwiftUI(teacherId: teacher.id)
                )
                vc.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(vc, animated: true)

            default:
                break // ignore taps on banners, stories, etc.
        }
    }
}
