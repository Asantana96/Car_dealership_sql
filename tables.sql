CREATE TABLE "service_ticket"(
    "service_ticket_id" SERIAL NOT NULL,
    "customer_id" INTEGER NOT NULL
);
ALTER TABLE
    "service_ticket" ADD PRIMARY KEY("service_ticket_id");
CREATE TABLE "mechanics"(
    "mechanic_id" SERIAL NOT NULL,
    "service_ticket_id" INTEGER NOT NULL,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "mechanics" ADD PRIMARY KEY("mechanic_id");
CREATE TABLE "repairs"(
    "repair_id" SERIAL NOT NULL,
    "mechanic_id" BIGINT NOT NULL
);
ALTER TABLE
    "repairs" ADD PRIMARY KEY("repair_id");
CREATE TABLE "invoice"(
    "invoice_id" SERIAL NOT NULL,
    "date_of_purchased" DATE NOT NULL
);
ALTER TABLE
    "invoice" ADD PRIMARY KEY("invoice_id");
CREATE TABLE "customer"(
    "customer_id" SERIAL NOT NULL,
    "invoice_id" INTEGER NOT NULL,
    "sales_id" INTEGER NOT NULL,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "customer" ADD PRIMARY KEY("customer_id");
CREATE TABLE "car"(
    "car_id" SERIAL NOT NULL,
    "make" VARCHAR(255) NOT NULL,
    "model" VARCHAR(255) NOT NULL,
    "year" INTEGER NOT NULL,
    "color" VARCHAR(255) NOT NULL,
    "used_or_new" VARCHAR(255) NOT NULL,
    "repair_id" INTEGER NOT NULL,
    "sales_id" INTEGER NOT NULL
);
ALTER TABLE
    "car" ADD PRIMARY KEY("car_id");
CREATE TABLE "sales_rep"(
    "sales_id" SERIAL NOT NULL,
    "first_name" VARCHAR(255) NOT NULL,
    "last_name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "sales_rep" ADD PRIMARY KEY("sales_id");
CREATE TABLE "car_purchase_id"(
    "car_purchase_id" SERIAL NOT NULL,
    "car_id" INTEGER NOT NULL,
    "invoice_id" INTEGER NOT NULL
);
ALTER TABLE
    "car_purchase_id" ADD PRIMARY KEY("car_purchase_id");
ALTER TABLE
    "mechanics" ADD CONSTRAINT "mechanics_service_ticket_id_foreign" FOREIGN KEY("service_ticket_id") REFERENCES "service_ticket"("service_ticket_id");
ALTER TABLE
    "service_ticket" ADD CONSTRAINT "service_ticket_customer_id_foreign" FOREIGN KEY("customer_id") REFERENCES "customer"("customer_id");
ALTER TABLE
    "customer" ADD CONSTRAINT "customer_sales_id_foreign" FOREIGN KEY("sales_id") REFERENCES "sales_rep"("sales_id");
ALTER TABLE
    "car" ADD CONSTRAINT "car_repair_id_foreign" FOREIGN KEY("repair_id") REFERENCES "repairs"("repair_id");
ALTER TABLE
    "customer" ADD CONSTRAINT "customer_invoice_id_foreign" FOREIGN KEY("invoice_id") REFERENCES "invoice"("invoice_id");
ALTER TABLE
    "car_purchase_id" ADD CONSTRAINT "car_purchase_id_invoice_id_foreign" FOREIGN KEY("invoice_id") REFERENCES "invoice"("invoice_id");
ALTER TABLE
    "car" ADD CONSTRAINT "car_sales_id_foreign" FOREIGN KEY("sales_id") REFERENCES "sales_rep"("sales_id");
ALTER TABLE
    "repairs" ADD CONSTRAINT "repairs_mechanic_id_foreign" FOREIGN KEY("mechanic_id") REFERENCES "mechanics"("mechanic_id");
ALTER TABLE
    "car_purchase_id" ADD CONSTRAINT "car_purchase_id_car_id_foreign" FOREIGN KEY("car_id") REFERENCES "car"("car_id");