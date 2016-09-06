# UI-04-UIScrollView-
UIScrollView九宫格和滚动条的注意点

- 如果想获取ScrollView的九宫格中的最后一个控件，那么可以直接获取到ScrollView子控件的最后一个
     但是ScrollView中有两个滚动条也是属于ScrollView的子控件，这两个滚动条可能干扰到子控件的顺序
     所以想获取ScrollView子控件的最后一个需要关闭垂直滚动条和水平滚动条