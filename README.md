# FPGA_8LED_FSM
cyclone ii fpga, verilog, quartus ii

Mô tả máy trạng thái có chức năng phát hiện chuỗi bit 1011(2) và 1100(2) truyền nối tiếp từ ngõ vào DATA.
Ngõ ra Y1 = 1 khi phát hiện đúng chuỗi 1011(2), Y2 =1 khi phát hiện chuỗi 1100(2) Xung Ck đồng bộ, có f = 1Hz.
Chân Rs tích cực mức cao, khi RS tích cực thì ngõ ra là Y1 = 0, Y2 = 0.

Phân tích:
![image](https://github.com/PumkTbt/FPGA_8LED_FSM/assets/124877073/e7b2eef9-38d0-4149-bfd9-63f022fde9d9)

Mạch phát hiện chuỗi liên tục FSM, là mạch phát hiện chuỗi yêu cầu trong một dãy bit chạy liên tục. Nếu phát hiện chuỗi yêu cầu thì ngõ ra Y1 và Y2 sẽ lên 1.
Nếu chưa phát hiện chuỗi yêu cầu thì nó sẽ giữ giá trị là 0.
- Ck :Xung clock đồng bộ có f = 1Hz thì ta có : T = 1(s ) vậy nên, chu kì đổi giữa các trạng thái xung Ck là trong thời gian 1(s).

![image](https://github.com/PumkTbt/FPGA_8LED_FSM/assets/124877073/71569676-f4af-418d-b69e-e591f3fcfc75)
Lưu đồ trạng thái thể hiện 8 trạng thái chuyển đổi. Khi phát hiện chuỗi yêu cầu thì sẽ tương ứng với hai trạng thái là S110 và trạng thái S1011.

![image](https://github.com/PumkTbt/FPGA_8LED_FSM/assets/124877073/ea897223-553e-4ef4-b708-a75b8be02fe8)
- Y1: Ngõ ra phát hiện chuỗi 10112
- Y2: Ngõ ra phát hiện chuỗi 11002

![image](https://github.com/PumkTbt/FPGA_8LED_FSM/assets/124877073/c6c23a7b-689b-4e80-9be5-098ff114a3aa)
![image](https://github.com/PumkTbt/FPGA_8LED_FSM/assets/124877073/830fe56d-437c-40fe-9b61-ef52121cbb92)

Ở trường hợp này thì khi xung ck nó tích cực cạnh lên, và rs nó tích cực mức thấp thì khi ngõ vào data xuất hiện chuỗi bit cần tìm là 10112 hay
11002 thì chân ngõ ra sẽ tích cực lên 1. Ta thấy theo giản đồ xung kết quả 1, thì khi phát hiện chuỗi 10112 thì chân y1 sẽ tích cực lên mức 1. Đồng thời, cũng phát hiện ra
là có bit 1100 ngay sau đó, thì y2 tích cực lên bit 1.
- Tiếp theo chiều của chuỗi bit thì nó phát hiện tiếp chuỗi bit 11002, đáng nhẽ lúc này y2 nó sẽ tích cực lên 1. Nhưng khi ck tác động cạnh lên, mà Rs nó lại tích cực lên mức cao. Thì mặt dù có phát hiện chuỗi nhưng ngõ ra không tích cực lên mức 1.


