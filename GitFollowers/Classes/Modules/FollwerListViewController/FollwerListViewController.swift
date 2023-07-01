//
//  FollwerListViewController.swift
//  GitFollowers
//
//  Created by Mahmoud on 13/06/2023.
//
import UIKit
class FollwerListVC: UIViewController {
    enum Section {
        case main
    }
    var follwers: [Users] = []
    var username: String!
    var page = 1
    var hasMoreFollowers = true
    let network = Network()
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Users>!

    override func viewDidLoad() {
        super.viewDidLoad()
        configViewController()
        configCollectionView()
        Task {
            await getFollowers(for: username, page: page)
            print(username)
            print(page)
        }
        configDataSource()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    private func configViewController() {
        self.view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    private func configCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(to: self.view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowersCell.self, forCellWithReuseIdentifier: FollowersCell.reuseID)
    }
    func getFollowers(for username: String, page: Int) async {
        showLoadingView()

        let followers = try? await network.getFollowers(for: username, page: page)
        print(followers)
        self.dismissLoadingView()
        switch followers {
        case .success(let followers):
            if followers.count < 100 {
                self.hasMoreFollowers = false
//                self.dismissLoadingView()
            }
            self.follwers.append(contentsOf: followers)
            self.updateData()
        case .failure(let error):
//            self.dismissLoadingView()
            self.presentGFAlertOnMainThread(title: "Bad request", message: error.rawValue, buttonTitle: "Ok")
            self.navigationController?.popViewController(animated: true)
        case .none:
            print("in none case")
        }
    }
    func configDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Users>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, Users) -> UICollectionViewCell in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowersCell.reuseID, for: indexPath) as? FollowersCell
            cell?.set(follwer: Users)
            return cell!

        })
    }
    func updateData() {
        var snapShot = NSDiffableDataSourceSnapshot<Section, Users>()
        snapShot.appendSections([.main])
        snapShot.appendItems(follwers)

        DispatchQueue.main.async {
            self.dataSource.apply(snapShot, animatingDifferences: true)
        }
    }

}
extension FollwerListVC: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("i'm scrolling®")
        let offSetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        print(offSetY)
        print(contentHeight)
        print(height)
        if offSetY > contentHeight - height {
            guard hasMoreFollowers else {
                return
            }
            page += 1
            DispatchQueue.global().async { [self] in

                Task {
                    await getFollowers(for: self.username, page: self.page)
                }

            }
        }
    }

}
