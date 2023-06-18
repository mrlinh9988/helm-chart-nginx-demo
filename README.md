## Kiểm tra xem helm template đã viết đúng cú pháp hay chưa (phải đang đứng trong thư mục chart)
    helm lint ./

## Có những giá trị dùng chung được sẽ định nghĩa trong __helper.tpl, trên docs gọi là Named Templates


##  Kiểm tra xem các giá trị được fill vào template như nào, phải ở trong thư mục chart mới dùng ./:
    helm template <release_name> ./ -f <value_file>

## nindent là xuống dòng + thụt đầu dòng
## indent là chỉ thụt đầu dòng

## {{- define "common.labels" -}} # - ở cuối sẽ xóa 1 lần xuống dòng


## Ta có thể thêm các custome value vào các file yaml khác , khi đó ta muốn upgrade helm bằng lệnh sau
    helm upgrade <release_name> ./ -f <custome_file_value>

## Chú ý là ta ko thể thay đổi giá trị của labels khi đã được deploy vì label là immutable trong K8S
## Nên nếu muốn đổi giá trị của label ta phải uninstall helm cũ và install lại
## Còn các property khác thì có thể sửa đổi upgrade thoải mái


## Đóng gói helm chart
    helm package <chart_path> -d <output_path> 
    VD: helm package ./nginx -d ./publish 

    
## Trước khi publish helm lên git phải tạo file index.yaml bằng lệnh sau, đứng ở thư mục cùng mức với chart
    helm repo index .