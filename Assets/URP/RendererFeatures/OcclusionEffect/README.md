## OcclusionEffect
* 遮挡效果显示,使用Render Objects针对Occlusion Layer物体进行处理
* 添加两个Render Objects，一个用于Opaque Queue,另外一个用于Transparent Queue
  
## 处理流程
1. 渲染不透明物体
2. Occlusion Layer中Opaque Game Object进行处理
   * 判断深度是否大于当前深度
   * 大于则使用特定材质绘制此像素并写入深度
   * 否则抛弃 
     
3. 其他渲染流程...
4. 渲染透明物体
5. Occlusion Layer中Transparent Game Object进行处理
   * 判断深度是否大于当前深度
   * 大于则使用特定材质绘制此像素但不写入深度
   * 否则抛弃 