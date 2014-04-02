# HTACollectionView

This project is an example of using `UICollectionView` to change the size (in this case the Height) of the `UICollectionViewCell` on click.

This can be done in `UITableView` as well. However there is one advantage with this approach. If any more views need to animated in with the size change of the `UICollectionViewCell`, that can be accomplished by using the `applyLayoutAttributes:layoutAttributes` method. This example fades in a `UILabel` on expansion and fades it out on collapse.

![Screen Shot](https://raw.github.com/malolans/HTACollectionView/master/ScreenCap.gif)
