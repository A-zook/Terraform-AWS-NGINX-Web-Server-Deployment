module "network" {
  source        = "../../modules/network"
  vpc_cidr      = "10.0.0.0/16"
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  azs           = ["us-east-1a", "us-east-1b"]
  env           = var.env
}

module "compute" {
  source          = "../../modules/compute"
  ami_id          = var.ami_id
  instance_type   = "t3.micro"
  subnet_id       = module.network.public_subnets[0]
  subnets         = module.network.public_subnets
  security_groups = [aws_security_group.web_sg.id]
  user_data       = file("user_data.sh")
  env             = var.env
}

module "data" {
  source       = "../../modules/data"
  bucket_name  = "my-tf-backend-joshua"
  environment  = var.environment
}

resource "aws_security_group" "web_sg" {
  name        = "${var.env}-web-sg"
  description = "Allow HTTP and SSH"
  vpc_id      = module.network.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web" {
  ami           = "ami-09f4814ae750baed6"  # use a valid Amazon Linux 2 AMI
  instance_type = "t3.micro"
  key_name      = "May-Key-Pair"  # your existing key pair

  user_data = file("user_data.sh")  # path to your script

  tags = {
    Name = "TerraformNGINXWeb"
  }
}
