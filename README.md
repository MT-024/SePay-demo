# SePay-demo
Đây là dự án demo tích hợp cổng thanh toán tự động qua mã QR ngân hàng sử dụng dịch vụ của SePay. Hệ thống cho phép tự động xác nhận đơn hàng ngay khi khách hàng chuyển khoản thành công mà không cần can thiệp thủ công.
Đường link youtube demo: 
# System required
Web Server: XAMPP, Laragon hoặc bất kỳ môi trường hỗ trợ PHP & MySQL.
Tunneling Tool: Ngrok (để nhận Webhook trên localhost).
Tài khoản SePay: Đã kết nối với ngân hàng
# Setup
Ở đây thì mình dùng Xampp và Ngrok.
**0. Đăng ký tạo TK SePay, liên kết tài khoản ngân hàng và tạo mã QR ảo.
1. Thiết lập database
2. Cấu hình Source Code**
Copy thư mục dự án vào C:\xampp\htdocs\sepay_demo
Chỉnh sửa file db_connect.php: Cập nhật username, password của MySQL
Chỉnh sửa file order.php: Cập nhật số tài khoản và ngân hàng của bạn tại dòng hiển thị thẻ <img> QR
**3. Cấu hình Ngrok (Webhook Tunnel)**
Mở terminal và chạy lệnh: ngrok http 80.
Copy đường dẫn Forwarding (ví dụ: https://xyz.ngrok-free.dev).
Truy cập Dashboard SePay -> Webhook -> Thêm mới
# Cách chạy Demo
Truy cập http://localhost/sepay_demo/order.php.
Nhập số tiền và nhấn Đặt hàng.
Dùng App ngân hàng quét mã QR và thực hiện thanh toán (giữ nguyên nội dung DHxxx và số tiền đúng nếu chọn chuyển khoản thủ công).
Đợi vài giây để màn hình tự động chuyển sang trạng thái Thành công.
# Cấu trúc thư mục
# Flow hoạt động
SePay-demo/
├── database/                              
├── sepay_demo/  # Chứa dữ liệu dự án
│   ├── check_payment_status.php/          # API hỗ trợ Ajax kiểm tra trạng thái đơn hàng
│   ├── db_connect.php/                    # Khởi tạo kết nối MySQLi
│   ├── order.php/                         # Giao diện đặt hàng và cổng thanh toán QR
│   ├── sepay_webhook.php/                 # Endpoint nhận dữ liệu từ SePay và cập nhật DB
│   
