-- Salesforce Contact object
-- https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_contact.htm
-- Requires account.sql to be run first (account_id references account.id)

CREATE TABLE public.contact (
    id VARCHAR(18) PRIMARY KEY, -- Salesforce Record Id
    is_deleted BOOLEAN DEFAULT FALSE,
    master_record_id VARCHAR(18),
    account_id VARCHAR(18), -- FK -> account.id
    last_name VARCHAR(80) NOT NULL,
    first_name VARCHAR(40),
    salutation VARCHAR(40),
    middle_name VARCHAR(40),
    suffix VARCHAR(40),
    name VARCHAR(121), -- compound, read-only in SF
    -- other_street VARCHAR(255),
    -- other_city VARCHAR(40),
    -- other_state VARCHAR(80),
    -- other_postal_code VARCHAR(20),
    -- other_country VARCHAR(80),
    -- other_latitude DECIMAL(18,15),
    -- other_longitude DECIMAL(18,15),
    -- other_geocode_accuracy VARCHAR(40),
    mailing_street VARCHAR(255),
    mailing_city VARCHAR(40),
    mailing_state VARCHAR(80),
    mailing_postal_code VARCHAR(20),
    mailing_country VARCHAR(80),
    -- mailing_latitude DECIMAL(18,15),
    -- mailing_longitude DECIMAL(18,15),
    -- mailing_geocode_accuracy VARCHAR(40),
    phone VARCHAR(40),
    fax VARCHAR(40),
    mobile_phone VARCHAR(40),
    home_phone VARCHAR(40),
    other_phone VARCHAR(40),
    assistant_phone VARCHAR(40),
    -- reports_to_id VARCHAR(18), -- self-referencing FK -> contact.id
    email VARCHAR(80),
    title VARCHAR(128),
    department VARCHAR(80),
    -- assistant_name VARCHAR(40),
    -- lead_source VARCHAR(40),
    birthdate DATE,
    description TEXT,
    -- owner_id VARCHAR(18) NOT NULL, -- FK -> user.id
    -- has_opted_out_of_email BOOLEAN DEFAULT FALSE,
    -- has_opted_out_of_fax BOOLEAN DEFAULT FALSE,
    do_not_call BOOLEAN DEFAULT FALSE,
    -- is_email_bounced BOOLEAN DEFAULT FALSE,
    -- email_bounced_reason VARCHAR(255),
    -- email_bounced_date TIMESTAMP,
    -- jigsaw VARCHAR(20),
    -- jigsaw_contact_id VARCHAR(20),
    -- clean_status VARCHAR(40),
    -- individual_id VARCHAR(18), -- FK -> individual.id
    created_date TIMESTAMP NOT NULL,
    -- created_by_id VARCHAR(18) NOT NULL, -- FK -> user.id
    last_modified_date TIMESTAMP NOT NULL,
    -- last_modified_by_id VARCHAR(18) NOT NULL, -- FK -> user.id
    -- system_modstamp TIMESTAMP NOT NULL,
    -- last_activity_date DATE,
    -- last_curequest_date TIMESTAMP,
    -- last_cuupdate_date TIMESTAMP,
    -- last_viewed_date TIMESTAMP,
    -- last_referenced_date TIMESTAMP,
    -- email_bounced_reason_2 VARCHAR(255),
    pin VARCHAR(20), -- custom field, not a standard Salesforce field

    CONSTRAINT fk_contact_account
        FOREIGN KEY (account_id) REFERENCES public.account(id)
    -- CONSTRAINT fk_contact_reports_to
    --     FOREIGN KEY (reports_to_id) REFERENCES public.contact(id),
    -- CONSTRAINT fk_contact_owner
    --     FOREIGN KEY (owner_id) REFERENCES "user"(id)
);

CREATE INDEX idx_contact_account_id ON public.contact(account_id);

ALTER TABLE public.contact ENABLE ROW LEVEL SECURITY;
