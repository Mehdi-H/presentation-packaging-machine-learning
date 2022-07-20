!constant ORGANISATION_NAME "Factory-Company"

workspace {

    model {
        group "Plant-🏭" {
            plantOperator = person "Plant Operator"
            AISolution = softwareSystem "Ze AI Solution 🧠" "Web browser"

            plantOperator -> AISolution "Takes photo"
            AISolution -> plantOperator "Predicts quality defects presence and gravity"
        }

        group "AI-&-Quality" {
            crm = softwareSystem "CRM"
        }
    }

    views {
        systemLandscape "${ORGANISATION_NAME}" {
            include *
            autoLayout
        }

        theme default
    }

}