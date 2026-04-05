# SePay-demo
## Topic : Tích hợp thanh toán tự động qua SePay

Đây là dự án demo tích hợp cổng thanh toán tự động qua mã QR ngân hàng sử dụng dịch vụ của SePay. Hệ thống cho phép tự động xác nhận đơn hàng ngay khi khách hàng chuyển khoản thành công mà không cần can thiệp thủ công.

* **Demo Video** : https://youtu.be/uuc7j0walfk
* 0:00 - 0:29: Giao diện sau khi tạo VA, tạo webhooks
* 0:29 - end : Bắt đầu demo

## Yêu cầu hệ thống 
* **Web Server** : XAMPP, Laragon hoặc bất kỳ môi trường hỗ trợ PHP & MySQL.
* **Tunneling Tool** : Ngrok (để nhận Webhook trên localhost).
* **Tài khoản SePay** : Đã kết nối với ngân hàng và tạo mã QR.

## Hướng dẫn cài đặt (Setup)
*Ở đây sử dụng môi trường XAMPP và Ngrok.*

* **0. Chuẩn bị** : Đăng ký tạo tài khoản SePay, liên kết tài khoản ngân hàng và tạo mã QR ảo.
* **1. Thiết lập Database** : Khởi tạo cơ sở dữ liệu `host_sepay` và import các bảng cần thiết.
* **2. Cấu hình Source Code** :
    * Copy thư mục dự án vào `C:\xampp\htdocs\sepay_demo`
    * Chỉnh sửa file `db_connect.php`: Cập nhật `username`, `password` của MySQL.
    * Chỉnh sửa file `order.php`: Cập nhật số tài khoản và ngân hàng của bạn tại dòng hiển thị thẻ `<img>` QR.
* **3. Cấu hình Ngrok (Webhook Tunnel)** :
    * Mở terminal và chạy lệnh: `ngrok http 80`
    * Copy đường dẫn Forwarding (ví dụ: `https://xyz.ngrok-free.dev`).
    * Truy cập Dashboard SePay -> Webhook -> Thêm mới và dán đường dẫn vừa copy.

## Cách chạy Demo
1. Truy cập vào đường dẫn: `http://localhost/sepay_demo/order.php`
2. Nhập số tiền và nhấn **Đặt hàng**.
3. Dùng App ngân hàng quét mã QR và thực hiện thanh toán (giữ nguyên nội dung `DHxxx` và đúng số tiền nếu chọn chuyển khoản thủ công).
4. Đợi vài giây để màn hình tự động chuyển sang trạng thái **Thành công**.
## Flow Hệ thống
<img width="1366" height="768" alt="Screenshot (3941)" src="https://github.com/user-attachments/assets/f41bb17d-117b-4bcd-9fa6-4b24394e6c64" />

## Cấu trúc thư mục
```text
SePay-demo/
├── database/                              # Chứa file SQL khởi tạo cơ sở dữ liệu
└── sepay_demo/                            # Chứa mã nguồn chính của dự án
    ├── check_payment_status.php           # API hỗ trợ Ajax kiểm tra trạng thái đơn hàng
    ├── db_connect.php                     # Khởi tạo kết nối MySQLi
    ├── order.php                          # Giao diện đặt hàng và cổng thanh toán QR
    └── sepay_webhook.php                  # Endpoint nhận dữ liệu từ SePay và cập nhật DB
