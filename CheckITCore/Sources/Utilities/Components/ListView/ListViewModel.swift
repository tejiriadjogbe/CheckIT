//
//  ListViewModel.swift
//
//
//  Created by Adjogbe  Tejiri on 01/01/2024.
//
import UIKit
public struct ListViewModel {
    public var cellForRowAt: (DynamicTableViewCell, IndexPath) -> UITableViewCell
    public var count: Int
    public var height: CGFloat
    public var onSelected: (DynamicTableViewCell, IndexPath) -> Void = {_, _ in}
    public var showDivider: Bool
    
    public init(
        cellForRowAt: @escaping (DynamicTableViewCell, IndexPath) -> UITableViewCell = {_,_ in UITableViewCell()},
        count: Int = 0,
        height: CGFloat = 0,
        onSelected: @escaping (DynamicTableViewCell, IndexPath) -> Void = {_, _ in},
        showDivider: Bool = true) {
        self.cellForRowAt = cellForRowAt
        self.count = count
        self.height = height
        self.onSelected = onSelected
        self.showDivider = showDivider
    }
}
