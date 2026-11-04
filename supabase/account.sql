-- Salesforce Account object
-- https://developer.salesforce.com/docs/atlas.en-us.object_reference.meta/object_reference/sforce_api_objects_account.htm

CREATE TABLE public.account (
    id VARCHAR(18) PRIMARY KEY,                -- Salesforce Record Id
    is_deleted BOOLEAN DEFAULT FALSE,
    master_record_id VARCHAR(18),
    name VARCHAR(255) NOT NULL,
    type VARCHAR(255),                         -- picklist
    -- parent_id VARCHAR(18),                  -- self-referencing FK -> account.id
    account_number VARCHAR(40),
    account_source VARCHAR(40),                -- picklist
    industry VARCHAR(255),                     -- picklist
    annual_revenue DECIMAL(18,0),
    number_of_employees INTEGER,
    ownership VARCHAR(255),                    -- picklist
    ticker_symbol VARCHAR(20),
    rating VARCHAR(255),                       -- picklist
    site VARCHAR(80),
    website VARCHAR(255),
    -- photo_url VARCHAR(255),
    description TEXT,

    billing_street VARCHAR(255),
    billing_city VARCHAR(40),
    billing_state VARCHAR(80),
    billing_postal_code VARCHAR(20),
    billing_country VARCHAR(80),
    -- billing_latitude DECIMAL(18,15),
    -- billing_longitude DECIMAL(18,15),
    -- billing_geocode_accuracy VARCHAR(40),

    shipping_street VARCHAR(255),
    shipping_city VARCHAR(40),
    shipping_state VARCHAR(80),
    shipping_postal_code VARCHAR(20),
    shipping_country VARCHAR(80),
    -- shipping_latitude DECIMAL(18,15),
    -- shipping_longitude DECIMAL(18,15),
    -- shipping_geocode_accuracy VARCHAR(40),

    phone VARCHAR(40),
    fax VARCHAR(40),

    -- sic VARCHAR(20),
    -- sic_desc VARCHAR(80),
    -- naics_code VARCHAR(8),
    -- naics_desc VARCHAR(120),
    -- tradestyle VARCHAR(255),
    -- duns_number VARCHAR(9),
    -- year_started VARCHAR(4),
    -- jigsaw VARCHAR(20),
    -- jigsaw_company_id VARCHAR(20),
    -- clean_status VARCHAR(40),
    -- dandb_company_id VARCHAR(18),            -- FK -> dandb_company.id
    -- operating_hours_id VARCHAR(18),          -- FK -> operating_hours.id
    -- is_priority_record BOOLEAN DEFAULT FALSE,
    -- currency_iso_code VARCHAR(3),            -- only with multicurrency enabled

    -- owner_id VARCHAR(18) NOT NULL,           -- FK -> user.id
    created_date TIMESTAMP NOT NULL,
    -- created_by_id VARCHAR(18) NOT NULL,      -- FK -> user.id
    last_modified_date TIMESTAMP NOT NULL,
    -- last_modified_by_id VARCHAR(18) NOT NULL, -- FK -> user.id
    -- system_modstamp TIMESTAMP NOT NULL,
    -- last_activity_date DATE,
    -- last_viewed_date TIMESTAMP,
    -- last_referenced_date TIMESTAMP

    -- CONSTRAINT fk_account_parent
    --     FOREIGN KEY (parent_id) REFERENCES account(id),
    -- CONSTRAINT fk_account_owner
    --     FOREIGN KEY (owner_id) REFERENCES "user"(id)
);

-- contact.sql links back here through contact.account_id (currently commented out):
-- ALTER TABLE talkdesk.contact
--     ADD CONSTRAINT fk_contact_account
--     FOREIGN KEY (account_id) REFERENCES talkdesk.account(id);
