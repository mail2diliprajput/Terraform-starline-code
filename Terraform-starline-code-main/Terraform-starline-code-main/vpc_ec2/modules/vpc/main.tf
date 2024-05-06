# VPC 
resource "aws_vpc" "my_vpc" {
  cidr_block       = "var.cidr"
  instance_tenancy = "default"

  tags = {
    Name = "var.my_vpc"
  }
}

# Create Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.create_public_subnet ? var.public_subnet : var.private_subnet
  availability_zone = ""




  tags = {
    Name = "public_subnet"
  }
}



# Create Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "var.private_subnet"
  availability_zone = "var.availability_zone"

  tags = {
    Name = "private_subnet"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "var.igw"
  }
}

# Create Route Table 
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "var.route_table"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "var.my_route_table"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.my_vpc.id
  route = {
    cidr_block = var.private_subnet
  }
}

# aws_route_table_association
resource "aws_route_table_association" "public_subnet_associate" {
route_table_id = aws_route_table.route_table.id
subnet_id = aws_subnet.public_subnet.id
}