# Cơ sở dữ liệu

## DBMS

Hệ thống quản lý cơ sở dữ liệu (Database Management System) là một chương trình tương tác với người dùng, các ứng dụng khác và chính cơ sở dữ liệu để thu thập và phân tích dữ liệu. DBMS giúp tổ chức, lưu trữ và truy xuất dữ liệu được lưu trữ trong cơ sở dữ liệu. Nó cũng giúp kiểm soát quyền truy cập vào dữ liệu, cũng như đảm bảo tính toàn vẹn và bảo mật của dữ liệu. 

Một số ví dụ về DBMS: 

* <strong>MySQL</strong>: một DBMS nguồn mở được sử dụng rộng rãi cho các ứng dụng trên nền tảng web.
* <strong>Oracle</strong>: một DBMS mạnh mẽ, cấp độ doanh nghiệp thường được sử dụng trong các tổ chức lớn.
* <strong>Microsoft SQL Server</strong>: một DBMS được thiết kế cho nền tảng Windows thường được sử dụng trong môi trường doanh nghiệp.
* <strong>PostgreSQL</strong>: một DBMS mã nguồn mở được biết đến với khả năng hỗ trợ mạnh mẽ cho các giao dịch và đồng thời.
* <strong>MongoDB</strong>: một NoSQL DBMS được thiết kế để lưu trữ một lượng lớn dữ liệu ở định dạng linh hoạt giống JSON.

## Datatype in SQL Relationships of Database

### Datatype

Trong SQL, kiểu dữ liệu là một phân loại xác định loại giá trị mà một cột có thể chứa.Một số kiểu dữ liệu MySQL phổ biến bao gồm:

* <strong>INT</strong>: Được sử dụng để lưu trữ các giá trị số nguyên
* <strong>VARCHAR</strong>: Được sử dụng để lưu trữ các chuỗi ký tự có độ dài khác nhau
* <strong>CHAR</strong>: Dùng để lưu chuỗi ký tự có độ dài cố định
* <strong>DATE</strong>: Được sử dụng để lưu trữ ngày tháng
* <strong>DECIMAL</strong>: Dùng để lưu số thập phân
* <strong>FLOAT</strong>: Được sử dụng để lưu trữ số thực có độ chính xác đơn (float32)
* <strong>DOUBLE</strong>: Được sử dụng để lưu trữ các số thực có độ chính xác kép (float64)
* <strong>TINYINT</strong>: Được sử dụng để lưu trữ các giá trị số nguyên nhỏ
* <strong>MEDIUMINT</strong>: Được sử dụng để lưu trữ các giá trị số nguyên có kích thước trung bình
* <strong>BIGINT</strong>: Được sử dụng để lưu trữ các giá trị số nguyên lớn
* <strong>BLOB</strong>: Được sử dụng để lưu trữ các đối tượng (chẳng hạn như hình ảnh hoặc tài liệu) lên đến 65,535 bytes



### Relationships of Database
Trong cơ sở dữ liệu SQL có ba loại mối quan hệ: một-một, một-nhiều và nhiều-nhiều. Các mối quan hệ này được sử dụng để xác định cách dữ liệu trong các bảng khác nhau có liên quan với nhau.

* <strong>Một - một</strong>: Loại mối quan hệ này tồn tại khi mỗi hàng trong một bảng có liên quan đến chính xác một hàng trong bảng khác.

* <strong>Một - Nhiều</strong>: Loại mối quan hệ này tồn tại khi một hàng trong một bảng có thể liên quan đến nhiều hàng trong một bảng khác.

* <strong>Nhiều - Nhiều</strong>: Loại mối quan hệ này tồn tại khi một hàng trong một bảng có thể liên quan đến nhiều hàng trong một bảng khác và ngược lại.

## Aggregate functions

Trong SQL, <strong>hàm tổng hợp dữ liệu</strong> là một hàm thực hiện phép tính trên một tập hợp các giá trị và trả về một giá trị duy nhất. Một số <strong>hàm tổng hợp dữ liệu</strong> phổ biến là:

`AVG()` - tính giá trị trung bình của một tập hợp các giá trị

`COUNT()` - đếm số hàng trong một bảng

`MAX()` - tìm giá trị lớn nhất trong một tập hợp các giá trị

`MIN()` - tìm giá trị nhỏ nhất trong một tập hợp các giá trị

`SUM()` - tính tổng của một tập hợp các giá trị

## Query and Subquery

<strong>Query</strong> là một câu lệnh SQL được sử dụng để truy xuất dữ liệu từ một cơ sở dữ liệu. Câu lệnh SQL có thể được sử dụng để truy xuất dữ liệu từ một bảng hoặc từ nhiều bảng. Câu lệnh SQL có thể được sử dụng để thêm, sửa, xóa dữ liệu từ một bảng.

<strong>Subquery</strong> là một câu lệnh SQL được sử dụng như một phần của một câu lệnh SQL khác. Câu lệnh SQL bên trong được gọi là <strong>subquery</strong> và câu lệnh SQL bao quanh nó được gọi là <strong>outer query</strong>.

Ví dụ: 

```sql

SELECT * FROM Customers -- Query
WHERE CustomerID 
IN (SELECT CustomerID FROM Orders WHERE OrderDate='2022-01-01') -- Subquery

```

## Joins

Phép kết hợp được sử dụng trong SQL để kết hợp các hàng từ hai hoặc nhiều bảng dựa trên một cột có liên quan giữa chúng. Có một số kiểu liên kết, bao gồm INNER JOIN, OUTER JOIN, CROSS JOIN và self-joins.

<strong>INNER JOIN</strong>: chọn các bản ghi có giá trị khớp trong cả hai bảng. Nếu không khớp, kết quả là `NULL`.

Ví dụ:

```sql 
SELECT *
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;
```

<strong>OUTER JOIN</strong>: Có ba loại OUTER JOIN:
* `LEFT JOIN` trả về tất cả các hàng từ bảng bên trái và các hàng phù hợp từ bảng bên phải. Nếu không khớp, giá trị `NULL` được trả về cho các cột của bảng bên phải. 

    ```sql
    SELECT *
    FROM table1
    LEFT JOIN table2
    ON table1.id = table2.id;
    ```

* `RIGHT JOIN` trả về tất cả các hàng từ bảng bên phải và các hàng phù hợp từ bảng bên trái. Nếu không khớp, giá trị `NULL` được trả về cho các cột của bảng bên trái. 

    ```sql
    SELECT *
    FROM table1
    RIGHT JOIN table2
    ON table1.id = table2.id;
    ```

* `FULL JOIN` trả về tất cả các hàng từ cả hai bảng, bất kể có sự trùng khớp giữa chúng hay không. Nếu không khớp, giá trị `NULL` được trả về cho phía không khớp.

    ```sql
    SELECT *
    FROM table1
    FULL JOIN table2
    ON table1.id = table2.id;
    ```

<strong>CROSS JOIN</strong>: trả về tích Descartes của các hàng từ các bảng đã tham gia. Nó được sử dụng để trả về tất cả các hàng từ cả hai bảng, bất kể có sự trùng khớp giữa chúng hay không.

Ví dụ:

```sql
SELECT *
FROM table1
CROSS JOIN table2;
```

<strong>Self-join</strong>: là phép nối trong đó một bảng được nối với chính nó. Nó được sử dụng để so sánh các giá trị trong một cột với các giá trị khác trong cùng một cột trong cùng một bảng.

Ví dụ:

```sql
SELECT a.name AS employee, b.name AS manager
FROM employees a
JOIN employees b
ON a.manager_id = b.id;
```

## Index

Chỉ mục là một cấu trúc dữ liệu cho phép truy xuất các hàng từ một bảng nhanh hơn. Các chỉ mục có thể được tạo trên một hoặc nhiều cột của bảng và chúng cho phép hệ thống cơ sở dữ liệu tìm các hàng nhanh hơn và hiệu quả hơn.

Một số loại chỉ mục:

<strong>Unique index</strong>: Loại chỉ mục này đảm bảo rằng các cột được lập chỉ mục không chứa các giá trị trùng lặp.

```sql
CREATE UNIQUE INDEX idx_customers_email ON customers (email);
```

<strong>Primary index</strong>: Loại chỉ mục này được sử dụng để xác định duy nhất mỗi hàng trong bảng. <strong>Primary index</strong> thường là chỉ mục duy nhất.

```sql
CREATE TABLE customers (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255)
);
```

<strong>Clustered index</strong>: Loại chỉ mục này sắp xếp lại thứ tự vật lý của bảng và lưu trữ các hàng dữ liệu trong bảng theo cùng thứ tự như chỉ mục. Chỉ có thể có một <strong>Clustered index</strong> trên mỗi bảng.

```sql
CREATE CLUSTERED INDEX idx_customers_name ON customers (name);
```

<strong>Non-clustered index</strong>: Loại chỉ mục này không thay đổi thứ tự vật lý của các hàng trong bảng. Thay vào đó, nó lưu trữ một tham chiếu đến các hàng dưới dạng "con trỏ" trong chỉ mục. Có thể có nhiều chỉ mục không nhóm trên mỗi bảng.

```sql
CREATE INDEX idx_customers_email ON customers (email);
```

## Transaction

Một giao dịch là một tập hợp các câu lệnh SQL được thực thi như một đơn vị. Nó cho phép bạn thực hiện các thay đổi dữ liệu và sau đó hoàn tác chúng nếu có bất kỳ lỗi nào xảy ra.

Các câu lệnh SQL được thực thi trong một giao dịch được gọi là các câu lệnh trong giao dịch. Các câu lệnh trong giao dịch có thể là các câu lệnh INSERT, UPDATE, DELETE hoặc các câu lệnh DDL như CREATE, ALTER, DROP.

Các câu lệnh trong giao dịch có thể được thực thi thành công hoặc thất bại. Nếu một câu lệnh trong giao dịch thất bại, tất cả các thay đổi được thực hiện bởi các câu lệnh trước đó trong giao dịch sẽ được hoàn tác.

Các thuộc tín của giao dịch:

* <strong>Atomicity</strong>: Một giao dịch được thực hiện như một đơn vị. Nó có nghĩa là tất cả các câu lệnh trong giao dịch sẽ được thực hiện thành công hoặc thất bại.

* <strong>Consistency</strong>: Một giao dịch phải đảm bảo rằng dữ liệu của hệ thống luôn ở trạng thái hợp lệ. Nó có nghĩa là tất cả các thay đổi được thực hiện bởi giao dịch phải đảm bảo rằng dữ liệu luôn ở trạng thái hợp lệ.

* <strong>Isolation</strong>: Một giao dịch không ảnh hưởng đến các giao dịch khác. Nó có nghĩa là các giao dịch được thực hiện độc lập với nhau.

* <strong>Durability</strong>: Một giao dịch được thực hiện thành công sẽ luôn được lưu trữ trong cơ sở dữ liệu. Nó có nghĩa là các thay đổi được thực hiện bởi giao dịch sẽ được lưu trữ trong cơ sở dữ liệu và không bị mất.

Ví dụ:

```sql
BEGIN TRANSACTION;

UPDATE accounts
SET balance = balance - 100
WHERE id = 1;

UPDATE accounts
SET balance = balance + 100
WHERE id = 2;

COMMIT;
```

## PDO

PHP Data Objects (<strong>PDO</strong>) là lớp truy cập cơ sở dữ liệu cung cấp giao diện thống nhất để truy cập các cơ sở dữ liệu khác nhau trong PHP. Đó là một cách tiếp cận hướng đối tượng để truy cập cơ sở dữ liệu và trừu tượng hóa các chi tiết dành riêng cho cơ sở dữ liệu để kết nối và truy vấn cơ sở dữ liệu, cho phép các nhà phát triển viết mã di động trên các hệ thống cơ sở dữ liệu khác nhau.

Một số tính năng của <strong>PDO</strong>:
* <strong>PDO</strong> hỗ trợ các câu lệnh đã chuẩn bị sẵn và các truy vấn được tham số hóa, có thể giúp ngăn chặn các cuộc tấn công SQL injection.
* <strong>PDO</strong> cung cấp một giao diện thống nhất để làm việc với các loại cơ sở dữ liệu khác nhau, vì vậy bạn không cần sử dụng các chức năng khác nhau cho từng cơ sở dữ liệu.
* <strong>PDO</strong> có giao diện hướng đối tượng và có kích thước nhỏ.
* <strong>PDO</strong> hỗ trợ các transaction, vì vậy bạn có thể thực thi nhiều câu lệnh cơ sở dữ liệu dưới dạng một câu lệnh.

Ví dụ kết nối với MySQL:

```php
$dsn = 'mysql:host=localhost;dbname=testdb';
$username = 'user';
$password = 'password';

try {
    $db = new PDO($dsn, $username, $password);
} catch (PDOException $e) {
    // An error occurred
}
```

Khi bạn có một đối tượng PDO, bạn có thể sử dụng phương thức `query()` của nó để thực thi một câu lệnh SQL và `prepare()` của nó để chuẩn bị một câu lệnh để thực thi. Bạn cũng có thể sử dụng phương thức `fetch()` để truy xuất các hàng được trả về bởi câu lệnh SELECT.

```php

// Execute a query
$stmt = $db->query('SELECT * FROM users');
while ($row = $stmt->fetch()) {
    // Do something with the row
}

$stmt = $db->query('SELECT * FROM users');
$rows = $stmt->fetchAll();
foreach ($rows as $row) {
    // Do something with the row
}


// Prepare a statement
$stmt = $db->prepare('SELECT * FROM users WHERE username = ?');
$stmt->bindValue(1, $username, PDO::PARAM_STR);
$stmt->execute();
while ($row = $stmt->fetch()) {
    // Do something with the row
}

$stmt = $db->prepare('SELECT * FROM users WHERE username = :username');
$stmt->bindValue(':username', $username, PDO::PARAM_STR);
$stmt->execute();
while ($row = $stmt->fetch()) {
    // Do something with the row
}
```


## SQL Injection

SQL injection là một kiểu tấn công mạng cho phép kẻ tấn công thực thi các câu lệnh SQL độc hại đối với cơ sở dữ liệu. Những câu lệnh này có thể được sử dụng để thao túng dữ liệu hoặc để có quyền truy cập trái phép vào dữ liệu nhạy cảm.

Một cuộc tấn công SQL injection thường được khởi chạy bằng cách gửi một đầu vào độc hại đến một ứng dụng web, sau đó được chuyển đến cơ sở dữ liệu như một phần của truy vấn SQL. Nếu cơ sở dữ liệu không được bảo mật đúng cách, kẻ tấn công có thể chèn mã độc hại vào truy vấn được thực thi bởi cơ sở dữ liệu, cho phép chúng thao túng dữ liệu hoặc truy cập trái phép vào thông tin nhạy cảm.

Các cuộc tấn công SQL injection có thể rất nguy hiểm vì chúng có thể được sử dụng để đánh cắp dữ liệu nhạy cảm như thông tin đăng nhập, số thẻ tín dụng và thông tin cá nhân khác. Điều quan trọng là phải thực hiện các bước để ngăn chặn các cuộc tấn công SQL injection bằng cách làm sạch đúng cách đầu vào của người dùng và sử dụng các câu lệnh đã chuẩn bị khi tương tác với cơ sở dữ liệu.

Ví dụ:

```sql
SELECT * FROM books WHERE title LIKE '%' OR 1=1 -- %';
```

'`OR 1=1 --` ' là một phần của cụm từ tìm kiếm được hiểu là điều kiện bổ sung trong mệnh đề WHERE, điều này luôn đúng. Kết quả là truy vấn sẽ trả về tất cả các hàng trong bảng sách, bất kể giá trị của cột tiêu đề.

```sql
SELECT * FROM users WHERE username = 'admin'; DROP TABLE users; --' AND password = 'whatever password was entered';
```

'`DROP TABLE users; --` ' là một phần của mệnh đề WHERE, điều này sẽ xóa bảng người dùng. Kết quả là bảng người dùng sẽ bị xóa và tất cả dữ liệu sẽ bị mất, vô hiệu hóa hoàn toàn chức năng đăng nhâp của ứng dụng.

Một số cách để ngăn chặn SQL injection:

- Sử dụng các câu lệnh đã chuẩn bị thay vì truyền tham số trực tiếp vào câu lệnh SQL.

    ```php
    $stmt = $conn->prepare("SELECT * FROM users WHERE username = ? AND password = ?");
    $stmt->bind_param("ss", $username, $password);
    $stmt->execute();
    $result = $stmt->get_result();
    ```

- Xác thực kiểu dữ liệu của đầu vào của người dùng và chuyển đổi nó thành kiểu dữ liệu mong muốn.

    ```php
    $username = mysqli_real_escape_string($conn, $username);
    $password = mysqli_real_escape_string($conn, $password);
    ```

- Sử dụng prepared statements:

    ```php
    $stmt = $conn->prepare("SELECT * FROM users WHERE username = ? AND password = ?");
    $stmt->bind_param("ss", $username, $password);
    $stmt->execute();
    $result = $stmt->get_result();
    ```

- Luôn cập nhật cơ sở dữ liệu và ứng dụng web của bạn để sử dụng phiên bản mới nhất của các công cụ và thư viện.

- Phân quyền người dùng cơ sở dữ liệu để hạn chế các quyền truy cập của người dùng.

- Sử dụng các công cụ để phát hiện các cuộc tấn công SQL injection như SQLMap, Burp Suite, Acunetix, ... 

