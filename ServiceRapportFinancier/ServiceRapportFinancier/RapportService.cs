using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;

namespace WCFGestionRapport
{
    public class RapportService : IRapportService
    {
        private readonly string connectionString = "Server=localhost;Database=banque;User ID=root;Password=;";

        public RapportService()
        {
            CreerTableSiInexistante();
        }

        // Création de la table 'rapport' si elle n'existe pas
        private void CreerTableSiInexistante()
        {
            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                conn.Open();
                string creationTableQuery = @"
                    CREATE TABLE IF NOT EXISTS rapport (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        numero_compte VARCHAR(50) NOT NULL,
                        date_debut DATE NOT NULL,
                        date_fin DATE NOT NULL,
                        solde_debut DOUBLE NOT NULL,
                        solde_fin DOUBLE NOT NULL
                    );";
                using (MySqlCommand command = new MySqlCommand(creationTableQuery, conn))
                {
                    command.ExecuteNonQuery();
                }
            }
        }

        public Rapport GenererRapportCompte(string numeroCompte, DateTime dateDebut, DateTime dateFin)
        {
            double soldeDebut = 1000;  // Simulé
            double soldeFin = 2000;    // Simulé

            // Insertion des données dans la table 'rapport'
            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                conn.Open();
                string insertionQuery = @"
                    INSERT INTO rapport (numero_compte, date_debut, date_fin, solde_debut, solde_fin)
                    VALUES (@NumeroCompte, @DateDebut, @DateFin, @SoldeDebut, @SoldeFin);";
                using (MySqlCommand command = new MySqlCommand(insertionQuery, conn))
                {
                    command.Parameters.AddWithValue("@NumeroCompte", numeroCompte);
                    command.Parameters.AddWithValue("@DateDebut", dateDebut);
                    command.Parameters.AddWithValue("@DateFin", dateFin);
                    command.Parameters.AddWithValue("@SoldeDebut", soldeDebut);
                    command.Parameters.AddWithValue("@SoldeFin", soldeFin);
                    command.ExecuteNonQuery();
                }
            }

            // Retourne le rapport généré
            return new Rapport
            {
                NumeroCompte = numeroCompte,
                DateDebut = dateDebut,
                DateFin = dateFin,
                SoldeDebut = soldeDebut,
                SoldeFin = soldeFin
            };
        }

        public List<Rapport> HistoriqueRapports(string numeroCompte)
        {
            var rapports = new List<Rapport>();
            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT * FROM rapport WHERE numero_compte = @NumeroCompte;";
                using (MySqlCommand command = new MySqlCommand(query, conn))
                {
                    command.Parameters.AddWithValue("@NumeroCompte", numeroCompte);
                    using (var reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            rapports.Add(new Rapport
                            {
                                NumeroCompte = reader["numero_compte"].ToString(),
                                DateDebut = Convert.ToDateTime(reader["date_debut"]),
                                DateFin = Convert.ToDateTime(reader["date_fin"]),
                                SoldeDebut = Convert.ToDouble(reader["solde_debut"]),
                                SoldeFin = Convert.ToDouble(reader["solde_fin"])
                            });
                        }
                    }
                }
            }
            return rapports;
        }
    }
}
