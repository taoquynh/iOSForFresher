# Nội dung 9 buổi
```
1. Công cụ lập trình, Ngôn ngữ Swift
    Giao diện Xcode, Simulator
    Tổng quan về MacOS và iOS swift
    Cài đặt môi trường
    Controls cơ bản, build và run ứng dụng
    Swift cơ bản
    Kỹ thuật debug
2. Làm việc với giao diện storyboard, file xib - UIView và các controls
    Sử dụng Storyboard kéo thả giao diện
    Tính chất UIView, toạ độ và kích thước, hiển thị
    Layout và subviews
    Layer
    CGAffineTransform
    UIView và các method
    UIGestureRecognizer
    Layout với NSContraint
    Custom Root ViewController
3. Cài đặt thư viện ngoài, layout với Stevia
    Setup project với thư viện bên thứ 3
    Cài đặt CocoadPods
    Stevia Layout qua các ví dụ căn bản
    Thực hành màn hình login, đăng ký
4. UIScrollView
    Cutomize UITableViewCell
    Expand Collapsible
    UICollectionView
5. TableView
    Protocol - Delegate
    Protocol - Delegate khác gì so với Target - Action handler
    Thực hành todolist
    Row Height
    Section Table View
    UITableView
    TableViewController
    TableView Tĩnh
    TableView mặc định
    TableView custom cell
    Tương tác với cell
6. UICollectionView
7. Sử dụng một số thư viện và Media
    Thư viện SlideMenu
    Thư viện TVKeyboardAvoidingScrollView
    Xin cấp quyền media từ thiết bị
    Chụp, quay video, ghi âm, truy cập thư viện ảnh
8. JWT authentication
    Sử dụng postman kiểm thử các API được dựng bằng JavaSpring hoặc Gogin
    JWT authentication
    Lazy Loading - Image Loading
9. Alamofire, Swifty JSON
    GET request
    Hứng sự kiện trả về bằng Closure function
    Convert JSON to Swift struct
    Concurrent queue, create request in concurrent queue
    DELETE request
    POST request
    Upload binary file together with parameters

```

### API
## Domain: http://45.118.145.149:8100
1. API đăng ký
- URL: /register
- Method: POST 
- Request: https://jsoneditoronline.org/?id=1c6b9f1c09b74d6ca436c19f07cf2d80
- Response: https://jsoneditoronline.org/?id=98ae04986fe34ddaaa7413f719572777

2. API đăng nhập
- URL: /login
- Method: POST
- Request: https://jsoneditoronline.org/?id=99e88fff5ceb4d16be03566e96fe746d
- Response: https://jsoneditoronline.org/?id=b57da20044ad4096963cb3f1c2f47ff9

3. List Issues ( Đã xử lý, chưa xử lý), Search Issue (token trong header)
- URL: /issues
- Method: GET 
- Response: https://jsoneditoronline.org/?id=659ed9f220104571b6e40f9f5d0243d8
```
Chưa đăng nhập trả mã lỗi 403
→ Chú ý: 
/issues?status=0&keyword=: Lấy issue bản thân tạo theo trạng thái (-1 lấy tất cả, 0 - chưa xử lý, 1 - đang xử lý, 2 - đã xử lý)
```

4. Get Issue detail (token trong header)
- URL: /issues/{id} 
- Method: GET 
- Response: https://jsoneditoronline.org/?id=9639d0d6022d4c7bacc83175622bf2eb

5. Get Profile (token trong header)
- URL: /profile
- Method: GET
- Response: https://jsoneditoronline.org/?id=fa36e1e42c664b9aaf968c16aaf1e4b3

6. Update Profile (token trong header)
- URL: /update-profile
- Method: PUT
- Request: https://jsoneditoronline.org/?id=2674bae561c044e7a86738a375d56a30

7. Create Issue (token trong header)
- URL: /create-issue
- Method: POST
- Request: https://jsoneditoronline.org/?id=54dd23034f4746dab6105f6acf4fbdfe

8. Upload image (token trong header)
- URL: /upload-file
- Method: POST
- Request: Form 


