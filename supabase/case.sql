CREATE TABLE public.cases (
    id                          VARCHAR(18) PRIMARY KEY, -- Salesforce Record Id
    is_deleted                  BOOLEAN DEFAULT FALSE,
    master_record_id            VARCHAR(18),
    case_number                 VARCHAR(30) NOT NULL, -- auto-generated, read-only
    contact_id VARCHAR(18), -- FK -> contact.id
    account_id VARCHAR(18), -- FK -> account.id
    -- asset_id VARCHAR(18), -- FK -> asset.id
    -- source_id VARCHAR(18), -- FK -> case.id (for cloned/linked cases)
    -- business_hours_id VARCHAR(18), -- FK -> business_hours.id
    -- entitlement_id VARCHAR(18), -- FK -> entitlement.id
    -- suppliedname VARCHAR(80),
    -- supplied_email VARCHAR(80),
    -- supplied_phone VARCHAR(40),
    -- supplied_company VARCHAR(40),
    type                        VARCHAR(40),
    record_type_id              VARCHAR(18),
    status                      VARCHAR(40) NOT NULL,
    reason                      VARCHAR(255),
    origin                      VARCHAR(40),
    subject                     VARCHAR(255),
    priority                    VARCHAR(40),
    description                 TEXT,
    is_closed                   BOOLEAN DEFAULT FALSE, -- derived from status, read-only
    closed_date                 TIMESTAMP,
    is_escalated                BOOLEAN DEFAULT FALSE,
    -- owner_id VARCHAR(18) NOT NULL, -- FK -> user.id or group.id
    -- currency_iso_code VARCHAR(3),
    created_date                TIMESTAMP NOT NULL,
    -- created_by_id VARCHAR(18) NOT NULL, -- FK -> user.id
    last_modified_date          TIMESTAMP NOT NULL,
    -- last_modified_by_id VARCHAR(18) NOT NULL, -- FK -> user.id
    -- system_modstamp TIMESTAMP NOT NULL,
    contact_phone                VARCHAR(40),
    contact_mobile                VARCHAR(40),
    contact_email                VARCHAR(80),
    contact_fax                  VARCHAR(40),
    -- comments TEXT,
    -- last_viewed_date TIMESTAMP,
    -- last_referenced_date TIMESTAMP,
    milestone_status            VARCHAR(255), -- derived, read-only
    is_stopped                  BOOLEAN DEFAULT FALSE,
    stop_start_date             TIMESTAMP,
    -- language VARCHAR(40),
    -- sla_start_date TIMESTAMP,
    -- sla_exit_date TIMESTAMP,

    CONSTRAINT fk_case_contact
        FOREIGN KEY (contact_id) REFERENCES public.contact(id),
     CONSTRAINT fk_case_account
         FOREIGN KEY (account_id) REFERENCES public.account(id)
    -- CONSTRAINT fk_case_asset
    --     FOREIGN KEY (asset_id) REFERENCES asset(id),
    -- CONSTRAINT fk_case_parent
    --     FOREIGN KEY (source_id) REFERENCES case(id),
    -- CONSTRAINT fk_case_entitlement
    --     FOREIGN KEY (entitlement_id) REFERENCES entitlement(id),
    -- CONSTRAINT fk_case_owner
    --     FOREIGN KEY (owner_id) REFERENCES "user"(id),
    -- CONSTRAINT fk_case_created_by
    --     FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    -- CONSTRAINT fk_case_last_modified_by
    --     FOREIGN KEY (last_modified_by_id) REFERENCES "user"(id)
);
