import UIKit

private func generateLayout() -> UICollectionViewLayout {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.itemSize = CGSize(width: 100, height: 100) // Adjust the item size as needed
    layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    layout.minimumLineSpacing = 10
    layout.minimumInteritemSpacing = 10
    
    return layout
}

class ExploreViewController: UIViewController {
    
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    public var events = [Event]()
        private let refreshControl = UIRefreshControl()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
            fetchEvents()
        }
        
        private func setupUI() {
            // Collection View Setup
            collectionView.register(
                ExploreHeaderCollectionReusableView.self,
                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: "SectionHeaderView"
            )
            
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.setCollectionViewLayout(generateLayout(), animated: true)
            
            // Add refresh control
            refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
            collectionView.refreshControl = refreshControl
            
            // Location setup
            locationLabel.text = "Chennai"
        }
        
        @objc private func refreshData() {
            fetchEvents()
        }
        
    private func fetchEvents() {
        guard let url = URL(string: "http://localhost:4000/getAllEvents") else {
            showError("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            DispatchQueue.main.async {
                self?.refreshControl.endRefreshing()
            }

            if let error = error {
                self?.showError("Network error: \(error.localizedDescription)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                self?.showError("Server error")
                return
            }

            guard let data = data else {
                self?.showError("No data received")
                return
            }

            // Print the raw data to debug
            if let rawString = String(data: data, encoding: .utf8) {
                print("Raw response data: \(rawString)")
            }

            // Handle JSON decoding
            do {
                let decoder = JSONDecoder()
                let eventResponse = try decoder.decode(EventResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.events = eventResponse.events
                    self?.collectionView.reloadData()
                }
            } catch {
                self?.showError("Data parsing error: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
        
        private func showError(_ message: String) {
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true)
            }
        }
        

    }

    // MARK: - UICollectionViewDataSource
    extension ExploreViewController: UICollectionViewDataSource {
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return events.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpcomingEventCell", for: indexPath) as? upcomingCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            let event = events[indexPath.row]
            cell.configure(with: event)
            return cell
        }
    }

    // MARK: - UICollectionViewDelegate
    extension ExploreViewController: UICollectionViewDelegate {
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            performSegue(withIdentifier: "EventDetail", sender: self)
        }
    }
