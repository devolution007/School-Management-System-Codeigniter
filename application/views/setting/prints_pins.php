<!DOCTYPE html>
<html <?php echo $this->customlib->getRTL(); ?>>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><?php echo $this->customlib->getAppName(); ?></title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <meta http-equiv="Cache-control" content="no-cache">
        <meta name="theme-color" content="#424242" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    </head>
    <body>
            <div class="container mt-5 p-5">
                <div class="row">
                  <?php foreach($scretch_cards["scretch_card_pins"] as $sc): ?>
                    <div class="col-md-6">
                        <table class="table table-bordered border border-dark">
                            <tbody>
                                <tr>
                                    <th>SERIAL NO</th>
                                    <td><?= $sc->serial_no ?></td>
                                </tr>
                                <tr>
                                    <th>PIN</th>
                                    <td><?= $sc->code ?></td>
                                </tr>
                                <tr>
                                    <th>CREATED ON</th>
                                    <td><?= $sc->created_on ?></td>
                                </tr>
                                <tr>
                                    <th>VALIDITY</th>
                                    <td><?= $sc->limits ?></td>
                                </tr>
                                <tr>
                                    <th>WEBSITE</th>
                                    <td><?= site_url() ?></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <?php endforeach; ?>
                </div>
            </div>
    </body>
    <script>
        window.print();
    </script>
</html>