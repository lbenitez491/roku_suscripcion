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

    <h1>
      Enter the code of your channel
    </h1> <br>
    <div class="div_success">
      <form action="suscripcion/suscripcion.php" method="post">
        <input class="input_form_success" type="text" name="input" placeholder="Enter the code." /> <br> <br>
        <input type="submit" class="btn submit_form_success" />
      </form>
    </div>
    <div class="buttons">
        <div class="pull-right">
          <a href="index.php?route=account/order" class="btn btn-primary"> <?php #echo $button_continue; ?> Or you can add your code in the Roku panel.</a>
        </div>
    </div>

    <!--<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <?php echo $text_message; ?>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?>
    </div>-->
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>