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

  test "lists all types", context do
    Tesla.Mock.mock(fn
      %{
        method: :get,
        url: "https://example.odx.vtiger.com/restapi/v1/vtiger/default/listtypes",
        query: [
          fieldTypeList: "null"
        ]
      } ->
        %Tesla.Env{
          status: 200,
          body: %{
            "success" => true,
            "result" => %{
              "information" => %{
                "InternalTickets" => %{
                  "isEntity" => true,
                  "label" => "Internal Tickets",
                  "singular" => "Internal Ticket"
                },
                "Users" => %{"isEntity" => true, "label" => "Users", "singular" => "User"},
                "Groups" => %{
                  "isEntity" => false,
                  "label" => "Groups",
                  "singular" => "Groups"
                },
                "EventForms" => %{
                  "isEntity" => true,
                  "label" => "Appointment Pages",
                  "singular" => "Appointment Page"
                },
                "Emails" => %{
                  "isEntity" => true,
                  "label" => "Emails",
                  "singular" => "Email"
                },
                "EmailTemplates" => %{
                  "isEntity" => true,
                  "label" => "Email Templates",
                  "singular" => "Email Template"
                },
                "CompanyDetails" => %{
                  "isEntity" => false,
                  "label" => "CompanyDetails",
                  "singular" => "CompanyDetails"
                },
                "PriceBooks" => %{
                  "isEntity" => true,
                  "label" => "Price Books",
                  "singular" => "Price Book"
                },
                "Import" => %{
                  "isEntity" => true,
                  "label" => "Import",
                  "singular" => "Import"
                },
                "ModComments" => %{
                  "isEntity" => true,
                  "label" => "Comments",
                  "singular" => "Comment"
                },
                "Services" => %{
                  "isEntity" => true,
                  "label" => "Services",
                  "singular" => "Service"
                },
                "Forecast" => %{
                  "isEntity" => true,
                  "label" => "Forecast and Quota",
                  "singular" => "SINGLE_Forecast"
                },
                "WatchPoints" => %{
                  "isEntity" => true,
                  "label" => "WatchPoints",
                  "singular" => "SINGLE_WatchPoints"
                },
                "ServiceContracts" => %{
                  "isEntity" => true,
                  "label" => "Service Contracts",
                  "singular" => "Service Contract"
                },
                "Invoice" => %{
                  "isEntity" => true,
                  "label" => "Invoices",
                  "singular" => "Invoice"
                },
                "Inbox" => %{
                  "isEntity" => true,
                  "label" => "Inbox",
                  "singular" => "SINGLE_Inbox"
                },
                "Tax" => %{"isEntity" => false, "label" => "Tax", "singular" => "Tax"},
                "Employees" => %{
                  "isEntity" => true,
                  "label" => "Employees",
                  "singular" => "Employee"
                },
                "Quotes" => %{
                  "isEntity" => true,
                  "label" => "Quotes",
                  "singular" => "Quote"
                },
                "WorkOrders" => %{
                  "isEntity" => true,
                  "label" => "Work Orders",
                  "singular" => "Work Order"
                },
                "vtcmcustommodule" => %{
                  "isEntity" => true,
                  "label" => "Custom Module ",
                  "singular" => "Custom Module "
                },
                "Currency" => %{
                  "isEntity" => false,
                  "label" => "Currency",
                  "singular" => "Currency"
                },
                "SalesOrder" => %{
                  "isEntity" => true,
                  "label" => "Sales Orders",
                  "singular" => "Sales Order"
                },
                "Potentials" => %{
                  "isEntity" => true,
                  "label" => "Opportunities",
                  "singular" => "Opportunity"
                },
                "Emotions" => %{
                  "isEntity" => true,
                  "label" => "Emotions",
                  "singular" => "SINGLE_Emotions"
                },
                "vtcmcomments" => %{
                  "isEntity" => true,
                  "label" => "Comments",
                  "singular" => "Comment"
                },
                "Contacts" => %{
                  "isEntity" => true,
                  "label" => "Contacts",
                  "singular" => "Contact"
                },
                "Accounts" => %{
                  "isEntity" => true,
                  "label" => "Organizations",
                  "singular" => "Organization"
                },
                "Reviews" => %{
                  "isEntity" => true,
                  "label" => "Reviews",
                  "singular" => "SINGLE_Reviews"
                },
                "WebPages" => %{
                  "isEntity" => true,
                  "label" => "Landing Pages",
                  "singular" => "Landing Page"
                },
                "ProcessDesigner" => %{
                  "isEntity" => true,
                  "label" => "Process Designer",
                  "singular" => "Process"
                },
                "Documents" => %{
                  "isEntity" => true,
                  "label" => "Documents",
                  "singular" => "Document"
                },
                "PhoneCalls" => %{
                  "isEntity" => true,
                  "label" => "Phone Calls",
                  "singular" => "Phone Call"
                },
                "EmailSequence" => %{
                  "isEntity" => true,
                  "label" => "Email Sequences",
                  "singular" => "Email Sequence"
                },
                "LineItem" => %{
                  "isEntity" => false,
                  "label" => "LineItem",
                  "singular" => "LineItem"
                },
                "JourneyTemplates" => %{
                  "isEntity" => true,
                  "label" => "Playbooks",
                  "singular" => "Playbook"
                },
                "Calendar" => %{
                  "isEntity" => true,
                  "label" => "Calendar",
                  "singular" => "Task"
                },
                "PrintTemplates" => %{
                  "isEntity" => true,
                  "label" => "Print Templates",
                  "singular" => "Print Template"
                },
                "DocumentFolders" => %{
                  "isEntity" => false,
                  "label" => "DocumentFolders",
                  "singular" => "DocumentFolders"
                },
                "Reactions" => %{
                  "isEntity" => true,
                  "label" => "Reactions",
                  "singular" => "SINGLE_Reactions"
                },
                "ProductTaxes" => %{
                  "isEntity" => false,
                  "label" => "ProductTaxes",
                  "singular" => "ProductTaxes"
                },
                "Events" => %{
                  "isEntity" => true,
                  "label" => "Events",
                  "singular" => "Event"
                },
                "Approvals" => %{
                  "isEntity" => true,
                  "label" => "Approvals",
                  "singular" => "Approval"
                },
                "Roles" => %{
                  "isEntity" => false,
                  "label" => "Roles",
                  "singular" => "Roles"
                },
                "Campaigns" => %{
                  "isEntity" => true,
                  "label" => "Campaigns",
                  "singular" => "Campaign"
                }
              },
              "types" => [
                "Calendar",
                "Accounts",
                "Contacts",
                "Potentials",
                "Documents",
                "Emails",
                "PriceBooks",
                "Quotes",
                "SalesOrder",
                "Invoice",
                "Campaigns",
                "Events",
                "Users",
                "ServiceContracts",
                "Services",
                "ModComments",
                "PrintTemplates",
                "EventForms",
                "Inbox",
                "Approvals",
                "vtcmcustommodule",
                "Employees",
                "InternalTickets",
                "WorkOrders",
                "Forecast",
                "vtcmcomments",
                "Reactions",
                "EmailTemplates",
                "JourneyTemplates",
                "Emotions",
                "EmailSequence",
                "PhoneCalls",
                "Import",
                "Reviews",
                "WatchPoints",
                "WebPages",
                "ProcessDesigner",
                "Groups",
                "Currency",
                "DocumentFolders",
                "CompanyDetails",
                "LineItem",
                "Tax",
                "ProductTaxes",
                "Roles"
              ]
            }
          }
        }
    end)

    assert Vtigrex.list_types(context[:client]) ==
             {:ok,
              %{
                "information" => %{
                  "InternalTickets" => %{
                    "isEntity" => true,
                    "label" => "Internal Tickets",
                    "singular" => "Internal Ticket"
                  },
                  "Users" => %{"isEntity" => true, "label" => "Users", "singular" => "User"},
                  "Groups" => %{
                    "isEntity" => false,
                    "label" => "Groups",
                    "singular" => "Groups"
                  },
                  "EventForms" => %{
                    "isEntity" => true,
                    "label" => "Appointment Pages",
                    "singular" => "Appointment Page"
                  },
                  "Emails" => %{
                    "isEntity" => true,
                    "label" => "Emails",
                    "singular" => "Email"
                  },
                  "EmailTemplates" => %{
                    "isEntity" => true,
                    "label" => "Email Templates",
                    "singular" => "Email Template"
                  },
                  "CompanyDetails" => %{
                    "isEntity" => false,
                    "label" => "CompanyDetails",
                    "singular" => "CompanyDetails"
                  },
                  "PriceBooks" => %{
                    "isEntity" => true,
                    "label" => "Price Books",
                    "singular" => "Price Book"
                  },
                  "Import" => %{
                    "isEntity" => true,
                    "label" => "Import",
                    "singular" => "Import"
                  },
                  "ModComments" => %{
                    "isEntity" => true,
                    "label" => "Comments",
                    "singular" => "Comment"
                  },
                  "Services" => %{
                    "isEntity" => true,
                    "label" => "Services",
                    "singular" => "Service"
                  },
                  "Forecast" => %{
                    "isEntity" => true,
                    "label" => "Forecast and Quota",
                    "singular" => "SINGLE_Forecast"
                  },
                  "WatchPoints" => %{
                    "isEntity" => true,
                    "label" => "WatchPoints",
                    "singular" => "SINGLE_WatchPoints"
                  },
                  "ServiceContracts" => %{
                    "isEntity" => true,
                    "label" => "Service Contracts",
                    "singular" => "Service Contract"
                  },
                  "Invoice" => %{
                    "isEntity" => true,
                    "label" => "Invoices",
                    "singular" => "Invoice"
                  },
                  "Inbox" => %{
                    "isEntity" => true,
                    "label" => "Inbox",
                    "singular" => "SINGLE_Inbox"
                  },
                  "Tax" => %{"isEntity" => false, "label" => "Tax", "singular" => "Tax"},
                  "Employees" => %{
                    "isEntity" => true,
                    "label" => "Employees",
                    "singular" => "Employee"
                  },
                  "Quotes" => %{
                    "isEntity" => true,
                    "label" => "Quotes",
                    "singular" => "Quote"
                  },
                  "WorkOrders" => %{
                    "isEntity" => true,
                    "label" => "Work Orders",
                    "singular" => "Work Order"
                  },
                  "vtcmcustommodule" => %{
                    "isEntity" => true,
                    "label" => "Custom Module ",
                    "singular" => "Custom Module "
                  },
                  "Currency" => %{
                    "isEntity" => false,
                    "label" => "Currency",
                    "singular" => "Currency"
                  },
                  "SalesOrder" => %{
                    "isEntity" => true,
                    "label" => "Sales Orders",
                    "singular" => "Sales Order"
                  },
                  "Potentials" => %{
                    "isEntity" => true,
                    "label" => "Opportunities",
                    "singular" => "Opportunity"
                  },
                  "Emotions" => %{
                    "isEntity" => true,
                    "label" => "Emotions",
                    "singular" => "SINGLE_Emotions"
                  },
                  "vtcmcomments" => %{
                    "isEntity" => true,
                    "label" => "Comments",
                    "singular" => "Comment"
                  },
                  "Contacts" => %{
                    "isEntity" => true,
                    "label" => "Contacts",
                    "singular" => "Contact"
                  },
                  "Accounts" => %{
                    "isEntity" => true,
                    "label" => "Organizations",
                    "singular" => "Organization"
                  },
                  "Reviews" => %{
                    "isEntity" => true,
                    "label" => "Reviews",
                    "singular" => "SINGLE_Reviews"
                  },
                  "WebPages" => %{
                    "isEntity" => true,
                    "label" => "Landing Pages",
                    "singular" => "Landing Page"
                  },
                  "ProcessDesigner" => %{
                    "isEntity" => true,
                    "label" => "Process Designer",
                    "singular" => "Process"
                  },
                  "Documents" => %{
                    "isEntity" => true,
                    "label" => "Documents",
                    "singular" => "Document"
                  },
                  "PhoneCalls" => %{
                    "isEntity" => true,
                    "label" => "Phone Calls",
                    "singular" => "Phone Call"
                  },
                  "EmailSequence" => %{
                    "isEntity" => true,
                    "label" => "Email Sequences",
                    "singular" => "Email Sequence"
                  },
                  "LineItem" => %{
                    "isEntity" => false,
                    "label" => "LineItem",
                    "singular" => "LineItem"
                  },
                  "JourneyTemplates" => %{
                    "isEntity" => true,
                    "label" => "Playbooks",
                    "singular" => "Playbook"
                  },
                  "Calendar" => %{
                    "isEntity" => true,
                    "label" => "Calendar",
                    "singular" => "Task"
                  },
                  "PrintTemplates" => %{
                    "isEntity" => true,
                    "label" => "Print Templates",
                    "singular" => "Print Template"
                  },
                  "DocumentFolders" => %{
                    "isEntity" => false,
                    "label" => "DocumentFolders",
                    "singular" => "DocumentFolders"
                  },
                  "Reactions" => %{
                    "isEntity" => true,
                    "label" => "Reactions",
                    "singular" => "SINGLE_Reactions"
                  },
                  "ProductTaxes" => %{
                    "isEntity" => false,
                    "label" => "ProductTaxes",
                    "singular" => "ProductTaxes"
                  },
                  "Events" => %{
                    "isEntity" => true,
                    "label" => "Events",
                    "singular" => "Event"
                  },
                  "Approvals" => %{
                    "isEntity" => true,
                    "label" => "Approvals",
                    "singular" => "Approval"
                  },
                  "Roles" => %{
                    "isEntity" => false,
                    "label" => "Roles",
                    "singular" => "Roles"
                  },
                  "Campaigns" => %{
                    "isEntity" => true,
                    "label" => "Campaigns",
                    "singular" => "Campaign"
                  }
                },
                "types" => [
                  "Calendar",
                  "Accounts",
                  "Contacts",
                  "Potentials",
                  "Documents",
                  "Emails",
                  "PriceBooks",
                  "Quotes",
                  "SalesOrder",
                  "Invoice",
                  "Campaigns",
                  "Events",
                  "Users",
                  "ServiceContracts",
                  "Services",
                  "ModComments",
                  "PrintTemplates",
                  "EventForms",
                  "Inbox",
                  "Approvals",
                  "vtcmcustommodule",
                  "Employees",
                  "InternalTickets",
                  "WorkOrders",
                  "Forecast",
                  "vtcmcomments",
                  "Reactions",
                  "EmailTemplates",
                  "JourneyTemplates",
                  "Emotions",
                  "EmailSequence",
                  "PhoneCalls",
                  "Import",
                  "Reviews",
                  "WatchPoints",
                  "WebPages",
                  "ProcessDesigner",
                  "Groups",
                  "Currency",
                  "DocumentFolders",
                  "CompanyDetails",
                  "LineItem",
                  "Tax",
                  "ProductTaxes",
                  "Roles"
                ]
              }}
  end

  test "lists modules with a certain type of field", context do
    Tesla.Mock.mock(fn
      %{
        method: :get,
        url: "https://example.odx.vtiger.com/restapi/v1/vtiger/default/listtypes",
        query: [
          fieldTypeList: ["Email"]
        ]
      } ->
        %Tesla.Env{
          status: 200,
          body: %{
            "success" => true,
            "result" => %{
              "information" => %{
                "Accounts" => %{
                  "isEntity" => true,
                  "label" => "Organizations",
                  "singular" => "Organization"
                },
                "Contacts" => %{
                  "isEntity" => true,
                  "label" => "Contacts",
                  "singular" => "Contact"
                },
                "Employees" => %{
                  "isEntity" => true,
                  "label" => "Employees",
                  "singular" => "Employee"
                },
                "InternalTickets" => %{
                  "isEntity" => true,
                  "label" => "Internal Tickets",
                  "singular" => "Internal Ticket"
                },
                "ModComments" => %{
                  "isEntity" => true,
                  "label" => "Comments",
                  "singular" => "Comment"
                },
                "Potentials" => %{
                  "isEntity" => true,
                  "label" => "Opportunities",
                  "singular" => "Opportunity"
                },
                "SalesOrder" => %{
                  "isEntity" => true,
                  "label" => "Sales Orders",
                  "singular" => "Sales Order"
                },
                "Users" => %{"isEntity" => true, "label" => "Users", "singular" => "User"}
              },
              "types" => [
                "Accounts",
                "Contacts",
                "Potentials",
                "SalesOrder",
                "Users",
                "ModComments",
                "Employees",
                "InternalTickets"
              ]
            }
          }
        }
    end)

    assert Vtigrex.list_types(context[:client], ["Email"]) ==
             {:ok,
              %{
                "information" => %{
                  "Accounts" => %{
                    "isEntity" => true,
                    "label" => "Organizations",
                    "singular" => "Organization"
                  },
                  "Contacts" => %{
                    "isEntity" => true,
                    "label" => "Contacts",
                    "singular" => "Contact"
                  },
                  "Employees" => %{
                    "isEntity" => true,
                    "label" => "Employees",
                    "singular" => "Employee"
                  },
                  "InternalTickets" => %{
                    "isEntity" => true,
                    "label" => "Internal Tickets",
                    "singular" => "Internal Ticket"
                  },
                  "ModComments" => %{
                    "isEntity" => true,
                    "label" => "Comments",
                    "singular" => "Comment"
                  },
                  "Potentials" => %{
                    "isEntity" => true,
                    "label" => "Opportunities",
                    "singular" => "Opportunity"
                  },
                  "SalesOrder" => %{
                    "isEntity" => true,
                    "label" => "Sales Orders",
                    "singular" => "Sales Order"
                  },
                  "Users" => %{"isEntity" => true, "label" => "Users", "singular" => "User"}
                },
                "types" => [
                  "Accounts",
                  "Contacts",
                  "Potentials",
                  "SalesOrder",
                  "Users",
                  "ModComments",
                  "Employees",
                  "InternalTickets"
                ]
              }}
  end

  test "describes a type", context do
    Tesla.Mock.mock(fn
      %{
        method: :get,
        url: "https://example.odx.vtiger.com/restapi/v1/vtiger/default/describe",
        query: [
          elementType: "ModComments"
        ]
      } ->
        %Tesla.Env{
          status: 200,
          body: %{
            "success" => true,
            "result" => %{
              "allowDuplicates" => true,
              "closedStatesInfo" => [],
              "createable" => true,
              "deleteable" => true,
              "fields" => [
                %{
                  "data" => "",
                  "dblabel" => "Comment",
                  "default" => "",
                  "editable" => true,
                  "headerfield" => false,
                  "isunique" => false,
                  "label" => "Comment",
                  "mandatory" => true,
                  "name" => "commentcontent",
                  "nullable" => true,
                  "quickcreate" => true,
                  "summaryfield" => true,
                  "type" => %{"length" => 16_777_216, "name" => "richtext"}
                },
                %{
                  "data" => "",
                  "dblabel" => "Customer",
                  "default" => "",
                  "editable" => true,
                  "headerfield" => false,
                  "isunique" => false,
                  "label" => "Customer",
                  "mandatory" => false,
                  "name" => "customer",
                  "nullable" => true,
                  "quickcreate" => false,
                  "summaryfield" => false,
                  "type" => %{
                    "length" => "19",
                    "name" => "reference",
                    "refersTo" => ["Contacts"]
                  }
                },
                %{
                  "data" => "",
                  "dblabel" => "UserId",
                  "default" => "",
                  "editable" => true,
                  "headerfield" => false,
                  "isunique" => false,
                  "label" => "UserId",
                  "mandatory" => false,
                  "name" => "userid",
                  "nullable" => true,
                  "quickcreate" => false,
                  "summaryfield" => false,
                  "type" => %{
                    "length" => "19",
                    "name" => "reference",
                    "refersTo" => ["Users"]
                  }
                },
                %{
                  "data" => "",
                  "dblabel" => "ReasonToEdit",
                  "default" => "",
                  "editable" => true,
                  "headerfield" => false,
                  "isunique" => false,
                  "label" => "ReasonToEdit",
                  "mandatory" => false,
                  "name" => "reasontoedit",
                  "nullable" => true,
                  "quickcreate" => false,
                  "summaryfield" => false,
                  "type" => %{"length" => "100", "name" => "text"}
                },
                %{
                  "data" => "",
                  "dblabel" => "Is Private",
                  "default" => "",
                  "editable" => true,
                  "headerfield" => false,
                  "isunique" => false,
                  "label" => "Is Private",
                  "mandatory" => false,
                  "name" => "is_private",
                  "nullable" => true,
                  "quickcreate" => false,
                  "summaryfield" => false,
                  "type" => %{"length" => "1", "name" => "boolean"}
                },
                %{
                  "data" => "",
                  "dblabel" => "Customer Email",
                  "default" => "",
                  "editable" => true,
                  "headerfield" => false,
                  "isunique" => false,
                  "label" => "Customer Email",
                  "mandatory" => false,
                  "name" => "customer_email",
                  "nullable" => true,
                  "quickcreate" => false,
                  "summaryfield" => false,
                  "type" => %{"length" => "100", "name" => "email"}
                },
                %{
                  "data" => "",
                  "dblabel" => "From Mailroom",
                  "default" => "",
                  "editable" => true,
                  "headerfield" => false,
                  "isunique" => false,
                  "label" => "From Mailroom",
                  "mandatory" => false,
                  "name" => "from_mailroom",
                  "nullable" => true,
                  "quickcreate" => false,
                  "summaryfield" => false,
                  "type" => %{"length" => "1", "name" => "boolean"}
                },
                %{
                  "data" => "",
                  "dblabel" => "Attachment",
                  "default" => "",
                  "editable" => true,
                  "headerfield" => false,
                  "isunique" => false,
                  "label" => "Attachment",
                  "mandatory" => false,
                  "name" => "filename",
                  "nullable" => true,
                  "quickcreate" => false,
                  "summaryfield" => false,
                  "type" => %{
                    "length" => "255",
                    "maxUploadFileSize" => "52428800",
                    "name" => "file"
                  }
                },
                %{
                  "data" => "",
                  "dblabel" => "Related Email Id",
                  "default" => "0",
                  "editable" => true,
                  "headerfield" => false,
                  "isunique" => false,
                  "label" => "Related Email Id",
                  "mandatory" => false,
                  "name" => "related_email_id",
                  "nullable" => true,
                  "quickcreate" => false,
                  "summaryfield" => false,
                  "type" => %{"length" => "11", "name" => "integer"}
                },
                %{
                  "data" => "",
                  "dblabel" => "Status",
                  "default" => "",
                  "editable" => true,
                  "headerfield" => false,
                  "isunique" => false,
                  "label" => "Status",
                  "mandatory" => false,
                  "name" => "status",
                  "nullable" => true,
                  "quickcreate" => false,
                  "summaryfield" => false,
                  "type" => %{"length" => "1", "name" => "integer"}
                },
                %{
                  "data" => "",
                  "dblabel" => "Source",
                  "default" => "",
                  "editable" => false,
                  "headerfield" => false,
                  "isunique" => false,
                  "label" => "Source",
                  "mandatory" => false,
                  "name" => "source",
                  "nullable" => true,
                  "quickcreate" => false,
                  "summaryfield" => false,
                  "type" => %{"length" => "100", "name" => "string"}
                },
                %{
                  "data" => "",
                  "dblabel" => "Sticky Note",
                  "default" => "",
                  "editable" => true,
                  "headerfield" => false,
                  "isunique" => false,
                  "label" => "Sticky Note",
                  "mandatory" => false,
                  "name" => "isstickynote",
                  "nullable" => true,
                  "quickcreate" => false,
                  "summaryfield" => false,
                  "type" => %{"length" => "1", "name" => "boolean"}
                },
                %{
                  "data" => "",
                  "dblabel" => "Assigned To",
                  "default" => "",
                  "editable" => true,
                  "headerfield" => false,
                  "isunique" => false,
                  "label" => "Assigned To",
                  "mandatory" => true,
                  "name" => "assigned_user_id",
                  "nullable" => false,
                  "quickcreate" => true,
                  "summaryfield" => true,
                  "type" => %{"length" => "19", "name" => "owner"}
                },
                %{
                  "data" => "",
                  "dblabel" => "Related To",
                  "default" => "",
                  "editable" => true,
                  "headerfield" => false,
                  "isunique" => false,
                  "label" => "Related To",
                  "mandatory" => false,
                  "name" => "related_to",
                  "nullable" => true,
                  "quickcreate" => true,
                  "summaryfield" => false,
                  "type" => %{
                    "length" => "19",
                    "name" => "reference",
                    "refersTo" => [
                      "Invoice",
                      "SalesOrder",
                      "Quotes",
                      "Documents",
                      "Events",
                      "Approvals",
                      "Calendar",
                      "vtcmcustommodule",
                      "InternalTickets",
                      "Employees",
                      "WorkOrders",
                      "Services",
                      "vtcmcomments",
                      "PhoneCalls",
                      "WebPages",
                      "ProcessDesigner",
                      "Contacts",
                      "Accounts",
                      "Potentials",
                      "ServiceContracts"
                    ]
                  }
                },
                %{
                  "data" => "",
                  "dblabel" => "Creator",
                  "default" => "",
                  "editable" => false,
                  "headerfield" => false,
                  "isunique" => false,
                  "label" => "Creator",
                  "mandatory" => false,
                  "name" => "creator",
                  "nullable" => false,
                  "quickcreate" => false,
                  "summaryfield" => false,
                  "type" => %{
                    "length" => "19",
                    "name" => "reference",
                    "refersTo" => ["Users"]
                  }
                },
                %{
                  "data" => "",
                  "dblabel" => "Created Time",
                  "default" => "",
                  "editable" => false,
                  "headerfield" => false,
                  "isunique" => false,
                  "label" => "Created Time",
                  "mandatory" => false,
                  "name" => "createdtime",
                  "nullable" => false,
                  "quickcreate" => false,
                  "summaryfield" => false,
                  "type" => %{"length" => "", "name" => "datetime"}
                },
                %{
                  "data" => "",
                  "dblabel" => "Modified Time",
                  "default" => "",
                  "editable" => false,
                  "headerfield" => false,
                  "isunique" => false,
                  "label" => "Modified Time",
                  "mandatory" => false,
                  "name" => "modifiedtime",
                  "nullable" => false,
                  "quickcreate" => false,
                  "summaryfield" => false,
                  "type" => %{"length" => "", "name" => "datetime"}
                },
                %{
                  "data" => "",
                  "dblabel" => "Related To Comments",
                  "default" => "",
                  "editable" => true,
                  "headerfield" => false,
                  "isunique" => false,
                  "label" => "Related To",
                  "mandatory" => false,
                  "name" => "parent_comments",
                  "nullable" => true,
                  "quickcreate" => false,
                  "summaryfield" => false,
                  "type" => %{
                    "length" => "19",
                    "name" => "reference",
                    "refersTo" => ["ModComments"]
                  }
                },
                %{
                  "default" => "",
                  "editable" => false,
                  "label" => "modcommentsid",
                  "mandatory" => false,
                  "name" => "id",
                  "nullable" => false,
                  "type" => %{"length" => "19", "name" => "autogenerated"}
                }
              ],
              "idPrefix" => "28",
              "inactivefields" => [],
              "isEntity" => true,
              "label" => "ModComments",
              "labelFields" => "commentcontent",
              "name" => "ModComments",
              "retrieveable" => true,
              "tools" => [],
              "updateable" => true
            }
          }
        }
    end)

    assert Vtigrex.describe(context[:client], "ModComments") ==
             {:ok,
              %{
                "allowDuplicates" => true,
                "closedStatesInfo" => [],
                "createable" => true,
                "deleteable" => true,
                "fields" => [
                  %{
                    "data" => "",
                    "dblabel" => "Comment",
                    "default" => "",
                    "editable" => true,
                    "headerfield" => false,
                    "isunique" => false,
                    "label" => "Comment",
                    "mandatory" => true,
                    "name" => "commentcontent",
                    "nullable" => true,
                    "quickcreate" => true,
                    "summaryfield" => true,
                    "type" => %{"length" => 16_777_216, "name" => "richtext"}
                  },
                  %{
                    "data" => "",
                    "dblabel" => "Customer",
                    "default" => "",
                    "editable" => true,
                    "headerfield" => false,
                    "isunique" => false,
                    "label" => "Customer",
                    "mandatory" => false,
                    "name" => "customer",
                    "nullable" => true,
                    "quickcreate" => false,
                    "summaryfield" => false,
                    "type" => %{
                      "length" => "19",
                      "name" => "reference",
                      "refersTo" => ["Contacts"]
                    }
                  },
                  %{
                    "data" => "",
                    "dblabel" => "UserId",
                    "default" => "",
                    "editable" => true,
                    "headerfield" => false,
                    "isunique" => false,
                    "label" => "UserId",
                    "mandatory" => false,
                    "name" => "userid",
                    "nullable" => true,
                    "quickcreate" => false,
                    "summaryfield" => false,
                    "type" => %{
                      "length" => "19",
                      "name" => "reference",
                      "refersTo" => ["Users"]
                    }
                  },
                  %{
                    "data" => "",
                    "dblabel" => "ReasonToEdit",
                    "default" => "",
                    "editable" => true,
                    "headerfield" => false,
                    "isunique" => false,
                    "label" => "ReasonToEdit",
                    "mandatory" => false,
                    "name" => "reasontoedit",
                    "nullable" => true,
                    "quickcreate" => false,
                    "summaryfield" => false,
                    "type" => %{"length" => "100", "name" => "text"}
                  },
                  %{
                    "data" => "",
                    "dblabel" => "Is Private",
                    "default" => "",
                    "editable" => true,
                    "headerfield" => false,
                    "isunique" => false,
                    "label" => "Is Private",
                    "mandatory" => false,
                    "name" => "is_private",
                    "nullable" => true,
                    "quickcreate" => false,
                    "summaryfield" => false,
                    "type" => %{"length" => "1", "name" => "boolean"}
                  },
                  %{
                    "data" => "",
                    "dblabel" => "Customer Email",
                    "default" => "",
                    "editable" => true,
                    "headerfield" => false,
                    "isunique" => false,
                    "label" => "Customer Email",
                    "mandatory" => false,
                    "name" => "customer_email",
                    "nullable" => true,
                    "quickcreate" => false,
                    "summaryfield" => false,
                    "type" => %{"length" => "100", "name" => "email"}
                  },
                  %{
                    "data" => "",
                    "dblabel" => "From Mailroom",
                    "default" => "",
                    "editable" => true,
                    "headerfield" => false,
                    "isunique" => false,
                    "label" => "From Mailroom",
                    "mandatory" => false,
                    "name" => "from_mailroom",
                    "nullable" => true,
                    "quickcreate" => false,
                    "summaryfield" => false,
                    "type" => %{"length" => "1", "name" => "boolean"}
                  },
                  %{
                    "data" => "",
                    "dblabel" => "Attachment",
                    "default" => "",
                    "editable" => true,
                    "headerfield" => false,
                    "isunique" => false,
                    "label" => "Attachment",
                    "mandatory" => false,
                    "name" => "filename",
                    "nullable" => true,
                    "quickcreate" => false,
                    "summaryfield" => false,
                    "type" => %{
                      "length" => "255",
                      "maxUploadFileSize" => "52428800",
                      "name" => "file"
                    }
                  },
                  %{
                    "data" => "",
                    "dblabel" => "Related Email Id",
                    "default" => "0",
                    "editable" => true,
                    "headerfield" => false,
                    "isunique" => false,
                    "label" => "Related Email Id",
                    "mandatory" => false,
                    "name" => "related_email_id",
                    "nullable" => true,
                    "quickcreate" => false,
                    "summaryfield" => false,
                    "type" => %{"length" => "11", "name" => "integer"}
                  },
                  %{
                    "data" => "",
                    "dblabel" => "Status",
                    "default" => "",
                    "editable" => true,
                    "headerfield" => false,
                    "isunique" => false,
                    "label" => "Status",
                    "mandatory" => false,
                    "name" => "status",
                    "nullable" => true,
                    "quickcreate" => false,
                    "summaryfield" => false,
                    "type" => %{"length" => "1", "name" => "integer"}
                  },
                  %{
                    "data" => "",
                    "dblabel" => "Source",
                    "default" => "",
                    "editable" => false,
                    "headerfield" => false,
                    "isunique" => false,
                    "label" => "Source",
                    "mandatory" => false,
                    "name" => "source",
                    "nullable" => true,
                    "quickcreate" => false,
                    "summaryfield" => false,
                    "type" => %{"length" => "100", "name" => "string"}
                  },
                  %{
                    "data" => "",
                    "dblabel" => "Sticky Note",
                    "default" => "",
                    "editable" => true,
                    "headerfield" => false,
                    "isunique" => false,
                    "label" => "Sticky Note",
                    "mandatory" => false,
                    "name" => "isstickynote",
                    "nullable" => true,
                    "quickcreate" => false,
                    "summaryfield" => false,
                    "type" => %{"length" => "1", "name" => "boolean"}
                  },
                  %{
                    "data" => "",
                    "dblabel" => "Assigned To",
                    "default" => "",
                    "editable" => true,
                    "headerfield" => false,
                    "isunique" => false,
                    "label" => "Assigned To",
                    "mandatory" => true,
                    "name" => "assigned_user_id",
                    "nullable" => false,
                    "quickcreate" => true,
                    "summaryfield" => true,
                    "type" => %{"length" => "19", "name" => "owner"}
                  },
                  %{
                    "data" => "",
                    "dblabel" => "Related To",
                    "default" => "",
                    "editable" => true,
                    "headerfield" => false,
                    "isunique" => false,
                    "label" => "Related To",
                    "mandatory" => false,
                    "name" => "related_to",
                    "nullable" => true,
                    "quickcreate" => true,
                    "summaryfield" => false,
                    "type" => %{
                      "length" => "19",
                      "name" => "reference",
                      "refersTo" => [
                        "Invoice",
                        "SalesOrder",
                        "Quotes",
                        "Documents",
                        "Events",
                        "Approvals",
                        "Calendar",
                        "vtcmcustommodule",
                        "InternalTickets",
                        "Employees",
                        "WorkOrders",
                        "Services",
                        "vtcmcomments",
                        "PhoneCalls",
                        "WebPages",
                        "ProcessDesigner",
                        "Contacts",
                        "Accounts",
                        "Potentials",
                        "ServiceContracts"
                      ]
                    }
                  },
                  %{
                    "data" => "",
                    "dblabel" => "Creator",
                    "default" => "",
                    "editable" => false,
                    "headerfield" => false,
                    "isunique" => false,
                    "label" => "Creator",
                    "mandatory" => false,
                    "name" => "creator",
                    "nullable" => false,
                    "quickcreate" => false,
                    "summaryfield" => false,
                    "type" => %{
                      "length" => "19",
                      "name" => "reference",
                      "refersTo" => ["Users"]
                    }
                  },
                  %{
                    "data" => "",
                    "dblabel" => "Created Time",
                    "default" => "",
                    "editable" => false,
                    "headerfield" => false,
                    "isunique" => false,
                    "label" => "Created Time",
                    "mandatory" => false,
                    "name" => "createdtime",
                    "nullable" => false,
                    "quickcreate" => false,
                    "summaryfield" => false,
                    "type" => %{"length" => "", "name" => "datetime"}
                  },
                  %{
                    "data" => "",
                    "dblabel" => "Modified Time",
                    "default" => "",
                    "editable" => false,
                    "headerfield" => false,
                    "isunique" => false,
                    "label" => "Modified Time",
                    "mandatory" => false,
                    "name" => "modifiedtime",
                    "nullable" => false,
                    "quickcreate" => false,
                    "summaryfield" => false,
                    "type" => %{"length" => "", "name" => "datetime"}
                  },
                  %{
                    "data" => "",
                    "dblabel" => "Related To Comments",
                    "default" => "",
                    "editable" => true,
                    "headerfield" => false,
                    "isunique" => false,
                    "label" => "Related To",
                    "mandatory" => false,
                    "name" => "parent_comments",
                    "nullable" => true,
                    "quickcreate" => false,
                    "summaryfield" => false,
                    "type" => %{
                      "length" => "19",
                      "name" => "reference",
                      "refersTo" => ["ModComments"]
                    }
                  },
                  %{
                    "default" => "",
                    "editable" => false,
                    "label" => "modcommentsid",
                    "mandatory" => false,
                    "name" => "id",
                    "nullable" => false,
                    "type" => %{"length" => "19", "name" => "autogenerated"}
                  }
                ],
                "idPrefix" => "28",
                "inactivefields" => [],
                "isEntity" => true,
                "label" => "ModComments",
                "labelFields" => "commentcontent",
                "name" => "ModComments",
                "retrieveable" => true,
                "tools" => [],
                "updateable" => true
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

  test "retrieves a record", context do
    Tesla.Mock.mock(fn
      %{
        method: :get,
        url: "https://example.odx.vtiger.com/restapi/v1/vtiger/default/retrieve",
        query: [
          id: "28x1234567"
        ]
      } ->
        %Tesla.Env{
          status: 200,
          body: %{
            "success" => true,
            "result" => %{
              "commentcontent" => "hello",
              "customer" => "",
              "userid" => "19x12345",
              "reasontoedit" => "",
              "is_private" => "0",
              "customer_email" => "",
              "from_mailroom" => "0",
              "filename" => "",
              "related_email_id" => "0",
              "status" => "0",
              "source" => "WEBSERVICE",
              "isstickynote" => "0",
              "assigned_user_id" => "19x12345",
              "related_to" => "3x123456",
              "creator" => "19x12345",
              "createdtime" => "2023-03-22 16:18:02",
              "modifiedtime" => "2023-03-22 16:18:02",
              "parent_comments" => "",
              "id" => "28x1234567",
              "isclosed" => 0,
              "label" => "test",
              "url" => "https://example.odx.vtiger.com/view/detail?module=ModComments&id=1234567"
            }
          }
        }
    end)

    assert Vtigrex.retrieve(
             context[:client],
             "28x1234567"
           ) ==
             {:ok,
              %{
                "commentcontent" => "hello",
                "customer" => "",
                "userid" => "19x12345",
                "reasontoedit" => "",
                "is_private" => "0",
                "customer_email" => "",
                "from_mailroom" => "0",
                "filename" => "",
                "related_email_id" => "0",
                "status" => "0",
                "source" => "WEBSERVICE",
                "isstickynote" => "0",
                "assigned_user_id" => "19x12345",
                "related_to" => "3x123456",
                "creator" => "19x12345",
                "createdtime" => "2023-03-22 16:18:02",
                "modifiedtime" => "2023-03-22 16:18:02",
                "parent_comments" => "",
                "id" => "28x1234567",
                "isclosed" => 0,
                "label" => "test",
                "url" =>
                  "https://example.odx.vtiger.com/view/detail?module=ModComments&id=1234567"
              }}
  end

  test "creates a record", context do
    Tesla.Mock.mock(fn
      %{
        method: :get,
        url: "https://example.odx.vtiger.com/restapi/v1/vtiger/default/create",
        query: [
          elementType: "ModComments",
          element:
            ~s({"assigned_user_id":"19x12345","commentcontent":"hello","related_to":"3x123456"})
        ]
      } ->
        %Tesla.Env{
          status: 200,
          body: %{
            "success" => true,
            "result" => %{
              "commentcontent" => "hello",
              "customer" => "",
              "userid" => "19x12345",
              "reasontoedit" => "",
              "is_private" => "0",
              "customer_email" => "",
              "from_mailroom" => "0",
              "filename" => "",
              "related_email_id" => "0",
              "status" => "0",
              "source" => "WEBSERVICE",
              "isstickynote" => "0",
              "assigned_user_id" => "19x12345",
              "related_to" => "3x123456",
              "creator" => "19x12345",
              "createdtime" => "2023-03-22 16:18:02",
              "modifiedtime" => "2023-03-22 16:18:02",
              "parent_comments" => "",
              "id" => "28x1234567",
              "isclosed" => 0,
              "label" => "test",
              "url" => "https://example.odx.vtiger.com/view/detail?module=ModComments&id=1234567"
            }
          }
        }
    end)

    assert Vtigrex.create(
             context[:client],
             "ModComments",
             %{
               "commentcontent" => "hello",
               "related_to" => "3x123456",
               "assigned_user_id" => "19x12345"
             }
           ) ==
             {:ok,
              %{
                "commentcontent" => "hello",
                "customer" => "",
                "userid" => "19x12345",
                "reasontoedit" => "",
                "is_private" => "0",
                "customer_email" => "",
                "from_mailroom" => "0",
                "filename" => "",
                "related_email_id" => "0",
                "status" => "0",
                "source" => "WEBSERVICE",
                "isstickynote" => "0",
                "assigned_user_id" => "19x12345",
                "related_to" => "3x123456",
                "creator" => "19x12345",
                "createdtime" => "2023-03-22 16:18:02",
                "modifiedtime" => "2023-03-22 16:18:02",
                "parent_comments" => "",
                "id" => "28x1234567",
                "isclosed" => 0,
                "label" => "test",
                "url" =>
                  "https://example.odx.vtiger.com/view/detail?module=ModComments&id=1234567"
              }}
  end
end
