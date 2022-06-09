locals {
	tags = {
		ENV = "${var.env}"
		DEPT = "${var.team}"
	
	}
}

locals {
	name = "dvsbatch1-${var.env}"
}
