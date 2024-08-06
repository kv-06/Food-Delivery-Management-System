


rem: ITEM ID GENERATE

drop sequence item_seq;
drop trigger set_item_id;

create sequence item_seq
    start with 1
    increment by 1
    nocache
    nocycle
/

create or replace trigger set_item_id
before insert on items
for each row
declare
    next_val number;
begin
    select item_seq.NEXTVAL into next_val from dual;
    :new.item_id:='I'||lpad(next_val,4,'0');
end;
/


rem: ADDRESS ID GENERATE

drop sequence add_seq;
drop trigger set_add_id;

create sequence add_seq
    start with 1
    increment by 1
    nocache
    nocycle
/

create or replace trigger set_add_id
before insert on ADDRESS
for each row
declare
    next_val number;
begin
    select add_seq.NEXTVAL into next_val from dual;
    :new.add_id:='A'||lpad(next_val,4,'0');
end;
/

rem: SEQUENCE FOR CUSTOMER ID
rem: no trigger bc generating cust id in program

drop sequence cust_seq;

create sequence cust_seq
    start with 1
    increment by 1
    nocache
    nocycle
/



rem: RESTAURANT ID GENERATE

drop sequence rest_seq;
drop trigger set_rest_id;

create sequence rest_seq
    start with 1
    increment by 1
    nocache
    nocycle
/

create or replace trigger set_rest_id
before insert on RESTAURANTS
for each row
declare
    next_val number;
begin
    select rest_seq.NEXTVAL into next_val from dual;
    :new.restaurant_id:='R'||lpad(next_val,4,'0');
end;
/



rem: Delivery_person ID GENERATE

drop sequence delv_seq;
drop trigger set_delv_id;

create sequence delv_seq
    start with 1
    increment by 1
    nocache
    nocycle
/

create or replace trigger set_delv_id
before insert on Delivery_person
for each row
declare
    next_val number;
begin
    select delv_seq.NEXTVAL into next_val from dual;
    :new.d_id:='D'||lpad(next_val,4,'0');
end;
/



CREATE SEQUENCE order_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE payment_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;


CREATE OR REPLACE TRIGGER set_payment_id
BEFORE INSERT ON Payment
FOR EACH ROW
BEGIN
    SELECT 'P' || LPAD(payment_seq.NEXTVAL, 5, '0')
    INTO :NEW.Payment_id
    FROM dual;
END;
/

CREATE SEQUENCE transaction_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE OR REPLACE FUNCTION calculate_order_total(p_order_id VARCHAR2)
RETURN NUMBER
IS
    v_total_amount NUMBER := 0;
BEGIN
    SELECT SUM(m.Price * ol.Qty)
    INTO v_total_amount
    FROM Order_list ol
    JOIN Menu m ON ol.Item_id = m.Item_id
    JOIN Orders o ON ol.Order_id = o.Order_id
    WHERE ol.Order_id = p_order_id;

    RETURN v_total_amount;
END;
/
