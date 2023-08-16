locals {
  students = {
    # The map of student to create a server for, and their associated ssh keys.
    # NOTE: It's possible to enter the name of your team, instead of your own.
    # bryan = {
    #   ssh_keys = [
    #     "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIMV/QrTO9+A0I2VCknmL56pEI+1Ekw6/9s6613NLPxTZAAAACHNzaDpmbG94 bryanhonof@Bryans-MBP",
    #     "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIuAcOS6oFayeYpmbe8xDPGKJels0OWq0NzrZxWCLX7d"
    #   ]
    # }
     Thibe = {
      ssh_keys =[
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDjZDmj6ZxrMLbzUnZ2SGP+0csZTAHT5A25FHyahS8AmZhn27sODNVgJnQV9B7/Lk+LLROzhvI18WY/SqiOP/FRFXK+x8J6GvSQGmlqYqRqI3gb9RF7xNvJT2ostC27I9W0myMAFRQYBMXJtQYDUG5gnmrDoPWlfRwIcSG/bIuXDA9ofs2ui63216wws53MzJgVZ5KK8pD3YBAtK40Y7T0Vzmbruf68ZVjuo0nY+E/iAzXrckZQgh90CX+YBiXr1BKFGv79R7v9pQ/2crpaVlN0omOEAmOebnLXiPaKkaa0PlJZ569ipfI+2cNXIjGi1kNj5IsVdmNr4cUrXpW3JeZu6xrMdrxzrfTfMvL9WrlUh8tKY7OfH0LtX7OfgnxMdkFDaz9M7T5q0NOg6iyn8WfdqXd495vb9bypGBt9s0pGKU3wPJE04VFi2rJ2g8jrcMfK3Q1JaYddBw8MTS86HwbgWT1mH7HoqRu/p221loG5DEbd+nqK0usd/EfY7UUu7tM= gebruiker@DESKTOP-BEAVFHB"      
      ]
    }
  }
}

module "student_servers" {
  for_each     = local.students
  source       = "./modules/student_server"
  student_name = each.key
  ssh_keys     = each.value.ssh_keys
}
