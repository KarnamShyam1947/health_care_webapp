<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>

<%
    String in = (String) session.getAttribute("invoice");
%>
<input type="hidden" id="in" value="<%= in %>">

<t:layout_a>
    <div class="content-wrapper">

        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Add Invoices</h1>
                    </div>
                </div>
            </div>
        </div>


        <div class="content">
            <div class="container-fluid">
                <form action="" method="post">
                    <div class="row g-3">
                        <div class="col">
                            <select class="form-control" name="patient-id" id="select">
                            </select>
                        </div>
                        <div class="col">
                            <input type="text" class="form-control" name="gst" placeholder="Enter gst(%)">
                        </div>
                        
                        <div class="col">
                            <input type="text" class="form-control" name="discount" placeholder="Enter discount(%)">
                        </div>

                        <button id="addButton" type="button" class="btn btn-success">Add items</button>
                    </div>

                    <div class="container-fluid mt-3" id="inputs">

                    </div>

                    
                    <input type="submit" value="Add Invoice" class="btn btn-primary">
                </form>
            </div>
        </div>

    </div>

    <script>
        let addButton = document.getElementById("addButton");
        let inputs = document.getElementById("inputs");

        addButton.onclick = () => {
            let inputContainer = document.createElement("div");
            inputContainer.classList.add("mt-2");                
            inputContainer.classList.add("row");                
            inputContainer.classList.add("g-3");                

            let nameCont = document.createElement("div");
            nameCont.classList.add("col-3");

            let desCont = document.createElement("div");
            desCont.classList.add("col-4");

            let qtyCont = document.createElement("div");
            qtyCont.classList.add("col-2");

            let priceCont = document.createElement("div");
            priceCont.classList.add("col-2");

            let btnCont = document.createElement("div");
            btnCont.classList.add("col-1");

            let nameField = document.createElement("input");
            nameField.classList.add("form-control");
            nameField.type="text";
            nameField.name="name[]";
            nameField.required=true;
            nameField.placeholder="Enter name";

            let desField = document.createElement("textarea");
            desField.classList.add("form-control");
            desField.name="des[]";
            desField.required=true;
            desField.placeholder="Enter description";

            let qtyField = document.createElement("input");
            qtyField.classList.add("form-control");
            qtyField.type="text";
            qtyField.name="qty[]";
            qtyField.required=true;
            qtyField.placeholder="Enter qty";

            let priceField = document.createElement("input");
            priceField.classList.add("form-control");
            priceField.type="text";
            priceField.name="price[]";
            priceField.required=true;
            priceField.placeholder="Enter price";

            let removeBtn = document.createElement("button");
            removeBtn.classList.add("btn");
            removeBtn.classList.add("btn-danger");
            removeBtn.textContent = "remove";
            removeBtn.type = "button";
            removeBtn.onclick = function() {
                event.target.parentNode.parentNode.remove();
            }

            nameCont.append(nameField);
            desCont.append(desField);
            qtyCont.append(qtyField);
            priceCont.append(priceField);
            btnCont.append(removeBtn);

            inputContainer.append(nameCont);
            inputContainer.append(desCont);
            inputContainer.append(qtyCont);
            inputContainer.append(priceCont);
            inputContainer.append(btnCont);

            inputs.append(inputContainer);
        }

    </script>

    <script>
        let select = document.getElementById("select");

        window.onload = function() {
            let url = "api/all-patients"; 
            fetch(url)
            .then(r => r.json())
            .then(data => {
                console.log(data);
                for(let i = 0; i < data.length; i++) {
                    let option = document.createElement("option");

                    option.value = data[i].patient_id;
                    option.textContent = data[i].name;

                    select.appendChild(option);
                }
            })
            .catch(e => console.log(e));
        }
    </script>

    <script>
        let invoice = document.getElementById("in").value;
        if(invoice === "ok") {
            swal("success", "Invoice added successfully", "success");
        }
    </script>

</t:layout_a>
