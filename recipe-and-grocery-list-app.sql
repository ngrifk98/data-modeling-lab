CREATE TABLE "public.user" (
	"id" serial NOT NULL,
	"username" varchar(16) NOT NULL UNIQUE,
	"email" varchar(30) NOT NULL UNIQUE,
	"password" varchar(16) NOT NULL,
	CONSTRAINT "user_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.recipes" (
	"id" serial NOT NULL,
	"title" varchar NOT NULL UNIQUE DEFAULT '50',
	"author" varchar NOT NULL,
	"instructions" varchar NOT NULL,
	CONSTRAINT "recipes_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Ingredients" (
	"ingredient_id" serial NOT NULL,
	"ingredient_name" varchar NOT NULL,
	CONSTRAINT "Ingredients_pk" PRIMARY KEY ("ingredient_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.GroceryList" (
	"list_id" serial NOT NULL,
	"list_name" varchar NOT NULL,
	"list_details" varchar NOT NULL,
	"isPrivate" BOOLEAN NOT NULL DEFAULT 'True',
	CONSTRAINT "GroceryList_pk" PRIMARY KEY ("list_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Occasions" (
	"occ_id" serial NOT NULL,
	"occ_name" varchar NOT NULL,
	"is_private" BOOLEAN NOT NULL DEFAULT 'True',
	CONSTRAINT "Occasions_pk" PRIMARY KEY ("occ_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.RecAutBridge" (
	"id" serial NOT NULL,
	"recipe_id" serial NOT NULL,
	"user_id" integer NOT NULL,
	CONSTRAINT "RecAutBridge_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "recipes" ADD CONSTRAINT "recipes_fk0" FOREIGN KEY ("id") REFERENCES "Ingredients"("ingredient_id");

ALTER TABLE "Ingredients" ADD CONSTRAINT "Ingredients_fk0" FOREIGN KEY ("ingredient_id") REFERENCES "GroceryList"("list_id");

ALTER TABLE "GroceryList" ADD CONSTRAINT "GroceryList_fk0" FOREIGN KEY ("list_id") REFERENCES "user"("id");

ALTER TABLE "Occasions" ADD CONSTRAINT "Occasions_fk0" FOREIGN KEY ("occ_id") REFERENCES "recipes"("id");

ALTER TABLE "RecAutBridge" ADD CONSTRAINT "RecAutBridge_fk0" FOREIGN KEY ("recipe_id") REFERENCES "recipes"("id");
ALTER TABLE "RecAutBridge" ADD CONSTRAINT "RecAutBridge_fk1" FOREIGN KEY ("user_id") REFERENCES "user"("id");







