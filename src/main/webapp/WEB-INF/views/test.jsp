<%@taglib tagdir="/WEB-INF/tags" prefix="t" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>

<t:layout>
    <main>
        <table class="table table-hover ">
            <thead>
                <tr>
                    <th>#id</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td>1</td>
                    <td>KarnamShyam1947</td>
                    <td>karnamshyam9009@gmail.com</td>
                    <td>
                            <a href="#" data-bs-toggle="dropdown">l</a>
                            <div class="dropdown-menu m-0">
                                <a href="blog.html" class="dropdown-item">Blog Grid</a>
                                <a href="detail.html" class="dropdown-item">Blog Detail</a>
                                <a href="team.html" class="dropdown-item">The Team</a>
                                <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                                <a href="appointment.html" class="dropdown-item">Appointment</a>
                                <a href="search.html" class="dropdown-item">Search</a>
                            </div>
                    </td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>KarnamShyam1947</td>
                    <td>karnamshyam9009@gmail.com</td>
                    <td>l</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>KarnamShyam1947</td>
                    <td>karnamshyam9009@gmail.com</td>
                    <td>l</td>
                </tr>
            </tbody>
        </table>
    </main>

    <script>
        fetch("test-ajax")
        // .then(res => res.json())
        .then(data => console.log(data))
        .catch((e) => console.log(e))
    </script>
</t:layout>