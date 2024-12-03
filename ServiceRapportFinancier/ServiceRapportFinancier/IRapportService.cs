using System;
using System.Collections.Generic;
using System.ServiceModel;

namespace WCFGestionRapport
{
    [ServiceContract]
    public interface IRapportService
    {
        [OperationContract]
        Rapport GenererRapportCompte(string numeroCompte, DateTime dateDebut, DateTime dateFin);

        [OperationContract]
        List<Rapport> HistoriqueRapports(string numeroCompte);
    }

    public class Rapport
    {
        public string NumeroCompte { get; set; }
        public DateTime DateDebut { get; set; }
        public DateTime DateFin { get; set; }
        public double SoldeDebut { get; set; }
        public double SoldeFin { get; set; }
    }
}
