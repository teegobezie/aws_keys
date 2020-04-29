provider "aws" {
	region = "us-east-1"
	profile = "default"
}


module "team1" {
    source = "../template"
    team_name = "team1"

}

module "team2" {
    source = "../template"
    team_name = "team2"

}