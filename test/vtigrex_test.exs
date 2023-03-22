defmodule VtigrexTest do
  use ExUnit.Case
  doctest Vtigrex

  setup do
    client =
      Vtigrex.client(
        "https://example.odx.vtiger.com/restapi/v1/vtiger/default",
        "jandejong@example.nl",
        "my4cc3sk3y"
      )

    {:ok, client: client}
  end

  test "gets the current user", context do
    Tesla.Mock.mock(fn
      %{
        method: :get,
        url: "https://example.odx.vtiger.com/restapi/v1/vtiger/default/me"
      } ->
        %Tesla.Env{
          status: 200,
          body: %{
            "success" => true,
            "result" => %{
              "user_name" => "jandejong@example.nl",
              "user_type" => "admin",
              "roleid" => "H2",
              "reports_to_id" => "12345",
              "user_primary_group" => "",
              "language" => "en_us",
              "is_admin" => "on",
              "status" => "Active",
              "end_hour" => "",
              "is_owner" => "",
              "availability" => "Offline",
              "currency_id" => "2",
              "display_preference_currency" => "1",
              "currency_grouping_pattern" => "123,456,789",
              "currency_decimal_separator" => ".",
              "currency_grouping_separator" => ",",
              "currency_symbol_placement" => "$1.0",
              "no_of_currency_decimals" => "2",
              "truncate_trailing_zeros" => "1",
              "currency_format" => "Currency Symbol",
              "number_format" => "Full",
              "first_name" => "Jan",
              "last_name" => "de Jong",
              "title" => "",
              "department" => "",
              "email1" => "jandejong@example.nl",
              "secondaryemail" => "",
              "email2" => "",
              "phone_home" => "",
              "phone_work" => "",
              "phone_mobile" => "",
              "phone_other" => "",
              "phone_fax" => "",
              "description" => "",
              "theme" => "softed",
              "rowheight" => "",
              "learning_score" => "0",
              "userlabel" => "Jan de Jong",
              "address_street" => "",
              "address_city" => "",
              "address_state" => "",
              "address_country" => "",
              "address_postalcode" => "",
              "asterisk_extension" => "",
              "dayoftheweek" => "Sunday",
              "start_hour" => "00:00",
              "date_format" => "yyyy-mm-dd",
              "hour_format" => "12",
              "time_zone" => "Europe/Amsterdam",
              "activity_view" => "Today",
              "callduration" => "5",
              "othereventduration" => "5",
              "defaulteventstatus" => "",
              "defaultactivitytype" => "",
              "reminder_interval" => "None",
              "calendarsharedtype" => "public",
              "hidecompletedevents" => "0",
              "defaultcalendarview" => "MyCalendar",
              "taskduration" => "30::duration_minutes",
              "business_hours" => "1",
              "defaultlandingpage" => "Home",
              "collapsemodulemenu" => "0",
              "default_record_view" => "Summary",
              "leftpanelhide" => "0",
              "internal_mailer" => "1",
              "layout" => "v8",
              "darkmode" => "0",
              "display_name_format" => "First Name Last Name",
              "phone_contry_code" => "",
              "imagename" => "",
              "signature" => "&lt;div&gt;\n\n&lt;/div&gt;",
              "signature_before_quoted_text" => "1",
              "currency_name" => "Euro",
              "currency_code" => "EUR",
              "currency_symbol" => "&#8364;",
              "conv_rate" => "1.00000",
              "id" => "19x12345"
            }
          }
        }
    end)

    assert Vtigrex.me(context[:client]) ==
             {:ok,
              %{
                "activity_view" => "Today",
                "address_city" => "",
                "address_country" => "",
                "address_postalcode" => "",
                "address_state" => "",
                "address_street" => "",
                "asterisk_extension" => "",
                "availability" => "Offline",
                "business_hours" => "1",
                "calendarsharedtype" => "public",
                "callduration" => "5",
                "collapsemodulemenu" => "0",
                "conv_rate" => "1.00000",
                "currency_code" => "EUR",
                "currency_decimal_separator" => ".",
                "currency_format" => "Currency Symbol",
                "currency_grouping_pattern" => "123,456,789",
                "currency_grouping_separator" => ",",
                "currency_id" => "2",
                "currency_name" => "Euro",
                "currency_symbol" => "&#8364;",
                "currency_symbol_placement" => "$1.0",
                "darkmode" => "0",
                "date_format" => "yyyy-mm-dd",
                "dayoftheweek" => "Sunday",
                "default_record_view" => "Summary",
                "defaultactivitytype" => "",
                "defaultcalendarview" => "MyCalendar",
                "defaulteventstatus" => "",
                "defaultlandingpage" => "Home",
                "department" => "",
                "description" => "",
                "display_name_format" => "First Name Last Name",
                "display_preference_currency" => "1",
                "email1" => "jandejong@example.nl",
                "email2" => "",
                "end_hour" => "",
                "first_name" => "Jan",
                "hidecompletedevents" => "0",
                "hour_format" => "12",
                "id" => "19x12345",
                "imagename" => "",
                "internal_mailer" => "1",
                "is_admin" => "on",
                "is_owner" => "",
                "language" => "en_us",
                "last_name" => "de Jong",
                "layout" => "v8",
                "learning_score" => "0",
                "leftpanelhide" => "0",
                "no_of_currency_decimals" => "2",
                "number_format" => "Full",
                "othereventduration" => "5",
                "phone_contry_code" => "",
                "phone_fax" => "",
                "phone_home" => "",
                "phone_mobile" => "",
                "phone_other" => "",
                "phone_work" => "",
                "reminder_interval" => "None",
                "reports_to_id" => "12345",
                "roleid" => "H2",
                "rowheight" => "",
                "secondaryemail" => "",
                "signature" => "&lt;div&gt;\n\n&lt;/div&gt;",
                "signature_before_quoted_text" => "1",
                "start_hour" => "00:00",
                "status" => "Active",
                "taskduration" => "30::duration_minutes",
                "theme" => "softed",
                "time_zone" => "Europe/Amsterdam",
                "title" => "",
                "truncate_trailing_zeros" => "1",
                "user_name" => "jandejong@example.nl",
                "user_primary_group" => "",
                "user_type" => "admin",
                "userlabel" => "Jan de Jong"
              }}
  end

  test "runs a query", context do
    Tesla.Mock.mock(fn
      %{
        method: :get,
        url: "https://example.odx.vtiger.com/restapi/v1/vtiger/default/query",
        query: [
          query: "select id from Accounts where account_no = 'ACC12345' limit 1;"
        ]
      } ->
        %Tesla.Env{
          status: 200,
          body: %{
            "success" => true,
            "result" => [%{"id" => "3x123456"}]
          }
        }
    end)

    assert Vtigrex.query(
             context[:client],
             "select id from Accounts where account_no = 'ACC12345' limit 1;"
           ) ==
             {:ok, [%{"id" => "3x123456"}]}
  end
end
