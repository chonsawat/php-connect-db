<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>

<body>
  <div class="container">
    <div class="row">
      <h1>Home Page</h1>
      <table class="table table-light table-striped">
        <thead>
          <tr>
            <th>วิชา</th>
            <th>เรื่อง</th>
            <th>ครู</th>
            <th>สถานะการส่ง</th>
            <th>การยืนยันจากผู้สอน</th>
            <th>ยืนยันการส่ง</th>
          </tr>
        </thead>
        <tbody>
          <?php
          include 'service\db_connection.php';
          $conn = OpenCon();
          // echo "Connected Successfully";

          $sql = "SELECT * FROM Homework INNER JOIN User ON User.user_username = Homework.homework_user_id";
          $response = mysqli_query($conn, $sql);
          while ($row = mysqli_fetch_array($response)) { ?>
            <tr>
              <td><?php echo $row['homework_subject'] ?></td>
              <td><?php echo $row['homework_title'] ?></td>
              <td><?php echo $row['user_name'] ?></td>
              <td>Status</td>
              <td>รอตรวจ</td>
              <td><button class="btn btn-success">ส่ง</button></td>
            </tr>
          <?php
          }
          ?>
        </tbody>
      </table>
    </div>
    <div class="row">
      <?php
      $sql = "SELECT * FROM Homework";
      $response = mysqli_query($conn, $sql);
      $result = mysqli_num_rows($response);
      echo "<p>Count: $result </p>";  

      CloseCon($conn);
      ?>
    </div>


  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>

</html>