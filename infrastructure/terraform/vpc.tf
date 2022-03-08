resource "aws_vpc" "main" {                
   cidr_block       = var.MAIN_VPC_CIDR    
   instance_tenancy = "default"
}

resource "aws_subnet" "public_subnet" {    
   vpc_id =  aws_vpc.main.id
   cidr_block = "${var.PUBLIC_SUBNET}"       
}

resource "aws_subnet" "private_subnet" {
  vpc_id =  aws_vpc.main.id
  cidr_block = "${var.PRIVATE_SUBNET}"         
}

resource "aws_route_table" "private_route_table" { 
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"             
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
}

resource "aws_route_table" "public_route_table" {
    vpc_id =  aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"             
        gateway_id = aws_internet_gateway.internet_gateway.id
    }
}

resource "aws_route_table_association" "private_route_table_association" {
   subnet_id = aws_subnet.private_subnet.id
   route_table_id = aws_route_table.private_route_table.id
}

resource "aws_eip" "nat_ip" {
  vpc   = true
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_ip.id
  subnet_id = aws_subnet.public_subnet.id
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.main.id
  service_name = "com.amazonaws.${var.REGION}.s3"
}

resource "aws_internet_gateway" "internet_gateway" { 
  vpc_id =  aws_vpc.main.id               
}