-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: quizsystem
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exams` (
  `exam_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text,
  `created_by` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `duration_minutes` int DEFAULT '45',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`exam_id`),
  KEY `created_by` (`created_by`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `exams_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `exams_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams`
--

LOCK TABLES `exams` WRITE;
/*!40000 ALTER TABLE `exams` DISABLE KEYS */;
INSERT INTO `exams` VALUES (1,'Đề kiểm tra môn Toán','Đề kiểm tra 15 phút Toán',1,1,15,'2025-05-15 06:43:26'),(2,'Đề kiểm tra môn Toán','Đề kiểm tra 45 phút Toán',1,1,45,'2025-05-15 06:43:26'),(3,'Đề thi môn Vật lý','Đề kiểm tra 15 phút Vật lý',1,2,15,'2025-05-15 06:43:26'),(4,'Đề thi môn Vật lý','Đề kiểm tra 45 phút Vật lý',1,2,45,'2025-05-15 06:43:26'),(5,'Đề thi môn Lịch sử','Đề kiểm tra 15 phút Lịch sử',1,3,15,'2025-05-15 06:43:26'),(6,'Đề thi môn Lịch sử','Đề kiểm tra 45 phút Lịch sử',1,3,45,'2025-05-15 06:43:26'),(7,'Đề thi môn Sinh học','Đề kiểm tra 15 phút Sinh học',1,4,15,'2025-05-15 06:43:26'),(8,'Đề thi môn Sinh học','Đề kiểm tra 45 phút Sinh học',1,4,45,'2025-05-15 06:43:26'),(9,'Đề thi môn Địa lí','Đề kiểm tra 15 phút Địa lí',1,5,15,'2025-05-15 06:43:26'),(10,'Đề thi môn Địa lí','Đề kiểm tra 45 phút Địa lí',1,5,45,'2025-05-15 06:43:26');
/*!40000 ALTER TABLE `exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `option_a` varchar(255) NOT NULL,
  `option_b` varchar(255) NOT NULL,
  `option_c` varchar(255) NOT NULL,
  `option_d` varchar(255) NOT NULL,
  `correct_answer` enum('A','B','C','D') NOT NULL,
  `created_by` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `created_by` (`created_by`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'Trong các mệnh đề sau, mệnh đề nào là mệnh đề đúng?','Tổng của hai số tự nhiên là một số chẵn khi và chỉ khi cả hai số đều là số chẵn','Tích của hai số tự nhiên là một số chẵn khi và chỉ khi cả hai số đều là số chẵn','Tổng của hai số tự nhiên là một số lẻ khi và chỉ khi cả hai số đều là số lẻ','Tích của hai số tự nhiên là một số lẻ khi và chỉ khi cả hai số đều là số lẻ','D',1,1),(2,'Một lớp học có 16 học sinh học giỏi môn Toán; 12 học sinh học giỏi môn Văn; 8 học sinh vừa học giỏi môn Toán và Văn; 19 học sinh không học giỏi cả hai môn Toán và Văn. Hỏi lớp học có bao nhiêu học sinh?','40','45','39','38','C',1,1),(3,'Một lớp có 45 học sinh. Mỗi em đều đăng ký chơi ít nhất một trong hai môn: bóng đá và bóng chuyền. Có 35 em đăng ký môn bóng đá, 15 em đăng ký môn bóng chuyền. Hỏi có bao nhiêu em đăng ký chơi cả 2 môn?','5','6','3','7','A',1,1),(4,'Số tập con có 2 phần tử của tập M = {1; 2; 3; 4; 5; 6}','15','11','20','23','A',1,1),(5,'Lớp 10A có 45 học sinh, trong đó có 15 học sinh được xếp loại học lực giỏi, 20 học sinh được xếp loại hạnh kiểm tốt, 10 em vừa xếp loại học lực giỏi, vừa có hạnh kiểm tốt. Hỏi có bao nhiêu học sinh xếp loại học lực giỏi hoặc có hạnh kiểm tốt?','25','22','21','24','A',1,1),(6,'Cho hai bất phương trình 2x + y < 3 (1) và – x + 3y > 5 (2) và điểm A(0; 1). Kết luận nào sau đây là đúng?','Điểm A thuộc miền nghiệm của bất phương trình (1) và (2)','Điểm A thuộc miền nghiệm của bất phương trình (1) nhưng không thuộc miền nghiệm của (2)','Điểm A không thuộc miền nghiệm của bất phương trình (1) nhưng thuộc miền nghiệm của (2)','Điểm A không thuộc miền nghiệm của cả hai bất phương trình (1) và (2)','B',1,1),(7,'Tính diện tích tam giác có ba cạnh lần lượt là 5; 12; 13','29','30','40','45','B',1,1),(8,'Vectơ đối của vectơ - không là','Mọi vectơ khác vectơ - không','Không có vectơ nào','Chính nó','Mọi vectơ kể cả vectơ – không','C',1,1),(9,'Trong mặt phẳng tọa độ Oxy, cho hai điểm A(2;1), B(3;3). Tìm điểm M(x;y) để OABM là một hình bình hành','M(1; 2)','M(-1; 2)','M(1; -2)','M(-1; -2)','A',1,1),(10,'Trong mặt phẳng tọa độ Oxy, cho các điểm M(1;3), N(4;2). Nhận xét nào sau đây đúng nhất về tam giác OMN','Tam giác OMN là tam giác đều','Tam giác OMN vuông cân tại M','Tam giác OMN vuông cân tại N','Tam giác OMN vuông cân tại O','B',1,1),(11,'Mẫu số liệu cho biết sĩ số của 4 lớp 10 tại một trường Trung học: 45; 43; 50; 46. Tìm độ lệch chuẩn của mẫu số liệu này','2.50','2,55','2.54','2.56','B',1,1),(12,'Chiều cao của 5 học sinh lớp 10 đo được là: 154; 160; 162; 162; 165 (đơn vị: cm). Khoảng biến thiên của mẫu số liệu trên là','9','12','11','10','C',1,1),(13,'Bạn An muốn mua một cây bút mực và một cây bút chì. Các cây bút mực có 8  màu khác nhau, các cây bút chì cũng có 8 màu khác nhau. Như vậy bạn An có bao nhiêu cách chọn','64','66','65','67','A',1,1),(14,'Một người vào cửa hàng ăn, người đó chọn thực đơn gồm 1 món ăn trong 5 món, 1 loại quả tráng miệng trong 5 loại quả tráng miệng và 1 nước uống trong 3 loại nước uống. Có bao nhiêu cách chọn thực đơn','100','75','150','70','B',1,1),(15,'Trên giá sách có 5 quyển sách Tiếng Nga khác nhau, 6 quyển sách Tiếng Anh khác nhau và 8 quyển sách Tiếng Việt khác nhau. Số cách chọn hai quyển sách khác loại là','100','150','118','200','C',1,1),(16,'Vật nào sau đây được coi là chất điểm?','Một xe máy đi từ TP Hồ Chí Minh ra Hà Nội','Một xe ô tô khách loại 45 chỗ ngồi chuyển động từ giữa sân trường ra cổng trường','Một bạn học sinh đi từ nhà ra cổng','Một bạn học sinh đi từ cuối lớp lên bục giảng','A',1,2),(17,'Lúc 15 giờ 30 phút hôm qua, xe chúng tôi đang chạy trên quốc lộ 5, cách Hải Dương 10 km. Việc xác định vị trí của ô tô như trên còn thiếu yếu tố gì?','Vật làm mốc','Mốc thời gian','Thước đo và đồng hồ','Chiều dương trên đường đi','D',1,2),(18,'Một người lái ô tô đi thẳng 6 km theo hướng tây, sau đó rẽ trái đi thẳng theo hướng nam 4 km rồi quay sang hướng đông 3 km. Xác định quãng đường đi được và độ lớn độ dịch chuyển tổng hợp của ô tô','s = 13 km d = 5 km','s = 13 km d = 13 km','s = 13 km d = 3 km','s = 13 km d = 9 km','A',1,2),(19,'Hai xe ô tô chạy cùng chiều trên một đoạn đường thẳng với vận tốc 100 km/h và 80 km/h. Tính vận tốc của xe thứ nhất so với xe thứ 2. Chọn chiều dương là chiều chuyển động của hai xe','20','40','25','45','A',1,2),(20,'Hai bên sông AB cách nhau 70 km, một ca nô khi xuôi dòng AB sớm hơn 48 phút so với ca nô khi ngược dòng AB. Vận tốc của ca nô trong nước yên lặng là 30 km/h. Tính vận tốc của dòng nước','5','100','200','150','A',1,2),(21,'Một dòng sông rộng 100 m và dòng nước chảy với vận tốc 3 m/s so với bờ theo hướng Tây - Đông. Một chiếc thuyền đi sang ngang sông với vận tốc 4 m/s so với dòng nước. Tính độ lớn vận tốc của thuyền so với dòng sông','5','7','9','10','A',1,2),(22,'Nếu từ các độ cao khác nhau ném ngang các vật với cùng vận tốc thì vật nào ném ở độ cao lớn hơn sẽ có tầm xa','Nhỏ hơn','Lớn hơn','Bằng nhau','Còn phụ thuộc vào khối lượng của các vật','B',1,2),(23,'Lực tổng hợp của hai lực đồng quy có độ lớn lớn nhất khi hai lực thành phần','Cùng phương, cùng chiều','Cùng phương, ngược chiều','Hợp với nhau một góc khác không','Vuông góc với nhau','A',1,2),(24,'Có hai lực đồng qui có độ lớn bằng 9 N và 12 N. Trong số các giá trị sau đây, giá trị nào có thể là độ lớn của hợp lực?','30','15','25','20','B',1,2),(25,'Một vật có khối lượng 2 kg chuyển động thẳng nhanh dần đều từ trạng thái nghỉ và không đổi chiều chuyển động. Vật đó đi được 200 cm trong thời gian 2 s. Độ lớn hợp lực tác dụng vào nó là','1N','5N','2N','10N','C',1,2),(26,'Một vật trượt có ma sát trên một mặt phẳng nằm ngang. Nếu vận tốc của vật đó tăng lên 2 lần thì độ lớn lực ma sát trượt giữa vật và mặt tiếp xúc sẽ','Tăng 2 lần','Tăng 4 lần','Tăng 1 lần','Không đổi','D',1,2),(27,'Một vật lúc đầu nằm yên trên một mặt phẳng nhám nằm ngang. Sau khi được truyền một vận tốc đầu, vật chuyển động được một đoạn sau đó chuyển động chậm dần vì','Phản lực','Lực ma sát','Quán tính','Trọng lực','D',1,2),(28,'Một người đẩy một vật trượt thẳng đều trên sàn nhà nằm ngang với một lực có phương ngang với độ lớn 300 N. Khi đó, độ lớn của lực ma sát trượt tác dụng lên vật sẽ','Bằng trọng lượng','Lớn hơn 300 N','Bằng 300 N','Nhỏ hơn 300 N','C',1,2),(29,'Trong cuộc sống, có những tình huống lực ma sát có lợi nhưng có những tình huống lực ma sát có hại. Tình huống nào lực ma sát xuất hiện có hại?','Viết bảng','Đi bộ trên đường nhựa','Đi trên đường đất trời mưa','Thêm ổ bi vào các trục quay','C',1,2),(30,'Một người có thể bơi trong nước (khi nước không chảy thành dòng) với vận tốc 1,5 m/s. Người đó bơi trên một con sông, xuôi dòng từ điểm A đến điểm B sau đó bơi ngược lại từ B trở về. Biết tổng thời gian bơi là 2 phút và khoảng cách giữa A và B là 50 m. Vận tốc dòng chảy là','5','2','1','3','C',1,2),(31,'Nội dung nào sau đây phản ánh đúng về tiền đề chính trị của các cuộc cách mạng tư sản thời cận đại?','Chính sách cai trị của nhà nước phong kiến chuyên chế, thực dân gây bất mãn cho nhân dân','Sự tồn tại của nhà nước quân chủ lập hiến gây bất mãn cho giai cấp tư sản và quý tộc mới','Mâu thuẫn dân tộc gay gắt giữa nhân dân thuộc địa với chính quyền thực dân xâm lược','Mâu thuẫn giữa giai cấp tư sản và quý tộc mới với nhân dân lao động ngày càng sâu sắc','A',1,3),(32,'Sự bùng nổ cuộc Chiến tranh giành độc lập của 13 thuộc địa Anh ở Bắc Mỹ (cuối thế kỉ XVIII) xuất phát từ tiền đề chính trị nào sau đây?','Chính sách cai trị của nhà nước quân chủ lập hiến đã xâm phạm quyền lợi của tư sản','Sự tồn tại của nhà nước phong kiến chuyên chế gây bất mãn cho quần chúng nhân dân','Chế độ cai trị của thực dân Anh đã gây bất bình cho nhân dân các thuộc địa ở Bắc Mỹ','Sự tồn tại của chế độ nô lệ (ở miền Nam) đã kìm hãm sự phát triển của kinh tế Bắc Mỹ','C',1,3),(33,'Ở Anh, vào cuối thế kỉ XV - đầu thế kỉ XVI, sự xâm nhập của phương thức sản xuất tư bản chủ nghĩa vào nông nghiệp đã dẫn đến sự ra đời của tầng lớp nào?','Quý tộc phong kiến','Quý tộc mới','Chủ nô','Nông nô','B',1,3),(34,'Lực lượng nào sau đây thuộc Đẳng cấp thứ nhất trong xã hội Pháp (cuối thế kỉ XVIII)?','Giai cấp tư sản','Nông dân','Tăng lữ Giáo hội','Bình dân thành thị','C',1,3),(35,'Chiến tranh giành độc lập của 13 thuộc địa Anh ở Bắc Mỹ (cuối thế kỉ XVIII) bùng nổ trên cơ sở tiền đề xã hội nào sau đây?','Mâu thuẫn giữa quần chúng nhân dân với các thế lực phong kiến chuyên chế','BMâu thuẫn giai cấp giữa quý tộc phong kiến với nông dân và bình dân thành thị','Mâu thuẫn dân tộc giữa nhân dân thuộc địa với chính quyền thực dân xâm lược','Mâu thuẫn giữa đẳng cấp thứ ba với đẳng cấp Tăng lữ Giáo hội và Quý tộc','C',1,3),(36,'Ở Pháp, nền tảng của hệ tư tưởng dân chủ tư sản chính là','Cải cách tôn giáo','Văn hóa Phục hưng','Thuyết Kinh tế học cổ điển','Triết học Ánh sáng','D',1,3),(37,'Nội dung nào sau đây không phản ánh đúng ý nghĩa của trào lưu Triết học Ánh sáng ở Pháp (thế kỉ XVIII)?','Củng cố hệ tư tưởng của chế độ phong kiến','Thúc đẩy cách mạng tư sản Pháp phát triển đi lên','Tấn công vào hệ tư tưởng của chế độ phong kiến','Dọn đường cho cách mạng tư sản Pháp bùng nổ','A',1,3),(38,'Điểm tương đồng giữa Cách mạng tư sản Anh, Chiến tranh giành độc lập của 13 thuộc địa ở Bắc Mỹ và Cách mạng tư sản Pháp là gì?','Sử dụng tôn giáo cải cách làm “ngọn cờ” tập hợp lực lượng','Mở đường cho sự phát triển của chủ nghĩa tư bản','Sau cách mạng, chế độ quân chủ lập hiến được thiết lập','Giai cấp tư sản độc quyền lãnh đạo cách mạng','B',1,3),(39,'Chủ nghĩa đế quốc là hệ quả trực tiếp của quá trình xâm lược thuộc địa nhằm','Tìm kiếm thị trường, thu lợi nhuận và đầu tư tư bản ở nước ngoài','Thúc đẩy sự giao lưu kinh tế và văn hóa giữa các quốc gia, dân tộc','Di dân sang các nước chậm phát triển, giải quyết khủng hoảng dân số','Giúp đỡ kinh tế và khai hóa văn minh cho các nước chậm phát triển','A',1,3),(40,'Nội dung nào sau đây không phản ánh đúng ý nghĩa của cuộc Duy tân Minh Trị đối với Nhật Bản?','Đưa Nhật Bản từ một nước phong kiến trở thành một nước tư bản chủ nghĩa','Lật đổ chế độ quân chủ chuyên chế, đưa tới sự xác lập của chế độ cộng hòa','Thúc đẩy kinh tế Nhật Bản phát triển mạnh mẽ theo hướng tư bản chủ nghĩa','Giúp Nhật Bản được tránh nguy cơ xâm lược từ các nước thực dân phương Tây','B',1,3),(41,'Vào cuối thế kỉ XIX - đầu thế kỉ XX, sự kiện nào dưới đây đã góp phần mở rộng phạm vi của chủ nghĩa tư bản ở khu vực châu Á?','Cách mạng Tân Hợi ở Trung Quốc thành công','Duy tân Mậu Tuất (1898) ở Trung Quốc thành công','Cách mạng tháng Tám ở Việt Nam thành công','Nước Cộng hòa nhân dân Trung Hoa ra đời','A',1,3),(42,'Hình thức tiêu biểu của các tổ chức độc quyền ở Mỹ vào cuối thế kỉ XIX - đầu thế kỉ XX, là','công-xooc-xi-om','xanh-đi-ca','tơ-rớt','các-ten','C',1,3),(43,'Nội dung nào sau đây không phản ánh đúng về các tổ chức độc quyền ở các nước tư bản vào cuối thế kỉ XIX - đầu thế kỉ XX?','Tồn tại dưới nhiều hình thức khác nhau, như: các-ten, xanh-đi-ca, tơ-rớt,…','Tạo cơ sở cho bước chuyển của chủ nghĩa tư bản từ tự do cạnh tranh sang độc quyền','Đánh dấu chủ nghĩa tư bản chuyển từ giai đoạn độc quyền sang tự do cạnh tranh','Là sự liên minh giữa các nhà tư bản lớn để tập trung sản xuất hoặc tiêu thụ hàng hóa','C',1,3),(44,'Một trong những đặc trưng của chủ nghĩa tư bản đế quốc là sự xuất hiện của tầng lớp','Tư bản công nghiệp','Tư bản ngân hàng','Tư bản nông nghiệp','Tư bản tài chính','A',1,3),(45,'Chủ nghĩa tư bản hiện đại là thuật ngữ dùng để chỉ một giai đoạn phát triển của chủ nghĩa tư bản từ','Sau Chiến tranh thế giới thứ hai đến nay','Cuối thế kỉ XIX đến đầu thế kỉ XX','Sau Chiến tranh thế giới thứ nhất đến nay','Nửa sau thế kỉ XVII đến cuối thế kỉ XIX','A',1,3),(46,'Đâu là vai trò của trao đổi chất và chuyển hóa năng lượng đối với sinh vật?','Giúp sinh vật phân giải các chất độc hại sinh ra từ quá trình chuyển hóa','Giúp sinh vật chuyển hóa các chất phức tạp thành các chất đơn giản','Giúp sinh vật tồn tại và phát triển','Giúp sinh vật lấy được các chất từ môi trường','C',1,4),(47,'Quá trình chuyển hóa năng lượng trong sinh giới được chia thành mấy giai đoạn?','2','3','4','5','B',1,4),(48,'Ở giai đoạn phân giải, nhờ quá trình nào mà thế năng trong các phân tử hữu cơ được biến đổi thành động năng?','Quá trình sinh trưởng','Quá trình hô hấp','Quá trình cảm ứng','Quá trình quang hợp','B',1,4),(49,'Quá trình điều hòa trao đổi chất và chuyển hóa năng lượng ở động vật có đặc điểm nào sau đây?','Chịu sự chi phối của hormone và hệ hô hấp','Được điều chỉnh phù hợp với nhu cầu của cơ thể thông qua hormone và hệ thần kinh','Được điều chỉnh phù hợp với nhu cầu của cơ thể thông qua hormone và hệ tuần hoàn','Luôn chịu sự chi phối của hệ tuần hoàn','B',1,4),(50,'Phát biểu nào đúng khi nói về các nhân tố ảnh hưởng đến hoạt động trao đổi nước và dinh dưỡng khoáng?','Cường độ ánh sáng tăng trong ngưỡng xác định làm giảm cường độ thoát hơi nước, giảm sự hấp thụ nước và khoáng','Nếu nhiệt độ tăng quá cao, sự hấp thụ nước và khoáng sẽ giảm hoặc dừng hấp thụ','Ánh sáng thúc đẩy khí khổng mở, làm giảm tốc độ thoát hơi nước ở lá, giảm quá trình hấp thụ nước và khoáng','Trong giới hạn nhất định, độ ẩm đất tỉ lệ nghịch với khả năng hấp thụ nước và khoáng của hệ rễ','B',1,4),(51,'Vì sao trong trồng trọt, người ta thường sử dụng các loại phân vô cơ (đạm, kali) để bón thúc?','Vì các loại phân này cây có thể hấp thụ được ngay, tỉ lệ dinh dưỡng thấp, kìm hãm sự sinh trưởng và phát triển quá nhanh của cây trồng','Vì các loại phân này cần có thời gian phân hủy thành các chất hòa tan cây mới sử dụng được','Vì các loại phân này cây có thể hấp thụ được ngay, tỉ lệ dinh dưỡng cao, thúc đẩy cây sinh trưởng và phát triển mạnh','Vì thành phần dinh dưỡng của chúng ở dạng không hòa tan, cây không sử dụng được ngay mà từ từ hấp thụ','C',1,4),(52,'Trong tự nhiên, ở một số cây trồng như cà rốt, khoai tây,.. chất dự trữ trong củ sẽ được vận chuyển lên các cơ quan phía trên trong giai đoạn sinh trưởng, phát triển nào của thực vật?','Giai đoạn phát triển chiều cao','Giai đoạn kết quả','Giai đoạn nảy mầm','Giai đoạn ra hoa','C',1,4),(53,'Khi quan sát tiêu bản tế bào biểu bì mặt dưới của lá thài lài tía, thấy xuất hiện các cấu trúc gồm hai tế bào hình hạt đậu úp vào nhau. Các cấu trúc này là loại tế bào nào của lá?','Tế bào mô giậu.','Tế bào biểu bì','Tế bào mạch gỗ','Tế bào khí khổng','D',1,4),(54,'Trong thí nghiệm chứng minh quá trình vận chuyển nước ở thân, khi dùng dao cắt ngang phần thân và quan sát thì thấy xuất hiện những chấm có màu đậm trùng với màu của dung dịch nước màu. Những chấm có màu đậm này chính là','Mạch gỗ của thân','Khí khổng của thân','Mạch rây của thân','Biểu bì của thân','A',1,4),(55,'Vì sao một số loài thực vật có lá màu đỏ vẫn có khả năng quang hợp bình thường?','Vì lá của chúng vẫn chứa chất diệp lục','Vì các sắc tố màu đỏ có chứa diệp lục a','Vì các sắc tố đỏ có khả năng hấp thụ ánh sáng mạnh','Vì lá của chúng không chứa chất diệp lục','A',1,4),(56,'Nguyên lí của thí nghiệm sự tạo thành tinh bột trong quang hợp là','Một số dung môi hữu cơ có khả năng chuyển hóa tinh bột thành màu đỏ đặc trưng','Ethanol là thuốc thử tinh bột. Khi nhỏ iodine vào tinh bột, tinh bột sẽ chuyển thành màu xanh tím','Iodine là thuốc thử tinh bột. Khi nhỏ iodine vào tinh bột, tinh bột sẽ chuyển thành màu đỏ','Iodine là thuốc thử tinh bột. Khi nhỏ iodine vào tinh bột, tinh bột sẽ chuyển thành màu xanh tím','D',1,4),(57,'Vì sao trong thí nghiệm sự tạo thành tinh bột trong quang hợp cần sử dụng iodine làm thuốc thử?','Vì dung dịch iodine chuyển hóa tinh bột thành đường đơn dễ quan sát','Vì dung dịch iodine phản ứng với tính bột tạo thành màu xanh tím đặc trưng','Vì chỉ có dung dịch iodine mới tác dụng với tinh bột','Vì dung dịch iodine phản ứng với tính bột tạo thành màu đỏ đặc trưng','B',1,4),(58,'Trong thí nghiệm phát hiện có sự tạo thành khí oxygen trong quá trình quang hợp, việc thiết kế để cốc A ở chỗ tối, cốc B ở chỗ có ánh sáng nhằm mục đích','Tạo ra điều kiện quang hợp khác nhau: cây ở cốc A quang hợp bình thường, cây ở cốc B không quang hợp','Tạo ra điều kiện quang hợp khác nhau: cây ở cốc A quang hợp yếu, cây ở cốc B quang hợp mạnh','Tạo ra điều kiện quang hợp khác nhau: cây ở cốc A không quang hợp, cây ở cốc B quang hợp bình thường','Tạo ra điều kiện quang hợp khác nhau: cây ở cốc A quang hợp mạnh, cây ở cốc B quang hợp yếu','C',1,4),(59,'Trong thí nghiệm xác định có sự tạo thành tinh bột trong quá trình quang hợp ở cây xanh, khi nhỏ thuốc thử iodine, phần lá bị che không xuất hiện màu xanh tím đặc trưng là do','phần lá bị che không nhận được ánh sáng nên không thể quang hợp để tạo ra tinh bột','phần lá bị che không nhận được oxygen nên không thể quang hợp để tạo ra diệp lục','phần lá bị che không nhận được oxygen nên không thể quang hợp để tạo ra tinh bột','phần lá bị che không nhận được ánh sáng nên không thể quang hợp để tạo ra diệp lục','A',1,4),(60,'Phát biểu nào đúng khi nói về trao đổi khí qua hệ thống ống khí?','Ống khí lớn nhất là ống khí tận, tạo ra bề mặt trao đổi khí lớn','Hệ thống ống khí bao gồm các ống khí lớn phân thành thành các phế quản và phế nang','Ngành ruột khoang và giun dẹp trao đổi khí qua hệ thống ống khí','Lỗ thở có van đóng, mở điều tiết không khí ra, vào ống khí','D',1,4),(61,'Khoáng sản ở khu vực Mỹ Latinh tập trung chủ yếu ở khu vực nào sau đây?','Khu vực Trung Mỹ và ở phía nam sơn nguyên Guy-a-na','Vùng núi An-đét và phía bắc nam sơn nguyên Mê-hi-cô','Vùng núi An-đét và phía đông nam sơn nguyên Bra-xin','Vùng núi An-đét và phía tây nam sơn nguyên Guy-a-na','C',1,5),(62,'Tài nguyên khoáng sản đa dạng ở khu vực Mỹ Latinh là cơ sở để phát triển ngành nào sau đây?','Công nghiệp thực phẩm','Công nghiệp luyện kim','Công nghiệp khai khoáng','Công nghiệp dược phẩm','C',1,5),(63,'Các nước Mỹ Latinh hiện nay còn phụ thuộc nhiều nhất vào quốc gia nào sau đây?','Hoa Kì','Đức','Hà Lan','Pháp','A',1,5),(64,'Cộng đồng châu Âu đổi tên thành Liên minh châu Âu vào năm nào sau đây?','1957','1960','1967','1993','D',1,5),(65,'Tiền thân của Liên minh châu Âu ra đời vào năm nào sau đây?','1960','1957','1993','1967','B',1,5),(66,'Một phần lãnh thổ của quốc gia nào sau đây ở Đông Nam Á vẫn có mùa đông lạnh?','Phía bắc Mi-an-ma','Phía bắc Phi-lip-pin','Phía bắc của Lào','Phía nam Việt Nam','A',1,5),(67,'Đông Nam Á có vị trí địa - chính trị rất quan trọng do nguyên nhân chủ yếu nào sau đây?','Nền kinh tế phát triển mạnh và giàu có nguồn tài nguyên','Là nơi đông dân nhất thế giới, nhiều thành phần dân tộc','Nơi tiếp giáp giữa hai đại dương, vị trí cầu nối hai lục địa','Tập trung rất nhiều loại khoáng sản và khí hậu thuận lợi','C',1,5),(68,'Ở Tây Nam Á, dầu mỏ và khí tự nhiên phân bố chủ yếu ở khu vực nào sau đây?','Ven Địa Trung Hải','Ven biển Ca-xpi','Ven biển Đỏ','Ven vịnh Péc-xich','D',1,5),(69,'Dân cư khu vực Tây Nam Á theo tôn giáo chủ yếu nào sau đây?','Do Thái giáo','Ấn Độ giáo','Cơ đốc giáo','Hồi giáo','D',1,5),(70,'Hoa Kì có cơ cấu dân số','Vàng','Trẻ','Già','Già hoá','C',1,5),(71,'Hệ thống Cooc-đi-e có đặc điểm là','Có khí hậu ôn đới và hoang mạc','Độ cao trung bình dưới 2000 m','Nơi tập trung nhiều kim loại màu','Hướng núi Tây Bắc - Đông Nam','C',1,5),(72,'Kiểu khí hậu nào sau đây phổ biến ở vùng phía Đông và vùng Trung tâm Hoa Kì?','Cận nhiệt đới và xích đạo','Hoang mạc và ôn đới lục địa','Cận nhiệt đới và ôn đới','Ôn đới lục địa và hàn đới','C',1,5),(73,'Ngành công nghiệp nào sau đây chiếm phần lớn giá trị hàng công nghiệp xuất khẩu của Nhật Bản?','Công nghiệp hóa chất','Công nghiệp chế tạo','Công nghiệp luyện kim','Công nghiệp điện tử','B',1,5),(74,'Hai ngành nào sau đây có vai trò hết sức to lớn trong ngành dịch vụ của Nhật Bản?','Thương mại và tài chính','Du lịch và giao thông','Tài chính và du lịch','Thương mại và giao thông','A',1,5),(75,'Các kiểu khí hậu nào sau đây chiếm ưu thế ở miền Đông Trung Quốc?','Nhiệt đới gió mùa và ôn đới gió mùa','Cận nhiệt đới gió mùa và ôn đới gió mùa','Ôn đới lục địa và ôn đới gió mùa','Cận nhiệt đới gió mùa và ôn đới lục địa','A',1,5);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results` (
  `result_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `exam_id` int DEFAULT NULL,
  `score` float DEFAULT NULL,
  `submitted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`result_id`),
  KEY `user_id` (`user_id`),
  KEY `exam_id` (`exam_id`),
  CONSTRAINT `results_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `results_ibfk_2` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (1,2,1,6,'2025-05-15 06:43:26'),(2,2,3,10,'2025-05-15 06:43:26'),(3,2,1,3,'2025-05-17 07:16:11'),(41,2,1,2,'2025-05-30 09:17:43');
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_answers`
--

DROP TABLE IF EXISTS `student_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_answers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `result_id` int DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  `selected_answer` enum('A','B','C','D') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `result_id` (`result_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `student_answers_ibfk_1` FOREIGN KEY (`result_id`) REFERENCES `results` (`result_id`) ON DELETE CASCADE,
  CONSTRAINT `student_answers_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_answers`
--

LOCK TABLES `student_answers` WRITE;
/*!40000 ALTER TABLE `student_answers` DISABLE KEYS */;
INSERT INTO `student_answers` VALUES (1,1,1,'D'),(2,1,2,'C'),(3,1,3,'A'),(4,1,4,'B'),(5,1,5,'B'),(6,2,1,'A'),(7,2,2,'D'),(8,2,3,'A'),(9,2,4,'A'),(10,2,5,'A'),(11,3,12,'A'),(12,3,14,'A'),(13,3,13,'A'),(14,3,4,'A'),(15,3,3,'A'),(201,41,5,'A'),(202,41,15,'A'),(203,41,12,'B'),(204,41,8,'C'),(205,41,3,'C');
/*!40000 ALTER TABLE `student_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `subject_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`subject_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (5,'Địa lí'),(3,'Lịch sử'),(4,'Sinh học'),(1,'Toán'),(2,'Vật lý');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `role` enum('student','admin') DEFAULT 'student',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'teacher','$2a$12$0018FqKA6p5jk/rUbTcqiu9IPbxcshSEuOrp125JxDIhooHVfX0Iq','Admin','admin','2025-05-14 10:49:41'),(2,'student','$2a$12$QwQmWYdCXCuTdcIZR.X89emCXPSDrbIduc6wcSMEQctpb.dGJJZIq','Hoàng Bảo Hân','student','2025-05-14 10:49:41');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-04 11:29:19
