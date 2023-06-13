<?php

class LesPakketModel
{
    private $db;

    function __construct()
    {
        $this->db = new Database();
    }
    function getLesPakket()
    {
        $sql = "SELECT
        CONCAT(LeerlingPerPakket.LesPakkteId, ' ' ,LeerlingPerPakket.StartDatumRijlessen, '' , IFNULL(LeerlingPerPakket.DatumRijBijsBehaald, '')) AS Naam,
        LesPakket.PakketNaam,
        LesPakket.AantalLessen,
        LesPakket.Prijs,

      FROM
      Leerling
      JOIN LeerlingPerPakket ON Leerling.LeerlingId = Leerling.Id
      JOIN LesPakkte ON Leerling.LesPakkteId = LesPakkte.Id
      ORDER BY
  (SELECT COUNT(*) FROM LesPakket WHERE  LesPakkte.Id = LeerlingPerPakket.LesPakkteId) DESC;";

        $this->db->query($sql);

        return $this->db->resultSet();
    }
}
