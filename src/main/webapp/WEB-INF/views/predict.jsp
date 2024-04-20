<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>

<t:layout>
    <div class="container-fluid pt-5">
        <div class="container">
            <div class="text-center mx-auto mb-5" style="max-width: 500px;">
                <h5 class="d-inline-block text-primary text-uppercase border-bottom border-5">Predict</h5>
                <h1 class=" mb-4">Find The Disease</h1>
                <h5 class="fw-normal">Duo ipsum erat stet dolor sea ut nonumy tempor. Tempor duo lorem eos sit sed ipsum
                    takimata ipsum sit est. Ipsum ea voluptua ipsum sit justo</h5>
            </div>
        </div>
    </div>
    
    <div class="container">
        <label for="file" class="w-100 fs-4  btn btn-secondary">
            select file
        </label>

        <div class="mt-3 d-flex justify-content-center">
            <img src="" class="d-block " id="img">
        </div>

        <div class="mt-3 d-flex justify-content-center">
            <button id="submitBtn" class="btn btn-success fs-5">predict</button>
        </div>

        <div class="d-flex justify-content-center">
            <div id="spinner" class="spinner-border text-success" style="width: 3rem; height: 3rem;" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
        </div>

        <div id="result" class="d-flex text-center fs-3 justify-content-center">
            Class : ClassName <br>
            score : 95.99%
        </div>
        <form id="form">
            <input style="display: none; " type="file" name="image" id="file">
        </form>
    </div>

    <script>
        let img = document.getElementById("img");
        let form = document.getElementById("form");
        let file = document.getElementById("file");
        let result = document.getElementById("result");
        let spinner = document.getElementById("spinner");
        let submitBtn = document.getElementById("submitBtn");

        spinner.style.display = "none";
        submitBtn.style.display = "none";
        result.innerHTML = "";
        
        file.onchange = function() {
            result.innerHTML = "";
            img.removeAttribute("src");

            if(file.files[0].type.includes("image")) {
                renderImage();
            }
            else {
                result.innerHTML = "ERROR : Please select only images(.jpg, .png, .jpeg)"
            }
        }

        function renderImage() {
            let imgFile = file.files[0];
            let reader = new FileReader();
            reader.readAsDataURL(imgFile);

            reader.onload = function() {
                img.setAttribute("src", reader.result);
                submitBtn.style.display = "block";
            }
        }

        submitBtn.onclick = function() {
            submitBtn.style.display = "none";
            spinner.style.display = "block";

            let abortController = new AbortController();
            let signal = abortController.signal;

            setInterval(() => {
                abortController.abort();
            }, 3000);

            fetch("http://localhost:5000/predict/brain_tumor", {
                method: 'POST',
                body: new FormData(form),
                signal: signal
            })
            .then(r => r.json())
            .then(res => {
                spinner.style.display = "none";
                console.log(res);
                result.innerHTML = "Class : " + res.class + " <br> Score : " + res.score;
            })
            .catch(e => {
                if(e.name == 'AbortError') {
                    spinner.style.display = "none";
                    result.innerHTML = "Error : Please check your internet and try again or server is taking long time to respond"
                }
                else {
                    console.log(e);
                    spinner.style.display = "none";
                    result.innerHTML = "Under development"
                }
            });
        }
    </script>
</t:layout>
