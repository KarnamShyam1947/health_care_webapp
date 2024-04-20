<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<t:layout_d>
    <div class="content-wrapper">

        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Dashboard</h1>
                    </div>
                </div>
            </div>
        </div>


        <div class="content">
            <div class="container-fluid">
                <form action="" id="form" method="post" enctype="multipart/form-data">
                    <div class="row mb-3">
                        <div class="col-11">
                            <input type="text" name="pname" class="form-control" value="${user.username}" readonly>
                            <input type="hidden" name="pid" value="${patient.id}">
                        </div>

                        <div class="col-1">
                            <button id="addButton" type="button" class="btn btn-success">Add report</button>
                        </div>
                    </div> 

                    <span>Enter prescription</span>
                    <textarea name="pre" style="width: 100%;" id="editor" rows="10">
                        <c:out value="${patient.prescription}"></c:out>
                    </textarea>


                    <div class="mt-3 card">
                        <span class="fs-4">Available Records</span>
                        <div class="d-flex">
                            <c:forEach var="record" items="${patient.records}">
                                <h5 class="me-3">
                                    <span class="badge text-bg-primary">
                                        <a style="text-decoration: none;" class="text-light" href="${record.urls}">
                                            ${record.name}
                                        </a>
                                    </span>
                                </h5>
                            </c:forEach>

                        </div>
                    </div>

                    <div class="container-fluid mt-3" id="inputs">
                        
                    </div>
                    
                    <input type="submit" value="Add Records" class="mt-3 btn btn-primary">
                </form>
            </div>
        </div>

    </div>

    <script>
        let addButton = document.getElementById("addButton");
        let inputs = document.getElementById("inputs");
        let urls = document.getElementById("urls");
        let form = document.getElementById("form");
        let cnt = 0;

        addButton.onclick = () => {
            let inputContainer = document.createElement("div");
            inputContainer.classList.add("mt-2");                
            inputContainer.classList.add("row");                
            inputContainer.classList.add("g-3");
            cnt = cnt + 1;                

            let nameCont = document.createElement("div");
            nameCont.classList.add("col-5");

            let desCont = document.createElement("div");
            desCont.classList.add("col-5");

            let btnCont = document.createElement("div");
            btnCont.classList.add("col-2");

            let nameField = document.createElement("input");
            nameField.classList.add("form-control");
            nameField.type="text";
            nameField.name="name[]";
            nameField.required=true;
            nameField.placeholder="Enter name";

            let desField = document.createElement("input");
            desField.classList.add("form-control");
            desField.type="file";
            desField.name="files[]";
            desField.required=true;

            let removeBtn = document.createElement("button");
            removeBtn.classList.add("btn");
            removeBtn.classList.add("btn-danger");
            removeBtn.textContent = "remove";
            removeBtn.type = "button";
            removeBtn.onclick = function() {
                cnt = cnt - 1;
                event.target.parentNode.parentNode.remove();
            }

            nameCont.append(nameField);
            desCont.append(desField);
            btnCont.append(removeBtn);

            inputContainer.append(nameCont);
            inputContainer.append(desCont);
            inputContainer.append(btnCont);

            inputs.append(inputContainer);
        }

        form.onsubmit = function(e) {
            e.preventDefault();
            
            if(cnt == 0) {
                swal("Error", "Please select at least one report to upload", "error");
            }
            else {
                console.log("loading.....");

                let formData = new FormData(form);

                let res = uploadFiles(formData);
            }
        }

        function uploadFiles(formData) {
            fetch("http://127.0.0.1:5000/upload/multi-file", {
                method: 'POST',
                body: formData
            })
            .then(r => r.json())
            .then(res => {
                console.log(res);
                Object.keys(res).forEach((key) => {
                    let inp = document.createElement("input");
                    inp.type = "hidden";
                    inp.name = "names[]";
                    inp.value = key;
                    
                    let inp1 = document.createElement("input");
                    inp1.type = "hidden";
                    inp1.name = "urls[]";
                    inp1.value = res[key];

                    inputs.appendChild(inp);
                    inputs.appendChild(inp1);

                });

                form.submit();
            })
            .catch(e => {
                console.log(e);
            });

        }

    </script>

    <script>
        CKEDITOR.replace('editor');
        CKEDITOR.editorConfig = function( config ) {

            config.language = 'en';
            
            config.extraPlugins = 'jsplus_image_editor';
            
            config.toolbar = 'custom';
            config.toolbar_custom = [
                { name: 'clipboard', groups: [ 'clipboard', 'undo' ], items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
                { name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ], items: [ 'Scayt' ] },
                { name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
                { name: 'insert', items: [ 'Image', 'Table', 'HorizontalRule', 'SpecialChar' ] },
                { name: 'tools', items: [ 'Maximize' ] },
                { name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [ 'Source' ] },
                { name: 'others', items: [ '-' ] },
                '/',
                { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Strike', '-', 'RemoveFormat' ] },
                { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote' ] },
                { name: 'styles', items: [ 'Styles', 'Format' ] },
                { name: 'about', items: [ 'About' ] },
                { name : 'new_group', items: ['jsplus_image_editor'] }
            ];}
    </script>
</t:layout_d>