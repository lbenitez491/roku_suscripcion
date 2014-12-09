<?php echo $header; ?>

<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
   
    <div class="table-responsive">
      <a id="a1" class="ADiv1Panel" href="#"><span class="">Order History</span></a>
      <!--Separador -->
      &nbsp <span class="Span3Div1Panel"> | </span> &nbsp
      <a id="a2" class="ADiv1Panel" href="#"><span class="">Subscribed channels</span></a>
      <!-- Separador -->
      &nbsp <span class="Span3Div1Panel"> | </span> &nbsp
      <a id="a3" class="ADiv1Panel" href="#"><span class="">Subscribe to a channel</span></a>
    </div>

    <div id="div1">
      <!-- Comienza la tabla de ordenes -->
      <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
        <h1><?php echo $heading_title; ?></h1>
        <?php if ($orders) { ?>
        <div class="table-responsive">
          <table class="table table-bordered table-hover">
            <thead>
              <tr>
                <td class="text-right"><?php echo $column_order_id; ?></td>
                <td class="text-left"><?php echo $column_status; ?></td>
                <td class="text-left"><?php echo $column_date_added; ?></td>
                <td class="text-right"><?php echo $column_product; ?></td>
                <td class="text-left"><?php echo $column_customer; ?></td>
                <td class="text-right"><?php echo $column_total; ?></td>
                <td></td>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($orders as $order) { ?>
              <tr>
                <td class="text-right">#<?php echo $order['order_id']; ?></td>
                <td class="text-left"><?php echo $order['status']; ?></td>
                <td class="text-left"><?php echo $order['date_added']; ?></td>
                <td class="text-right"><?php echo $order['products']; ?></td>
                <td class="text-left"><?php echo $order['name']; ?></td>
                <td class="text-right"><?php echo $order['total']; ?></td>
                <td class="text-right"><a href="<?php echo $order['href']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
        <div class="text-right"><?php echo $pagination; ?></div>
        <?php } else { ?>
        <p><?php echo $text_empty; ?></p>
        <?php } ?>
        <div class="buttons clearfix">
          <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
        </div>
        <?php echo $content_bottom; ?>
      </div>
      <!-- Termina la tabla de ordenes -->
      <?php echo $column_right; ?>
    </div>

    <div id="div2">
      <!-- Comienza la tabla de canales roku -->
      <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
        <h1>Subscribed channels<?php #echo $heading_title; ?></h1>
        <div class="table-responsive">
          <table class="table table-bordered table-hover">
            <thead>
              <tr>
                <td class="td1 text-left"><?php echo "ID Channel"; ?></td>
                <td class="text-left"><?php echo "Title"; ?></td>
                <td class="text-left"><?php echo "Code"; ?></td>
                <td></td>
              </tr>
            </thead>
            <tbody>
              <?php
              $servername = "127.0.0.1";
              $username = "root";
              $password = "Awdsawds2";
              $dbname = "roku_opencart";

              // Create connection
              $conn = mysqli_connect($servername, $username, $password, $dbname);
              // Check connection
              if (!$conn) {
                  die("Connection failed: " . mysqli_connect_error());
              }

              $sql = "SELECT * FROM roku_canal_suscripcion WHERE codigo_usuario = '567' ORDER BY id DESC";
              $result = mysqli_query($conn, $sql);

              if (mysqli_num_rows($result) > 0) {
                  // output data of each row
                  $i = 1;
                  while($row = mysqli_fetch_assoc($result)) { ?>
                       <tr>
                        <td class="text-left">#<?php echo $i; ?></td>
                        <td class="text-left"><?php echo $row['titulo_canal']; ?></td>
                        <td class="text-left"><?php echo $row['codigo_canal']; ?></td>
                        <td class="text-left"> <!--a href="suscripcion/delete-suscripcion.php?act=<?php echo $row['id'] ?>" onclick="myFunction()">Delete</a--> 
                        <button class="btn" onclick="myFunction(<?php echo $row['id'] ?>)">Delete</button>

                        </td>
                      </tr> <?php
                      $i = $i + 1;
                  }
              } else {
                  #echo "0 results";
              }

              mysqli_close($conn); ?>
            </tbody>
          </table>
        </div>
      
        <?php echo $content_bottom; ?>
      </div>
      <!-- Termina la tabla de canales roku -->
       <?php echo $column_right; ?>
    </div>

    <div id="div3">
      <h1>Suscribe to a Channel <?php #echo $heading_title; ?></h1>
      <br>
       <div class="div_success">
        <form action="suscripcion/suscripcion.php" method="post">
          <input class="input_form_success" type="text" name="input" placeholder="Enter the code." /> <br> <br>
          <input type="submit" class="btn submit_form_success" />
        </form>
      </div>
    </div>

    </div>
</div>
<?php echo $footer; ?>

<!--Scripts para hacer aparecer y desaparecer información-->
  <script>
    $('#a1').click(function(e) {
      e.preventDefault();
      $( "#div1" ).show();
      $( "#div2" ).hide();
      $( "#div3" ).hide();
    });

    $('#a2').click(function(e) {
      e.preventDefault();
      $( "#div1" ).hide();
      $( "#div2" ).show();
      $( "#div3" ).hide();
    });

    $('#a3').click(function(e) {
      e.preventDefault();
      $( "#div1" ).hide();
      $( "#div2" ).hide();
      $( "#div3" ).show();
    });
  </script>

  <script>
    function myFunction(parametro) {
        if(confirm("Are you sure you want to delete this channel?")){
          window.location.href = "suscripcion/delete-suscripcion.php?act=" + parametro;

        }
        
    }
  </script>