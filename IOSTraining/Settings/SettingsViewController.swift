//
//  SettingsViewController.swift
//  IOSTraining
//
//  Created by Isai Gesapine on 7/9/25.
//

import UIKit

struct Setting {
    let name: String
    let settingIcon: String
}

class SettingsViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!

    private let settingCellIdentifier = "SettingCell"

    private var settings: [Setting] = [
        Setting(name: "Contract Detail", settingIcon: "icon_star"),
        Setting(name: "Other Settings", settingIcon: "icon_coin"),
        Setting(name: "Family Management", settingIcon: "icon_star"),
        Setting(name: "Favorite Tutor", settingIcon: "icon_star"),
        Setting(name: "Hidden Tutors", settingIcon: "icon_star"),
        Setting(name: "Announcement", settingIcon: "icon_star"),
        Setting(name: "About Native Camp", settingIcon: "icon_star"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

        let nib = UINib(nibName: settingCellIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: settingCellIdentifier)


    }

    @IBAction func ontapLogoutButton(_ sender: Any) {

        // assume successful validation on login
        MyManager.shared.setIsLoggedIn(false)

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initialVC = storyboard.instantiateInitialViewController()

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate,
           let window = sceneDelegate.window {

            window.rootViewController = initialVC
            window.makeKeyAndVisible()

            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil)
        }
    }

}

extension SettingsViewController: UITableViewDataSource {


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(settings.count)
        return settings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: settingCellIdentifier) as? SettingCell {
            let setting = settings[indexPath.row]
            cell.configureCell(setting)
            return cell
        }
        return UITableViewCell()
    }
}


extension SettingsViewController: UITableViewDelegate   {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {

        let selectedSetting = settings[indexPath.row]
        let alert = UIAlertController(
            title: "Setting clicked",
            message: selectedSetting.name,
            preferredStyle: .alert
        )

        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { _ in
                    print("did tap ok")
                }
            )
        )
        self.present(alert, animated: true)


    }
}
