<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body>
    <h1 class="text-3xl font-bold underline">
        <?= $data['title']; ?>
    </h1>
    <?php $result = $data['result'] ?>

    <table class="min-w-full divide-y divide-gray-200">
        <thead>
            <tr>
                <!-- <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Id</th> -->
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Pakket Naam</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">AantalLessen</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">RijbewijsCategorie</th>
                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Prijs</th>
            </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
            <?php foreach ($result as $row) : ?>
                <tr>
                    <!-- <td class="px-6 py-4 whitespace-nowrap"><?= $row->Id ?></td> -->
                    <td class="px-6 py-4 whitespace-nowrap"><?= $row->PakketNaam ?></td>
                    <td class="px-6 py-4 whitespace-nowrap"><?= $row->AantalLessen ?></td>
                    <td class="px-6 py-4 whitespace-nowrap"><?= $row->Rijbewijscategorie ?></td>
                    <td class="px-6 py-4 whitespace-nowrap"><?= $row->Prijs ?></td>
                </tr>
            <?php endforeach ?>
        </tbody>
    </table>






</body>

</html>